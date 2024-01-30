# ASM-Modules
To use these, the .bbpmod files should be installed in the 'ASM Modules' menu, and then added from the library with 'Add Module'.
For some of the ones shared here, you must modify a few things to use them, specially for the title area.

__________________________
Bowser's Blueprints ASM-Modules offer a way to make assembly patches that do not overwrite each other, or patches that have to overwrite random code in vanilla. They also allow multiple modules to hook into the same address by chaining them together, which made these modules super easy to create and share :).

The folders contain the actual code. How this code will be imported into the rom is determined by the module.json file in each folder, code may overwrite something, but for the most part, it will be imported into free space and hooked to an address.

The documentation for ASM-Modules and Tweaks:
  https://blueprint64.ca/doc/asm-module-guide.html
  https://blueprint64.ca/doc/tweak-guide.html
