import mods.immersiveintelligence.PrecisionAssembler;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.immersiveengineering.MetalPress;
import crafttweaker.liquid.ILiquidStack;
import mods.immersiveintelligence.Coagulator;
//Example:
// mods.immersiveengineering.Blueprint.addRecipe(String category, IItemStack output, IIngredient[] inputs);
var PlatesOutput = [
    <immersiveengineering:metal:39>, 
    <immersiveengineering:metal:30>, 
    <immersiveengineering:metal:31>,
    <immersiveengineering:metal:32>,
    <immersiveengineering:metal:33>, 
    <immersiveengineering:metal:34>,
    <immersiveengineering:metal:35>,
    <immersiveengineering:metal:36>, 
    <immersiveengineering:metal:37>,
    <immersiveengineering:metal:38>,
    <immersiveengineering:metal:39>, 
    <immersiveengineering:metal:40>,
    <immersiveintelligence:material_plate:5>,
    <immersiveengineering:metal:17>,
    <immersiveengineering:metal:19>,
    <immersiveengineering:metal:11>,
    <immersiveengineering:metal:9>,
    <immersiveengineering:metal:12>,
    <immersiveengineering:metal:13>,
    <immersiveengineering:metal:15>,
    <immersiveengineering:metal:16>
] as IIngredient[];

var RemoveCraft = [
  <advancedrocketry:ic:5>,
  <advancedrocketry:ic:4>,
  <advancedrocketry:ic:3>,
  <advancedrocketry:precisionassemblingmachine>,
  <minecraft:concrete_powder>,
  <minecraft:concrete_powder:1>,
  <minecraft:concrete_powder:2>,
  <minecraft:concrete_powder:3>,
  <minecraft:concrete_powder:4>,
  <minecraft:concrete_powder:5>,
  <minecraft:concrete_powder:6>,
  <minecraft:concrete_powder:7>,
  <minecraft:concrete_powder:8>,
  <minecraft:concrete_powder:9>,
  <minecraft:concrete_powder:10>,
  <minecraft:concrete_powder:11>,
  <minecraft:concrete_powder:12>,
  <minecraft:concrete_powder:13>,
  <minecraft:concrete_powder:14>,
  <minecraft:concrete_powder:15>,
  <immersiveengineering:stone_decoration:5>,
  <advancedrocketry:sawblade>,
  <advancedrocketry:crystallizer>,
  <advancedrocketry:electrolyser>,
  <advancedrocketry:sawbladeiron>,
  <advancedrocketry:platepress>,
  <hbm:machine_assembler>,
  <abyssalcraft:ironp>,
  <immersiveengineering:blueprint>.withTag({blueprint: "bullet"}),
  <immersiveengineering:material:20>,
  <immersiveengineering:blueprint>.withTag({blueprint: "molds"}),
  <minecraft:paper>,
  <hbm:gun_revolver_ammo>,
  <hbm:ammo_44>,
  <hbm:ammo_4gauge>,
  <hbm:ammo_4gauge_slug>,
  <hbm:ammo_4gauge_flechette>,
  <immersiveengineering:blueprint>.withTag({blueprint: "ammo_molds"}),
  <hbm:ammo_50bmg_explosive>,
  <hbm:ammo_5mm_explosive>,
  <hbm:ammo_4gauge_semtex>,
  <hbm:ammo_4gauge_explosive>,
  <hbm:ammo_20gauge_explosive>,
  <hbm:ammo_4gauge_flechette_phosphorus>,
  <hbm:ammo_50bmg_phosphorus>,
  <hbm:ammo_556_phosphorus>,
  <hbm:ammo_44_phosphorus>,
  <hbm:ammo_556_flechette_incendiary>,
  <hbm:ammo_50bmg_incendiary>,
  <hbm:ammo_12gauge_incendiary>,
  <hbm:ammo_20gauge_incendiary>,
  <hbm:ammo_50ae>,
  <hbm:ammo_50bmg>,
  <betterwithmods:material:4>,
  <hbm:anvil_iron>,
  <hbm:anvil_lead>,
  <hbm:anvil_steel>,
  <lycanitesmobs:demonstone>,
  <minecraft:fire_charge>,
  <immersiveengineering:storage:8>,
  <hbm:block_steel>,
  <libvulpes:metal0:6>,
  <lycanitesmobs:soulkey>,
  <immersiveengineering:stone_decoration:1>,
  <lycanitesmobs:soulkey>,
  <quark:soul_powder>,
  <minecraft:cauldron>
] as IIngredient[];

