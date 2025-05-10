import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IItemCondition;
import mods.immersiveengineering.MetalPress;
import crafttweaker.item.IItemTransformer;

var Coalinputs = [<minecraft:coal>, <hbm:powder_coal>] as IItemStack[];
var Ironinputs = [<hbm:powder_iron>, <libvulpes:productdust:1>, <immersiveengineering:metal:18>, <minecraft:iron_ingot>, <immersiveengineering:metal>] as IItemStack[];
var Steelmergeables = [<immersiveengineering:metal:39>, <libvulpes:productingot:6>] as IIngredient[];
var Platecontrol = {
  // Ingot : Plate
  // Key : Name[Key]
  <abyssalcraft:cingot> : <abyssalcraft:platec>,
  <abyssalcraft:dreadiumingot> : <abyssalcraft:dreadplate>,
  <betterwithmods:material:14> :<betterwithmods:material:51>,
  <minecraft:iron_ingot> : <hbm:plate_iron>,
  <minecraft:gold_ingot> : <hbm:plate_gold>,
  <ore:ingotAluminum> : <hbm:plate_aluminium>,
  <ore:ingotTitanium> : <hbm:plate_titanium>,
  <ore:ingotCopper> : <hbm:plate_copper>,
  <hbm:ingot_combine_steel> : <hbm:plate_combine_steel>,
  <hbm:ingot_advanced_alloy> : <hbm:plate_advanced_alloy>,
  <ore:ingotSteel> : <hbm:plate_steel>,
  <ore:ingotLead> : <hbm:plate_lead>,
  <hbm:ingot_schrabidium> : <hbm:plate_schrabidium>,
  <ore:ingotSilver> : <immersiveengineering:metal:33>,
  <hbm:ingot_saturnite> : <hbm:plate_saturnite>,
  <immersiveengineering:metal:7> : <immersiveengineering:metal:37>,
  <immersiveengineering:metal:6> : <immersiveengineering:metal:36>,
  <ore:ingotUranium> : <immersiveengineering:metal:35>,
  <ore:ingotNickel> : <immersiveengineering:metal:34>,
  <ore:ingotTungsten> : <immersiveintelligence:material_plate:3>,
  <ore:ingotPlatinum> : <immersiveintelligence:material_plate:2>,
  <ore:ingotBrass> : <immersiveintelligence:material_plate:1>,
  <ore:ingotAdvancedElectronicAlloy> : <immersiveintelligence:material_plate>,
  <ore:ingotIridium> : <libvulpes:productplate:10>,
  <ore:ingotDuraluminium> : <immersiveintelligence:material_plate:7>,
  <ore:ingotZinc> : <immersiveintelligence:material_plate:4>,
  <ore:ingotTitaniumAluminide> : <advancedrocketry:productplate>,
  <ore:ingotTitaniumIridium> : <advancedrocketry:productplate:1>,
  <ore:ingotSilicon> : <libvulpes:productplate:3>,
  <ore:ingotTin> : <libvulpes:productplate:5>,
  <ore:ingotTitanium> : <libvulpes:productplate:7>,
  <ore:rubberRaw> : <immersiveintelligence:material_plate:6>,
  <immersiveintelligence:material:26> : <immersiveintelligence:material:27>
} as IItemStack[IIngredient];
var Wirecontrol = {
  // Ingot : Wire
  // Key : Name[Key]
  <ore:ingotCopper> : <hbm:wire_copper>*8,
  <ore:ingotElectrum> : <immersiveengineering:material:21>*8,
  <ore:ingotAluminum> : <hbm:wire_aluminium>*8,
  <ore:ingotSteel> : <immersiveengineering:material:23>*8,
  <ore:ingotTungsten> : <hbm:wire_tungsten>*8,
  <ore:ingotBrass> : <immersiveintelligence:material_wire:1>*8,
  <ore:ingotMingrade> : <hbm:wire_red_copper>*8,
  <ore:ingotGold> : <hbm:wire_gold>*8,
  <ore:ingotSchrabidium> : <hbm:wire_schrabidium>*8
} as IItemStack[IIngredient];
furnace.remove(<minecraft:iron_ingot>*2, <hbm:crystal_iron>);
furnace.addRecipe(<minecraft:iron_ingot>*10, <hbm:crystal_iron>);

