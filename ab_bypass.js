// AutoBypass A/B — core logic for Max for Live audio effect
// Lets user pick a subset of devices on the current track and toggle their
// is_active state together for hands-free A/B comparison.
//
// Inlet messages:
//   scan                  — rescan track devices
//   ab                    — flip A/B state
//   state A | state B     — force state
//   sel <idx>             — toggle selection of device at idx
//   <int>                 — same as "sel <int>" (umenu sends an int on click)
//   selall                — select every device
//   clearall              — clear selection
//   auto 0|1              — enable/disable auto toggle indicator
//
// Outlets:
//   0 — messages to the device umenu (clear / append <label>)
//   1 — A/B label target (set A|B)
//   2 — count label target (set "<n> selected")

autowatch = 1;
inlets = 1;
outlets = 3;

var thisDeviceId = 0;
var trackId = 0;
var devices = []; // [{ id, name, selected }]
var state = "A";

function loadbang() {
	// Defer so Live API is ready; live.thisdevice also drives this.
	scan();
}

function init() {
	scan();
}

function resolveSelf() {
	var self = new LiveAPI("this_device");
	thisDeviceId = parseInt(self.id);
	var track = new LiveAPI("this_device canonical_parent");
	trackId = parseInt(track.id);
}

function scan() {
	resolveSelf();
	if (!trackId) {
		post("AutoBypass: could not resolve track\n");
		return;
	}
	// Preserve prior selection by device id so rescans don't lose picks.
	var prevSel = {};
	for (var i = 0; i < devices.length; i++) {
		prevSel[devices[i].id] = devices[i].selected;
	}

	devices = [];
	var track = new LiveAPI("id " + trackId);
	var raw = track.get("devices"); // ["id", n, "id", n, ...]
	for (var j = 0; j < raw.length; j += 2) {
		var id = parseInt(raw[j + 1]);
		if (!id || id === thisDeviceId) continue;
		var d = new LiveAPI("id " + id);
		var nm = d.get("name");
		var name = (nm && nm.length) ? nm.toString() : "device " + id;
		devices.push({
			id: id,
			name: name,
			selected: prevSel[id] === true
		});
	}
	redrawMenu();
	updateCount();
	post("AutoBypass: " + devices.length + " device(s) on track\n");
}

function redrawMenu() {
	outlet(0, "clear");
	for (var i = 0; i < devices.length; i++) {
		var mark = devices[i].selected ? "[x] " : "[ ] ";
		outlet(0, "append", mark + devices[i].name);
	}
}

function updateCount() {
	var n = 0;
	for (var i = 0; i < devices.length; i++) if (devices[i].selected) n++;
	outlet(2, "set", n + " / " + devices.length + " selected");
}

function sel(idx) {
	idx = parseInt(idx);
	if (isNaN(idx) || idx < 0 || idx >= devices.length) return;
	devices[idx].selected = !devices[idx].selected;
	redrawMenu();
	updateCount();
	// Re-apply current state so newly-selected devices conform.
	applyState();
}

function msg_int(v) {
	sel(v);
}

function selall() {
	for (var i = 0; i < devices.length; i++) devices[i].selected = true;
	redrawMenu();
	updateCount();
	applyState();
}

function clearall() {
	// Before clearing, make sure we don't leave any device stuck bypassed.
	restoreAll();
	for (var i = 0; i < devices.length; i++) devices[i].selected = false;
	redrawMenu();
	updateCount();
}

function restoreAll() {
	for (var i = 0; i < devices.length; i++) {
		var d = new LiveAPI("id " + devices[i].id);
		if (d.id != 0) d.set("is_active", 1);
	}
}

function state(s) {
	var next = (s + "").toUpperCase() === "B" ? "B" : "A";
	if (next !== state) {
		state = next;
	}
	applyState();
	outlet(1, "set", state);
}

function ab() {
	state(state === "A" ? "B" : "A");
}

function applyState() {
	var active = state === "A" ? 1 : 0;
	for (var i = 0; i < devices.length; i++) {
		if (!devices[i].selected) continue;
		var d = new LiveAPI("id " + devices[i].id);
		if (d.id != 0) d.set("is_active", active);
	}
	outlet(1, "set", state);
}

function auto(v) {
	// Purely cosmetic hook — the metro in the patcher handles timing.
	// Here we just log so you can confirm wiring.
	post("AutoBypass: auto " + (v ? "on" : "off") + "\n");
}