var BloodInputs = {
    [<swparasites:serrated_spines>] : <liquid:deadblood>*1700,
    [<swparasites:living_nucleus>] : <liquid:deadblood>*7000,
    [<swparasites:hardened_bone_pole>] : <liquid:deadblood>*3400,
    [<swparasites:infectious_long_blade_fragment>] : <liquid:deadblood>*2800,
    [<srparasites:lurecomponent6>] : <liquid:deadblood>*2000,
    [<srparasites:lurecomponent5>] : <liquid:deadblood>*1000,
    [<srparasites:lurecomponent4>] : <liquid:deadblood>*500,
    [<srparasites:lurecomponent3>] : <liquid:deadblood>*300,
    [<srparasites:lurecomponent2>] : <liquid:deadblood>*150,
    [<srparasites:lurecomponent1>] : <liquid:deadblood>*50,
    [<srparasites:beckon_drop>] : <liquid:deadblood>*1500,
    [<srparasites:dried_tendons>] : <liquid:deadblood>*2700,
    [<srparasites:dispatcher_drop>] : <liquid:deadblood>*1500,
    [<srparasites:infectious_blade_fragment>] : <liquid:deadblood>*1700,
    [<srparasites:hardened_bone_handle>] : <liquid:deadblood>*2300,
    [<srparasites:vile_shell>] : <liquid:deadblood>*2500,
    [<srparasites:living_core>] : <liquid:deadblood>*5000,
    [<srparasites:bone>] : <liquid:deadblood>*1000,
    [<srparasites:ada_yelloweye_drop>] : <liquid:deadblood>*500,
    [<srparasites:ada_manducater_drop>] : <liquid:deadblood>*500,
    [<srparasites:ada_summoner_drop>] : <liquid:deadblood>*500,
    [<srparasites:ada_longarms_drop>] : <liquid:deadblood>*500,
    [<srparasites:ada_arachnida_drop>] : <liquid:deadblood>*500,
    [<srparasites:ada_devourer_drop>] : <liquid:deadblood>*500,
    [<srparasites:ada_bolster_drop>] : <liquid:deadblood>*500,
    [<srparasites:assimilated_flesh>] : <liquid:deadblood>*100,
    [<srparasites:ada_reeker_drop>] : <liquid:deadblood>*500
} as ILiquidStack[IIngredient[]];

var CretePowderization = {
    <minecraft:concrete> : <minecraft:concrete_powder>,
    <minecraft:concrete:1> : <minecraft:concrete_powder:1>,
    <minecraft:concrete:2> : <minecraft:concrete_powder:2>,
    <minecraft:concrete:3> : <minecraft:concrete_powder:3>,
    <minecraft:concrete:4> : <minecraft:concrete_powder:4>,
    <minecraft:concrete:5> : <minecraft:concrete_powder:5>,
    <minecraft:concrete:6> : <minecraft:concrete_powder:6>,
    <minecraft:concrete:7> : <minecraft:concrete_powder:7>,
    <minecraft:concrete:8> : <minecraft:concrete_powder:8>,
    <minecraft:concrete:9> : <minecraft:concrete_powder:9>,
    <minecraft:concrete:10> : <minecraft:concrete_powder:10>,
    <minecraft:concrete:11> : <minecraft:concrete_powder:11>,
    <minecraft:concrete:12> : <minecraft:concrete_powder:12>,
    <minecraft:concrete:13> : <minecraft:concrete_powder:13>,
    <minecraft:concrete:14> : <minecraft:concrete_powder:14>,
    <minecraft:concrete:15> : <minecraft:concrete_powder:15>
} as IItemStack[IIngredient];

// Input / Ouput
// Output / Input

var CreteColorization = {
    <minecraft:concrete> : <ore:dyeWhite>,
    <minecraft:concrete:1> : <ore:dyeOrange>,
    <minecraft:concrete:2> : <ore:dyeMagenta>,
    <minecraft:concrete:3> : <ore:dyeLightBlue>,
    <minecraft:concrete:4> : <ore:dyeYellow>,
    <minecraft:concrete:5> : <ore:dyeLime>,
    <minecraft:concrete:6> : <ore:dyePink>,
    <minecraft:concrete:7> : <ore:dyeGray>,
    <minecraft:concrete:8> : <ore:dyeLightGray>,
    <minecraft:concrete:9> : <ore:dyeCyan>,
    <minecraft:concrete:10> : <ore:dyePurple>,
    <minecraft:concrete:11> : <ore:dyeBlue>,
    <minecraft:concrete:12> : <ore:dyeBrown>,
    <minecraft:concrete:13> : <ore:dyeGreen>,
    <minecraft:concrete:14> : <ore:dyeRed>,
    <minecraft:concrete:15> : <ore:dyeBlack>
} as IIngredient[IItemStack];

