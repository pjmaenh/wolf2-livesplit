# LiveSplit Autosplitter for Wolfenstein II: The New Colossus

LoadRemover and Autosplitter for Wolfenstein II: The New Colossus (Steam version)

This version works with both the downpatched version from November 15th, 2017 as the latest version (current build is from november 21st, 2018).

Current functionality:
- Automatic load time removal (when comparing against game time)
- Automatic start timer when loading in wheelchair level
- Autosplits between sections, including end section
- Individual splits can be turned on or off in the advanced settings

## Getting started

Download `wolf2.asl` and use it in LiveSplit for autosplitting, using a file with 26 splits.

The `wolf2.lss` LiveSplit file can be used as a starting point for the splits, just configure `wolf2.asl` as autosplitter in the Splits Editor and you are good to go. Within the advanced settings, you can turn on or off individual splits.

When connecting the autosplitter, you can choose to have the autostart and livesplit functionality enabled or disabled.

## Notes

- This file is designed and only tested for runs that use the Wyatt timeline. The Fergus timeline is untested and might require some changes for the autosplitter to work. For a 100% run, the autosplitter will not work as expected.
- If you only want load time removal and no autostart and autosplits, `wolf2_ltronly.lss` can be used instead as a lightweight version.
- The final split (endtime) happens around 2 seconds after giving the input, so 2 seconds can be subtracted from the final time in LiveSplit.
- If you want support for any other build of the game added, feel free to create a GitHub issue.

This is an updated version of the autosplitter by [itsjabo](https://github.com/itsjabo).

Special thanks to [83kY](https://www.twitch.tv/83ky) for testing, helping me to figure out how to create the autospliter file, and for providing me with save files for testing and debugging.