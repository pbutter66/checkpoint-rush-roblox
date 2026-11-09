# Checkpoint Rush - Roblox game (Phase 1)

My semester project is a small Roblox obstacle course. I am doing this project by myself.

## Open the Roblox place
1. Download **Checkpoint_Rush.rbxlx** (or unzip the folder to get it).
2. Open **Roblox Studio** and sign in.
3. Go to **File > Open from File...** and select **Checkpoint_Rush.rbxlx**.
4. Click **Play**. Follow the floating platforms to the bright yellow-green finish area.
5. Touch the two green checkpoint pads so you respawn from them after falling.
6. In Roblox Studio, **File > Save to File** to save your changes.

The place file already contains the map, spawn point, checkpoints, lava, finish pad, and scripts.
It does **not** need the separate Luau scripts pasted into Studio.

## Where the code is
- `src/server/Game.server.luau` - checkpoint, respawn, finish, leaderstats, and lava logic
- `src/client/HUD.client.luau` - game title, timer and checkpoint labels
- `Checkpoint_Rush.rbxlx` - the actual Roblox place with the code embedded
- `docs/` - planning files, task board, and wireframe for Phase 1

If you change a separate script file, that does NOT automatically update the .rbxlx place. Edit inside Studio, or use a Roblox tool like Rojo later.

## Current scope
- Short jumping course with 8 islands
- 2 working checkpoint pads
- Basic timer and finish detection
- Simple leaderboard showing Wins during this server session
- Fall hazard

Not included yet: coins, shop, multiple rounds, saved player stats, or persistent leaderboard. Those can be later phases.

## GitHub (quick way)
1. Go to https://github.com/new and create a repository called `checkpoint-rush-roblox`.
2. Download and unzip the **Checkpoint_Rush_GitHub.zip** archive if you haven't already.
3. On the new repository page, click **Add file > Upload files**.
4. Drag in `Checkpoint_Rush.rbxlx`, `README.md`, `.gitignore`, the two scripts in `src/`, and the planning files in `docs/` (or drag the extracted folder contents using your file picker).
5. Commit the changes and copy the repository link into your Phase 1 Google Doc.

If GitHub's website won't preserve nested folders using drag and drop, upload the main place + README first. You can add script folders later with Git commands.

## Notes
I generated the Roblox XML file and checked that it parses and contains the scripts and parts. I could not run Roblox Studio in this environment, so open it in Studio and press Play before claiming that you tested it. Keep a screenshot of the scene for the class document.