var RocketryCrafts = {
    //[[*, *, *], 
    //[*, *, *], 
    //[*, *, *]] :
    //*,
    [[<immersiveintelligence:material_rod:4>, <immersiveintelligence:material_plate:7>, <immersiveintelligence:material_rod:4>], 
    [<immersiveintelligence:material_plate:7>, null, <immersiveintelligence:material_plate:7>], 
    [<immersiveintelligence:material_rod:4>, <immersiveintelligence:material_plate:7>, <immersiveintelligence:material_rod:4>]] :
    <libvulpes:structuremachine>,
    [[null, null, null], 
    [<ore:paneGlassBlack>, <ore:paneGlassBlack>, <ore:paneGlassBlack>], 
    [<hbm:wire_copper>, <immersiveintelligence:material:7>, <hbm:wire_copper>]] :
    <advancedrocketry:misc>,
    [[<ore:gunpowder>, <immersiveengineering:metal:30>, <ore:gunpowder>], 
    [<ore:dyeBlue>, <ore:dyeBlue>, <ore:dyeBlue>], 
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]] :
    <immersiveengineering:blueprint>.withTag({blueprint: "Revolver calibers"}),
    [[null, <hbm:stamp_desh_flat>, null], 
    [<ore:dyeBlue>, <ore:dyeBlue>, <ore:dyeBlue>], 
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]] :
    <immersiveengineering:blueprint>.withTag({blueprint: "molds"}),
    [[null, <ore:dyeRed>, null], 
    [null, <minecraft:paper>, null], 
    [null, <immersiveengineering:bullet>, null]] :
    <immersiveengineering:bullet:1>,
    [[<ore:plateBrass>, <rats:charged_creeper_chunk>, <ore:plateBrass>], 
    [<ore:dyeBlue>, <ore:dyeBlue>, <ore:dyeBlue>], 
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]] :
    <immersiveengineering:blueprint>.withTag({blueprint: "Explosive Ammo"}),
    [[<immersiveengineering:metal:36>, <minecraft:diamond>, <immersiveengineering:metal:38>], 
    [<ore:dyeBlue>, <ore:dyeBlue>, <ore:dyeBlue>], 
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]] :
    <immersiveengineering:blueprint>.withTag({blueprint: "Armour Piercing Ammo"}),
    [[<hbm:powder_fire>, <srparasites:itemthrow>, <hbm:powder_fire>], 
    [<ore:dyeBlue>, <ore:dyeBlue>, <ore:dyeBlue>], 
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]] :
    <immersiveengineering:blueprint>.withTag({blueprint: "Incendiary Ammo"}),
    [[<ore:gunpowder>, <immersiveintelligence:material_plate:1>, <ore:gunpowder>], 
    [<ore:dyeBlue>, <ore:dyeBlue>, <ore:dyeBlue>], 
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]] :
    <immersiveengineering:blueprint>.withTag({blueprint: "Rifle calibers"}),
    [[<ore:gunpowder>, <immersiveengineering:metal:38>, <ore:gunpowder>], 
    [<ore:dyeBlue>, <ore:dyeBlue>, <ore:dyeBlue>], 
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]] :
    <immersiveengineering:blueprint>.withTag({blueprint: "Small calibers"}),
    [[<ore:gunpowder>, <hbm:pellet_buckshot>, <ore:gunpowder>], 
    [<ore:dyeBlue>, <ore:dyeBlue>, <ore:dyeBlue>], 
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]] :
    <immersiveengineering:blueprint>.withTag({blueprint: "Intermediate calibers"}),
    [[<minecraft:stonebrick>, <hbm:plate_iron>, <minecraft:stonebrick>], 
    [<hbm:plate_iron>, null, <hbm:plate_iron>], 
    [<minecraft:stonebrick>, <hbm:plate_iron>, <minecraft:stonebrick>]] :
    <chisel:factory>*64,
    [[null, <immersiveintelligence:sawblade>, null], 
    [<ore:gearWood>, <betterwithmods:material:9>, <ore:gearWood>], 
    [<ore:plankWood>, <ore:stickIron>, <ore:plankWood>]] :
    <betterwithmods:saw>,
    [[null, <tconstruct:knife_blade>.withTag({Material: "iron"}), null], 
    [<tconstruct:knife_blade>.withTag({Material: "iron"}), <ore:stickIron>, <tconstruct:knife_blade>.withTag({Material: "iron"})], 
    [null, <tconstruct:knife_blade>.withTag({Material: "iron"}), null]] :
    <immersiveintelligence:sawblade>,
    [[<ore:plateSteel>, <minecraft:stone>, <ore:plateSteel>], 
    [<minecraft:stone>, <immersiveengineering:material:9>, <minecraft:stone>], 
    [<ore:plateSteel>, <minecraft:stone>, <ore:plateSteel>]] :
    <betterwithmods:steel_gearbox>,
    [[<minecraft:nether_wart>, <ore:cobblestone>, <minecraft:nether_wart>],
    [<ore:cobblestone>, <tconstruct:edible:3>, <ore:cobblestone>],
    [<minecraft:nether_wart>, <ore:cobblestone>, <minecraft:nether_wart>]] : 
    <minecraft:netherrack>*4,
    [[null, <minecraft:quartz_block>, <tconstruct:slime_congealed:3>],
    [null, <tconstruct:metal:1>, <minecraft:quartz_block>],
    [<hbm:block_red_phosphorus>, null, null]] : 
    <lycanitesmobs:bloodsummoningstaff>,
    [[<tconstruct:edible:3>, <tconstruct:edible:3>, <tconstruct:edible:3>],
    [<betterwithmods:material:17>, <minecraft:saddle>, <betterwithmods:material:17>],
    [<tconstruct:ingots:1>, null, <tconstruct:ingots:1>]] : 
    <lycanitesmobs:saddle_demon>,
    [[null, <ore:listAllmeat>, <betterwithmods:material:25>],
    [<tconstruct:materials:17>, <betterwithmods:material:25>, <ore:listAllmeat>],
    [null, <ore:listAllmeat>, <betterwithmods:material:25>]] : 
    <lycanitesmobs:demontreat>*4,
    [[<srparasites:lurecomponent3>, <srparasites:assimilated_flesh>, <ore:plateIron>],
    [<ore:obsidian>, <minecraft:book>, <srparasites:assimilated_flesh>],
    [<srparasites:lurecomponent3>, <srparasites:assimilated_flesh>, <ore:plateIron>]] : 
    <abyssalcraft:necronomicon>.withTag({PotEnergy: 0.0 as float}),
    [[<ore:plankWood>, <ore:blockIron>, <ore:plankWood>],
    [<minecraft:stonebrick>, <ore:blockRedstone>, <minecraft:stonebrick>],
    [<minecraft:stonebrick>, <ore:blockCopper>, <minecraft:stonebrick>]] : 
    <minecraft:piston>,
    [[<ore:stickSteel>, <ore:hideBelt>, <ore:stickSteel>],
    [<ore:gearSoulforgedSteel>, <ore:plateSteel>, <ore:gearSoulforgedSteel>]] : 
    <immersiveengineering:conveyor>.withTag({conveyorType: "immersiveengineering:conveyor"}),
    [[<minecraft:fire_charge>,<minecraft:fire_charge>,<minecraft:fire_charge>],
    [<minecraft:nether_brick>,<minecraft:nether_brick>,<minecraft:nether_brick>],
    [<futuremc:smooth_stone>,<futuremc:smooth_stone>,<futuremc:smooth_stone>]] : 
    <betterwithmods:hibachi>,
    [[<ore:flower>, <ore:flower>, <ore:flower>],[<ore:flower>, <ore:flower>, <ore:flower>],[<ore:flower>,<ore:flower>,<ore:flower>]] : <rats:herb_bundle>,
    [[<minecraft:glass_bottle>, <ore:fabricHemp>],[<forge:bucketfilled>.withTag({FluidName: "creosote", Amount: 1000}), <minecraft:flint_and_steel>.anyDamage().reuse()]] : <hbm:grenade_gascan>
} as IItemStack[IIngredient[][]];
    