for key in Platecontrol {
    mods.ntm.Press.addRecipe(Platecontrol[key], key, 2);
    recipes.remove(Platecontrol[key]);
    mods.immersiveengineering.MetalPress.removeRecipe(Platecontrol[key]);
    mods.immersiveengineering.MetalPress.addRecipe(Platecontrol[key], key, <hbm:stamp_desh_plate>, 2000);
    mods.advancedrocketry.RecipeTweaker.forMachine("PrecisionAssembler").remover().addOutputs(Platecontrol[key]).remove();
}

for key in Wirecontrol {
    mods.ntm.Press.addRecipe(Wirecontrol[key], key, 3);
    recipes.remove(Wirecontrol[key]);
    mods.immersiveengineering.MetalPress.removeRecipe(Wirecontrol[key]);
    mods.immersiveengineering.MetalPress.addRecipe(Wirecontrol[key], key, <hbm:stamp_desh_wire>, 2000);
    mods.ntm.Anvil.removeRecipe([Wirecontrol[key]]);
}

mods.immersiveengineering.Blueprint.removeRecipe(<immersiveengineering:mold>);
mods.immersiveengineering.Blueprint.removeRecipe(<immersiveengineering:mold:4>);
mods.immersiveengineering.Blueprint.removeRecipe(<hbm:template_folder>);
mods.jei.JEI.removeAndHide(<immersiveengineering:mold>);
mods.jei.JEI.removeAndHide(<immersiveengineering:mold:4>);
mods.jei.JEI.removeAndHide(<hbm:template_folder>);

recipes.remove(<hbm:stamp_desh_flat>);
recipes.remove(<hbm:stamp_iron_flat>);
recipes.addShaped("Deshplate", <hbm:stamp_desh_flat>,
 [[null,<minecraft:redstone>,null],
  [<minecraft:brick>,<minecraft:brick>,<minecraft:brick>],
  [<minecraft:iron_ingot>,<minecraft:iron_ingot>,<minecraft:iron_ingot>]]
);
<hbm:stamp_desh_flat>.displayName = "Metal Press Mold: Flat";
<hbm:stamp_desh_plate>.displayName = "Metal Press Mold: Plate";
<hbm:stamp_desh_wire>.displayName = "Metal Press Mold: Wire";
<rats:feral_bagh_nakhs>.addTooltip("Pronounced \"Bok - Knocks\"");
mods.immersiveengineering.MetalPress.removeRecipe(<immersiveengineering:metal:40>);
mods.immersiveengineering.MetalPress.removeRecipe(<immersiveengineering:metal:30>);
mods.immersiveengineering.MetalPress.removeRecipe(<immersiveengineering:metal:38>);
mods.immersiveengineering.MetalPress.removeRecipe(<immersiveengineering:metal:31>);
mods.immersiveengineering.MetalPress.removeRecipe(<immersiveengineering:metal:32>);
mods.immersiveengineering.MetalPress.removeRecipe(<immersiveengineering:material:20>);
mods.immersiveengineering.MetalPress.removeRecipe(<immersiveengineering:material:22>);
mods.immersiveengineering.MetalPress.removeRecipe(<immersiveintelligence:material_wire>);

// Removes anvil plate recipes
mods.ntm.Anvil.removeRecipe([<hbm:plate_iron>]);
mods.ntm.Anvil.removeRecipe([<hbm:plate_copper>]);
mods.ntm.Anvil.removeRecipe([<hbm:plate_titanium>]);
mods.ntm.Anvil.removeRecipe([<hbm:plate_aluminium>]);
mods.ntm.Anvil.removeRecipe([<hbm:plate_gold>]);
mods.ntm.Anvil.removeRecipe([<hbm:plate_lead>]);
mods.ntm.Anvil.removeRecipe([<hbm:plate_steel>]);
mods.ntm.Anvil.removeRecipe([<hbm:plate_advanced_alloy>]);
mods.ntm.Anvil.removeRecipe([<hbm:plate_combine_steel>]);
mods.ntm.Anvil.removeRecipe([<hbm:plate_saturnite>]);
mods.ntm.Anvil.removeRecipe([<hbm:plate_schrabidium>]);

