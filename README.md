# ASM-Modules and Tweaks
__________________________
To use the asm-modules, the .bbpmod files should be installed in the 'ASM Modules' menu, and then added from the library with 'Add Module'.
For some of the ones shared here, you must modify a few things to use them, specially for the title area.

Since ASM-Modules are all super modular, all of them can be used together and are currently fully compatible with all the default ASM-Modules included in BBP.
__________________________
For the tweaks, install 'extra-tweaks-pack_1.0.0.json' in the 'Tweaks' menu using the 'Manage Tweak Packs' option. All of these tweaks are harmless as Bowser's Blueprints can easily revert tweaks for you, so they can be played around with.


__________________________
Bowser's Blueprints ASM-Modules offer a way to make assembly patches that do not overwrite each other, or a way to not make patches that overwrite random code in vanilla. They also allow multiple modules to hook into the same address by chaining them together, which made these modules super easy to create and share :).

The folders contain the actual code. How this code will be imported into the rom is determined by the module.json file in each folder, code may overwrite something, but for the most part, it will be imported into free space and hooked to an address, or to one of the predetermined values (from the official asm-module-guide):

"MarioStepBegin" - Runs your code just before each iteration of Mario's behaviour script

"MarioStepEnd" - Runs your code just after each iteration of Mario's behaviour script

"LevelLoad" - Runs your code when a new level loads

"AreaLoad" - Runs your code when an area loads

"GameStart" - Runs your code once when the game starts

"RenderHUD" - Runs your code just after the HUD renders

"FrameEnd" - Runs your code at the end of each frame

"MarioAction" - Runs your code to execute a custom Mario action


The documentation for ASM-Modules and Tweaks:

https://blueprint64.ca/doc/asm-module-guide.html

https://blueprint64.ca/doc/tweak-guide.html
