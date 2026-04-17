# AutoBypass AB

Max for Live audio effect for **hands-free A/B comparison of specific plugins** on an Ableton track.

Example: your chain is `EQ → Distortion → Reverb`. Drop AutoBypass AB on the track, tick only Reverb, hit **A/B** — you hear the track with the EQ and distortion still on but reverb gone. Tick multiple to bypass them together. Unticked devices are never touched.

Works anywhere on the chain (it controls devices by ID, not by position).

---

## Requirements

- **Ableton Live Suite** (10/11/12) — includes Max for Live. Or Live Standard + Max for Live add-on.
- macOS or Windows.

## Install (one-time build — ~1 minute)

This repo ships the source (`.maxpat` + `.js`). You'll turn it into a usable `.amxd` inside Live the first time. Heads up: the author shipped this without a Max install so **you're the first test** — if something looks off, see "What to send back" below.

1. `git clone https://github.com/sahilmodi1965/autobypass-ab.git` (or download the ZIP and unzip somewhere stable — don't move the folder later).
2. In Ableton, drag a **Max Audio Effect** onto any audio track.
3. Click the **edit (✎)** button on the device — Max opens an empty device window.
4. In Max: **File → Open…** and pick `AutoBypassAB.maxpat` from the cloned folder.
5. **Cmd-A** then **Cmd-C** to copy all objects.
6. Switch back to the empty device window, click inside the patcher, select the default `plugin~` and `plugout~` boxes (if present), delete them.
7. **Cmd-V** to paste.
8. Click the **Freeze** button (snowflake icon, top of the Max toolbar). This embeds `ab_bypass.js` into the device so it travels with the `.amxd`.
9. **File → Save** → name it `AutoBypass AB.amxd` → save to `~/Music/Ableton/User Library/Presets/Audio Effects/Max Audio Effect/` so it shows up in the Live browser permanently.

After this, you just drag **AutoBypass AB** from the Live browser like any other device.

> If the Max Console (**Window → Max Console**) shows `js: ab_bypass.js: no such file` before you freeze, `ab_bypass.js` isn't on Max's search path. Fix: keep `ab_bypass.js` in the same folder as `AutoBypassAB.maxpat` when you do step 4.

---

## How to test it

**Setup a control case:**

1. Drop a looping audio clip on an audio track (drums, loop, whatever).
2. Add these in order on the same track: **EQ Eight**, **Saturator**, **Reverb** (or any distortion/reverb you like).
3. Drag **AutoBypass AB** onto the end of the chain. Position doesn't actually matter — try it in the middle too.

**Core test — single device:**

4. Click **Scan** on the device. The dropdown should list *EQ Eight*, *Saturator*, *Reverb*.
5. Click *Reverb* in the dropdown — it should now show `[x] Reverb`. Count readout should show `1 / 3 selected`.
6. Start playback. Click **A / B**. The big readout flips `A → B`. You should hear the reverb drop out, everything else unchanged. Click again, reverb comes back.

**Multi-device test:**

7. Click *Saturator* and *Reverb* both — `[x] Saturator`, `[x] Reverb`, `2 / 3 selected`.
8. **A / B**: you should hear only EQ Eight processing, with distortion and reverb gone together.

**Auto mode:**

9. Click **Auto** (the button turns on).
10. The metro toggles at the rate you set. Start at 1000 ms. Try 250 ms for fast flips.

**Edge cases worth checking:**

- Add or remove a device on the track, then hit **Scan** again — the list should update and your previous selections should still be remembered for devices that are still there.
- Move the AutoBypass device up and down the chain — it should keep working.
- Put it on a **group/return** track — does Scan see the right devices?
- Hit **None** while state is `B` — all devices get restored to active (so you don't leave anything stuck bypassed).

## What to send back if something's off

- Which step above failed.
- Max Console output: **Max window → Window → Max Console** (or **Window → Console** in newer Max). Screenshot or paste any red lines.
- Live version + Max version (Max → About Max).
- If it's a feature ask: beat-synced rate? crossfade instead of hard switch? saved presets of which devices to A/B?

---

## Files in this repo

- `AutoBypassAB.maxpat` — the Max patcher (UI + wiring).
- `ab_bypass.js` — all the Live API logic (scan, toggle, selection state).
