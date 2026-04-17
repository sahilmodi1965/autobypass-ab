# AutoBypass AB

Max for Live audio effect for **hands-free A/B comparison of specific plugins** on an Ableton track.

Example: your chain is `EQ → Distortion → Reverb`. Drop AutoBypass AB on the track, tick only Reverb, hit **A/B** — you hear the track with the EQ and distortion still on but reverb gone. Tick multiple to bypass them together. Unticked devices are never touched.

Works anywhere on the chain (it controls devices by ID, not by position).

---

## Requirements

- Ableton Live 10/11/12 **Suite**, or Live Standard + Max for Live add-on.
- macOS or Windows.

## Install — easy path (if `AutoBypass AB.amxd` is in the repo)

1. Download `AutoBypass AB.amxd`.
2. Drop it into `~/Music/Ableton/User Library/Presets/Audio Effects/Max Audio Effect/` (or anywhere in your User Library).
3. In Ableton, find it in the browser and drag onto any audio track.

## Install — from source (`.maxpat` + `.js`)

Use this path if you want to edit the device or the `.amxd` isn't in the repo yet.

1. `git clone` this repo (or download ZIP).
2. In Ableton, drag a **Max Audio Effect** onto an audio track.
3. Click the **edit (✎)** button on the device — Max opens an empty device window.
4. In Max: **File → Open…** and pick `AutoBypassAB.maxpat`.
5. **Cmd-A** then **Cmd-C** to copy all objects.
6. Switch to the empty device window, select the default `plugin~` and `plugout~`, **delete** them.
7. **Cmd-V** to paste.
8. Click the **Freeze** button (snowflake icon in the Max toolbar). This embeds `ab_bypass.js` inside the device so you can move it around without losing the script.
9. **File → Save** and name it `AutoBypass AB.amxd`.

> If after step 8 the Max Console shows `js: ab_bypass.js: no such file`, the `.js` isn't on Max's search path. Put `ab_bypass.js` next to the `.maxpat` before opening, or add its folder via **Options → File Preferences → search paths**.

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
- `AutoBypass AB.amxd` — frozen, drag-and-drop device *(only present if Sahil committed a build)*.
