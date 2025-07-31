# mc-player-scheduling
utility to create per-player Minecraft server access schedules

This utility:
- runs on Linux using Bash
- schedules itself to run with crontab
- relies on screen to pass commands to the Minecraft process

dependencies/requirements:
  screen

We expect to have the following files:

  config.txt
  - ideally, the only place the user needs to enter information
  - includes player names and their time limits
  - includes MC server log location (if using at all) and screen name
    
  dynamic.txt
  - file used only by the scripts for variable storage
  - should be created by Install.sh

  install-config.txt
  - installation options & sensible defaults
  - including install location, crontab file, and check and reset intervals

  Reset-Status.sh
  - script that runs on a preconfigured schedule and resets all players' time played
  
  Install.sh
  - responsible for copying scripts to the install location, building folder structure, scheduling tasks, and creating key files
  - should only need to be run once, at initial setup
  - reads the install location from install-config.txt
  - creates a folder titled "Actions" for the playername_pardon.sh and playername_ban.sh scripts
(there is an actual reason to create scripts per player, as this enables additional functionality that is out of scope at present)
  - creates dynamic.txt but leaves it empty

  Playerlist-Update.sh
  - called by Install.sh as part of initial setup
  - can be executed again by the admin to update for new or removed players
  - adds per-player variables to dynamic.txt if they do not exist
  - removes variables from dynamic.txt if the player name is not found in config.txt
  - creates playername_ban.sh and playername_pardon.sh for players on the playerlist

  Player-Online-Check.sh
  - runs on a schedule
  - default every 5 minutes
  - scheduled in crontab by Install.sh
  - checks MC server logs or runs (screen minecraft /list) to determine whether each player is online or not
  - updates dynamic.txt to track a rough estimate of each player's time played
  - bans players who meet their time limits