var MetalTypes = [
    <minecraft:iron_ingot>,
] as IItemStack[];

//Using an existing Category String
mods.immersiveengineering.Blueprint.removeRecipe(<immersiveengineering:mold>);


// Adds glowstone dust to the Vac bulb recipe
mods.immersiveintelligence.PrecisionAssembler.removeRecipe(<immersiveengineering:material:26>);
// Oh my~! what a long piece of code you have~...
mods.immersiveintelligence.PrecisionAssembler.addRecipe(<immersiveengineering:material:26>*4,<immersiveengineering:metal:20>,[<ore:plateIron>, <ore:blockGlass>, <hbm:wire_copper>, <ore:dustGlowstone>*3], ["solderer","drill","inserter"], ["inserter pick first","solderer work main","inserter drop main","drill work main"], 8000, 1);
mods.immersiveengineering.Blueprint.removeRecipe(<immersiveengineering:material:26>);

// Adding Space circuit recipe
mods.immersiveintelligence.PrecisionAssembler.addRecipe(<advancedrocketry:ic:3>,<immersiveengineering:metal:20>,[<immersiveintelligence:material:6>, <ore:plateCopper>, <immersiveintelligence:material:9>*2, <ore:dustCopper>*10], ["solderer","buzzsaw","inserter"], ["inserter pick first","solderer work main","inserter drop main","buzzsaw work main"], 60000, 1);
mods.immersiveintelligence.PrecisionAssembler.addRecipe(<advancedrocketry:ic:4>,<immersiveengineering:metal:20>,[<immersiveintelligence:material:6>, <ore:plateCopper>, <immersiveintelligence:material:9>*2, <ore:dustGold>*10], ["solderer","buzzsaw","inserter"], ["inserter pick first","solderer work main","inserter drop main","buzzsaw work main"], 60000, 1);
mods.immersiveintelligence.PrecisionAssembler.addRecipe(<advancedrocketry:ic:5>,<immersiveengineering:metal:20>,[<immersiveintelligence:material:6>, <ore:plateCopper>, <immersiveintelligence:material:9>*2, <ore:gemLapis>*10], ["solderer","buzzsaw","inserter"], ["inserter pick first","solderer work main","inserter drop main","buzzsaw work main"], 60000, 1);

