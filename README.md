# ASM-Modules
The .bbpmod files can be directly installed inside Bowser's Blueprints in the 'ASM Modules' menu, and added with a click.
But for some of the ones shared here, you must modify a few things to use them, specially for the title area.


Bowser's Blueprints ASM-Modules offer a way to make assembly patches that do not overwrite each other, or patches that have to overwrite random code in vanilla. They also allow multiple modules to hook into the same address by chaining them together, which made these modules super easy to share :).

The folders contain the actual code. How this code will be imported into the rom is determined by the module.json file in each folder, code may overwrite something, but for the most part, it will be imported into free space.
