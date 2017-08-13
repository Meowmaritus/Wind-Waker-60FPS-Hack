# Wind Waker 60FPS Hack

See the `INSTRUCTIONS.md` file for instructions on how to use the mod in Dolphin.

Remember that many things are glitchy and function improperly. 
There are MANY ways to softlock the game at various points so make sure to savestate and ingame save often and back up your saves!
Downloading savegame files which are at various points in the game is very helpful for testing this mod.

## Some issues caused by the framerate hack:
* New Game story cinematic visuals play double speed, then displays a black screen until the song finishes playing.
* ***Game-breaking softlock***: Niko fails to land on platform while demonstrating how to jump on them inside the ship, causing his next dialog to never appear.
* Many of the game's scripts are executed twice as often as they should be, which means:
  * Enemies attack twice as often (makes Kalle Demos *almost* impossible to beat, for example)
    * Note that the attack animations themselves play at correct speeds etc; the enemies are just exactly twice as aggressive.
  * Many timers are elapsed at double speed:
    * This causes ***another game-breaking softlock*** in the Earth-temple reminiscent portion of Ganon's Castle before the rematch with Jalhalla (and probably also in the actual Earth Temple), where you must turn a slime to stone and use it to keep a switch pressed, which keeps the path to the boss open. The slime will *always* break out of the stone form before Link has enough time to get through.
* ***Game-breaking softlock***: Game freezes on a blank screen upon entering Molgera's boss room (this includes the one in Ganon's castle). Note: even when forcing entities to only update at 30 Hz to get past the crash, the entire boss arena disappears each frame its not updated, causing a seizure-inducing flickery mess. Also it lags because fuck you


## Included Files
* In the `SOURCE ASM FILES` directory, you can find the actual .asm files i used with the CodeWrite application to generate the Gecko codes from scripts. 
  Most if not all of the scripts are *FULLY DOCUMENTED WITH MANY COMMENTS*.
  Includes many unused test scripts etc.
* In the `EXTRA STUFF` folder, you will find:
  * Various notes I took which contain information about some of the game's memory locations/functions/etc.
  * The demangled symbol map for Wind Waker I used with Dolphin's debugger while developing the hack.
  * The symbol map for the FPS Hack itself.
  * Quite a few old `.ASM` files and lists of Gecko codes with various experiments I did over the course of developing the mod.
    * While they don't help make the game run proprely at 60 FPS they do have many interesting other effects that are worth checking 
      out if you're bored/researching!



#### Wind Waker 60 FPS Mod (c) Meowmaritus 2016-2017