recipes.addShaped("Edited copper cable", <immersiveengineering:wirecoil>*4,
 [[null,<hbm:wire_copper>,null],
  [<hbm:wire_copper>,<ore:stickWood>,<hbm:wire_copper>],
  [null,<hbm:wire_copper>,null]]);
recipes.remove(<immersiveengineering:wirecoil>);

recipes.addShaped("Edited e tubes", <immersiveengineering:toolupgrade:6>,
[[null,null,null],
  [<immersiveengineering:material:26>,<immersiveengineering:material:26>,<immersiveengineering:material:26>],
  [<ore:stickSteel>,<hbm:wire_copper>,<ore:stickSteel>]]
 );
recipes.remove(<immersiveengineering:toolupgrade:6>);

recipes.addShaped("Edited data cable", <immersiveintelligence:data_wire>,
 [[<ore:dyeWhite>,<hbm:wire_copper>,<ore:dyeWhite>],
  [<hbm:wire_copper>,<immersiveengineering:wirecoil:6>,<hbm:wire_copper>],
  [<ore:dyeWhite>,<hbm:wire_copper>,<ore:dyeWhite>]]);
recipes.remove(<immersiveintelligence:data_wire>);

recipes.addShaped("Edited a scheme", <immersiveintelligence:assembly_scheme>.withTag({recipeItem: {id: "immersiveengineering:material", Count: 4 as byte, Damage: 26 as short}}),
 [[<hbm:wire_copper>,<ore:blockGlass>,<hbm:wire_copper>],
  [<ore:dyeBlue>,<ore:dyeBlue>,<ore:dyeBlue>],
  [<ore:paper>,<ore:paper>,<ore:paper>]]
);

// Steel editor
for a, item in Coalinputs {
    for b, item in Ironinputs{
        mods.ntm.BlastFurnace.removeRecipe(Ironinputs[b], Coalinputs[a]);
        mods.ntm.BlastFurnace.addRecipe(Ironinputs[b], Coalinputs[a], <immersiveengineering:metal:8>*2);
        
        // v This section removes the inverse as the section above ^
        mods.ntm.BlastFurnace.removeRecipe(Coalinputs[a], Ironinputs[b]);
        mods.ntm.BlastFurnace.addRecipe(Coalinputs[a], Ironinputs[b], <immersiveengineering:metal:8>*2);
    }  
}

// Smelt and craft merge ()
for i, item in Steelmergeables{
        recipes.remove(Steelmergeables[i]);
        furnace.remove(Steelmergeables[i]);
} 

// Switching All IE recipes to use NTM's Copper wires
// Specific recipes that result in HBM steel that need to be swapped
mods.ntm.Anvil.removeRecipeByInput([<hbm:deco_steel>]);
mods.ntm.Anvil.removeRecipeByInput([<hbm:solar_mirror>]);
mods.ntm.Anvil.removeRecipeByInput([<hbm:machine_turbine>]);
// mods.ntm.Anvil.addRecipe(IItemStack[] outputs, IIngredient input, int tier);
mods.ntm.Anvil.addRecipe(<immersiveengineering:metal:8>, <hbm:deco_steel>, 1);
mods.ntm.Anvil.addRecipe([<immersiveengineering:metal:8>, <hbm:plate_aluminium>], <hbm:solar_mirror>, 3);
mods.ntm.Anvil.addRecipe([<immersiveengineering:metal:8>*6, <immersiveengineering:metal_decoration0>*2, <hbm:turbine_titanium>], <hbm:machine_turbine>, 3);

// Specific recipes that result in Libvulpes steel that need to be swapped
// None

// BPRESS RECIPES

// I'm trying to get both a and b as inputs into the blast furnace recipe