recipes.addShaped("AssemblyControl", <immersiveintelligence:assembly_scheme>.withTag({recipeItem: {id: "advancedrocketry:ic", Count: 1 as byte, Damage: 3 as short}}),
 [[<srparasites:assimilated_flesh>,<srparasites:beckon_drop>,<srparasites:assimilated_flesh>],
  [<ore:dyeBlue>,<ore:dyeBlue>,<ore:dyeBlue>],
  [<ore:paper>,<ore:paper>,<ore:paper>]]
);

recipes.addShaped("AssemblyItem", <immersiveintelligence:assembly_scheme>.withTag({recipeItem: {id: "advancedrocketry:ic", Count: 1 as byte, Damage: 4 as short}}),
 [[<srparasites:assimilated_flesh>,<srparasites:ada_manducater_drop>,<srparasites:assimilated_flesh>],
  [<ore:dyeBlue>,<ore:dyeBlue>,<ore:dyeBlue>],
  [<ore:paper>,<ore:paper>,<ore:paper>]]
);

recipes.addShaped("AssemblyLiquid", <immersiveintelligence:assembly_scheme>.withTag({recipeItem: {id: "advancedrocketry:ic", Count: 1 as byte, Damage: 5 as short}}),
 [[<srparasites:assimilated_flesh>,<srparasites:ada_summoner_drop>,<srparasites:assimilated_flesh>],
  [<ore:dyeBlue>,<ore:dyeBlue>,<ore:dyeBlue>],
  [<ore:paper>,<ore:paper>,<ore:paper>]]
);

recipes.addShaped("launchpad", <advancedrocketry:launchpad>,
    [[<ore:dyeBlack>, <ore:dyeYellow>, <ore:dyeBlack>], 
    [<immersiveengineering:stone_decoration:5>, <immersiveengineering:stone_decoration:5>, <immersiveengineering:stone_decoration:5>], 
    [<ore:dyeYellow>, <ore:dyeBlack>, <ore:dyeYellow>]]
);

recipes.addShaped("rocketbuilder", <advancedrocketry:rocketbuilder>,
    [[<immersiveintelligence:material_rod:1>, <advancedrocketry:misc>, <immersiveintelligence:material_rod:1>], 
    [<advancedrocketry:ic:3>, <libvulpes:structuremachine>, <advancedrocketry:ic:3>], 
    [<immersiveintelligence:motor_gear:4>, <immersiveengineering:stone_decoration:5>, <immersiveintelligence:motor_gear:4>]]
);

recipes.addShaped("lowpress", <advancedrocketry:pressuretank>,
    [[null, <ore:plateIron>, null], 
    [<ore:plateIron>, <hbm:fluid_tank_full>.withTag({}), <ore:plateIron>], 
    [null, <ore:plateIron>, null]]
);

recipes.addShaped("midpress", <advancedrocketry:pressuretank:1>,
    [[null, <ore:plateSteel>, null], 
    [<ore:plateSteel>, <hbm:fluid_tank_full>.withTag({}), <ore:plateSteel>], 
    [null, <ore:plateSteel>, null]]
);

recipes.addShaped("highpress", <advancedrocketry:pressuretank:2>,
    [[null, <ore:plateAluminum>, null], 
    [<ore:plateAluminum>, <hbm:fluid_tank_full>.withTag({}), <ore:plateAluminum>], 
    [null, <ore:plateAluminum>, null]]
);

recipes.addShaped("Shighpress", <advancedrocketry:pressuretank:3>,
    [[null, <ore:plateTitanium>, null], 
    [<ore:plateTitanium>, <hbm:fluid_tank_full>.withTag({}), <ore:plateTitanium>], 
    [null, <ore:plateTitanium>, null]]
);

mods.immersiveengineering.BottlingMachine.addRecipe(<hbm:iv_blood>, <hbm:iv_empty>, <liquid:blood>*250);
recipes.addShapeless("strongradaway",<hbm:radaway_strong>,[<biomesoplenty:mushroom:3>, <hbm:radaway>]);
recipes.addShapeless("satcir",<advancedrocketry:satelliteidchip>,[<immersiveengineering:material:27>]);
recipes.addShapeless("planetcir",<advancedrocketry:planetidchip>,[<immersiveintelligence:material:7>, <immersiveintelligence:material:7>, <advancedrocketry:satelliteidchip>]);
recipes.addShapeless("targetcir",<advancedrocketry:ic:1>,[<minecraft:ender_eye>, <advancedrocketry:satelliteidchip>]);
recipes.addShapeless("steelsheet",<libvulpes:productsheet:6>,[<ore:plateSteel>, <immersiveengineering:tool>]);
mods.jei.JEI.removeAndHide(<advancedrocketry:precisionassemblingmachine>);
mods.jei.JEI.removeAndHide(<hbm:machine_difurnace_off>);
mods.jei.JEI.removeAndHide(<hbm:machine_assembler>);
mods.jei.JEI.removeAndHide(<hbm:gun_revolver_iron>);


// Plate replacer (Requires 1 metal type and the corresponding metal plate)
for i, item in PlatesOutput {
    recipes.removeShapeless(PlatesOutput[i], [<immersiveengineering:tool>], true);
}

// Just removes crafting recipes, that's it
for i, item in RemoveCraft {
    recipes.remove(RemoveCraft[i]);
}

// Blood Coagulation chain
for key in BloodInputs {
    mods.immersiveengineering.Mixer.addRecipe(BloodInputs[key], <liquid:water>*10, key, 500);
}
mods.immersiveintelligence.Coagulator.addRecipe(<srparasites:infestedore:4>*32, <liquid:deadblood>*1000, <liquid:blood>*200, 8000, 1000);
mods.immersiveengineering.Crusher.addRecipe(<immersiveengineering:metal:18>*3, <srparasites:infestedore:4>, 200, <minecraft:rotten_flesh>*3, 1);
mods.immersiveintelligence.ChemicalBath.addRecipe(<ore:listAllMeatRaw>, <srparasites:assimilated_flesh>, <liquid:deadblood>*70, 200, 16);
mods.immersiveintelligence.ChemicalBath.addRecipe(<minecraft:rotten_flesh>, <srparasites:assimilated_flesh>, <liquid:deadblood>*60, 200, 16);
mods.immersiveengineering.Crusher.addRecipe(<hbm:powder_coal>, <minecraft:coal>, 1048);
//Using a new Category String (This generates a new Blueprint item)



// Stupid concrete recipes
for key in CretePowderization {
    mods.immersiveengineering.Crusher.addRecipe(CretePowderization[key], key, 10);
}
for key in CreteColorization {
    recipes.addShapeless(key, [CreteColorization[key], <immersiveengineering:stone_decoration:5>]);
}
mods.immersiveengineering.MetalPress.removeRecipe(<immersiveengineering:metal:39>);
recipes.remove(<immersiveengineering:metal:39>);

// Advanced rocketry recipes
for key in RocketryCrafts {
    recipes.addShaped(RocketryCrafts[key], key);
    recipes.remove(RocketryCrafts[key]);
}

//Example:
