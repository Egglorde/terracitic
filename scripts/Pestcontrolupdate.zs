import mods.immersiveintelligence.Filler;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.immersiveengineering.MetalPress;
import crafttweaker.liquid.ILiquidStack;
import mods.immersiveintelligence.PrecisionAssembler;

// Extrusion recipes
var Extrude = {
  // Ingot : Plate
  // Key : Name[Key]
  <hbm:casing_44> : <hbm:casing_9>,
  <hbm:casing_9> : <hbm:casing_buckshot>,
  <hbm:casing_buckshot> : <hbm:casing_50>,
  <immersiveengineering:bullet> : <immersiveintelligence:ammo_casing:6>,
  <immersiveintelligence:ammo_casing:6> : <immersiveintelligence:ammo_casing:5>,
  <immersiveintelligence:ammo_casing:5> : <immersiveintelligence:ammo_casing:4>
} as IItemStack[IIngredient];

var Cut = {
  // Ingot : Plate
  // Key : Name[Key]
  <immersiveintelligence:ammo_casing:6> : <hbm:casing_9>,
  <immersiveintelligence:ammo_casing:5> : <hbm:casing_buckshot>,
  <immersiveintelligence:ammo_casing:4> : <hbm:casing_50>,
  <immersiveengineering:bullet> : <hbm:casing_44>
} as IItemStack[IIngredient];


// Large calliber bullet recipes. (recipes involving a large calliber bullet filled with gunpowder)
var LargeCalGunpowder = {
  <hbm:ammo_50bmg_flechette> : <hbm:pellet_flechette>,
  <hbm:ammo_50bmg> : <immersiveintelligence:bullet_gun_4bcal:1>.withTag({core_type: "piercing_sabot", core: "core_lead"}),
  <hbm:ammo_50bmg_phosphorus> : <immersiveintelligence:bullet_gun_4bcal:1>.withTag({core_type: "canister", core: "core_lead", components: ["white_phosphorus"], component_nbt: [{}]}),
  <hbm:ammo_50bmg_explosive> : <immersiveintelligence:bullet_gun_4bcal:1>.withTag({core_type: "canister", core: "core_lead", components: ["tnt"], component_nbt: [{}]}),
  <hbm:ammo_50bmg_du> : <immersiveintelligence:bullet_gun_4bcal:1>.withTag({core_type: "piercing_sabot", core: "core_uranium"}),
  <hbm:ammo_50bmg_ap> : <immersiveintelligence:bullet_gun_4bcal:1>.withTag({core_type: "piercing", core: "core_lead"}),
  <hbm:ammo_50ae> : <immersiveintelligence:bullet_gun_4bcal:1>.withTag({core_type: "shaped", core: "core_lead"}),
  <hbm:ammo_50ae_du> : <immersiveintelligence:bullet_gun_4bcal:1>.withTag({core_type: "shaped", core: "core_uranium"})
} as IIngredient[IItemStack];

// Removing anvil recipes for gun casings from HBM
mods.ntm.Anvil.removeRecipe([<hbm:casing_50>]);

// Brass recipes
mods.immersiveengineering.AlloySmelter.removeRecipe(<immersiveintelligence:material_ingot:1>);
mods.immersiveengineering.AlloySmelter.addRecipe(<immersiveintelligence:material_ingot:1>*3, <immersiveintelligence:material_ingot:4>, <ore:ingotCopper>*2, 2000);

// Brass sheet recipe
mods.advancedrocketry.RecipeTweaker.forMachine("RollingMachine")
.builder()
.inputs(<immersiveintelligence:material_plate:1>, <liquid:water>*100)
.outputs(<contenttweaker:brass_sheet>)
.power(4)
.timeRequired(200)
.build();

// Bullet Cup Recipes
mods.immersiveengineering.MetalPress.addRecipe(<contenttweaker:large_cup_case>*4, <immersiveintelligence:material_plate:1>, <immersiveengineering:mold:5>, 2000);
mods.immersiveengineering.MetalPress.addRecipe(<contenttweaker:small_cup_case>*9, <immersiveintelligence:material_plate:1>, <immersiveengineering:mold:6>, 2000);
mods.immersiveengineering.MetalPress.addRecipe(<contenttweaker:large_cup_case>*8, <contenttweaker:brass_sheet>, <immersiveengineering:mold:5>, 2000);
mods.immersiveengineering.MetalPress.addRecipe(<contenttweaker:small_cup_case>*18, <contenttweaker:brass_sheet>, <immersiveengineering:mold:6>, 2000);

// All recipes using the extrusion mold. Remember, for large callibers this advances tier, and for small calibers this advances type.
for key in Extrude {
  recipes.remove(Extrude[key]);
  mods.immersiveengineering.MetalPress.removeRecipe(Extrude[key]);
  mods.immersiveengineering.MetalPress.addRecipe(Extrude[key], key, <contenttweaker:mold_long>, 2000);
}
for key in Cut {
  mods.advancedrocketry.RecipeTweaker.forMachine("CuttingMachine").builder().inputs(key).outputs(Cut[key], <immersiveengineering:metal:20>).power(4).build();
}

// This should *all* be rewritten lol

// ===== Revolver Recipes =====
// Revolver Case
mods.immersiveengineering.Blueprint.addRecipe("Revolver calibers", <immersiveengineering:bullet:2>.withTag({bullet: "casull"}), [<immersiveengineering:bullet>, <ore:nuggetLead>*2, <minecraft:gunpowder>*2]);
mods.immersiveengineering.Blueprint.addRecipe("Revolver calibers", <immersiveengineering:bullet:2>.withTag({bullet: "buckshot"}), [<immersiveengineering:bullet:1>, <hbm:pellet_buckshot>, <minecraft:gunpowder>*2]);
// Advanced Revolver Case
mods.immersiveengineering.Blueprint.addRecipe("Revolver calibers", <hbm:gun_revolver_ammo>, [<hbm:casing_44>, <ore:nuggetLead>*2, <minecraft:gunpowder>*2]);
mods.immersiveengineering.Blueprint.addRecipe("Revolver calibers", <hbm:ammo_44>, [<hbm:casing_44>, <ore:nuggetLead>*2, <minecraft:gunpowder>*2]);
mods.ntm.Anvil.addRecipe(<immersiveintelligence:ammo_casing:4>, [<immersiveintelligence:material_plate:1>], 1);
mods.ntm.Anvil.addRecipe(<immersiveengineering:bullet>, [<ore:plateCopper>], 1);
mods.ntm.Anvil.addRecipe(<hbm:pellet_buckshot>*6, [<hbm:ingot_lead>], 1);

// ===== Small Recipes =====
// Short Case
mods.immersiveengineering.Blueprint.addRecipe("Small calibers", <immersiveintelligence:bullet_smg_1bcal>.withTag({core_type: "softpoint", core: "core_lead", fuse: "contact", components: [], component_nbt: [], display: {Name: ".45 ACP"}}), [<immersiveintelligence:ammo_casing:6>, <ore:nuggetLead>, <minecraft:gunpowder>*2]);
// Advanced Short Case
mods.immersiveengineering.Blueprint.addRecipe("Small calibers", <hbm:ammo_9mm>, [<hbm:casing_9>, <ore:nuggetLead>, <minecraft:gunpowder>*2]);
mods.immersiveengineering.Blueprint.addRecipe("Small calibers", <hbm:ammo_556>, [<hbm:casing_9>, <ore:nuggetLead>, <minecraft:gunpowder>*2]);
mods.immersiveengineering.Blueprint.addRecipe("Small calibers", <hbm:ammo_22lr>, [<hbm:casing_9>, <ore:nuggetLead>, <minecraft:gunpowder>*2]);
mods.immersiveengineering.Blueprint.addRecipe("Small calibers", <hbm:ammo_5mm>, [<hbm:casing_9>, <ore:nuggetLead>, <minecraft:gunpowder>*2]);
// Done!

// ===== Intermediate Recipes =====
// Buckshot 
mods.immersiveengineering.Blueprint.addRecipe("Intermediate calibers", <hbm:ammo_20gauge>, [<ore:dyeRed>, <minecraft:paper>, <hbm:pellet_buckshot>, <minecraft:gunpowder>*2, <hbm:casing_buckshot>]);
mods.immersiveengineering.Blueprint.addRecipe("Intermediate calibers", <hbm:ammo_20gauge_flechette>, [<ore:dyeBlue>, <minecraft:paper>, <hbm:pellet_flechette>, <minecraft:gunpowder>*2, <hbm:casing_buckshot>]);
mods.immersiveengineering.Blueprint.addRecipe("Intermediate calibers", <hbm:ammo_20gauge_slug>, [<ore:dyeBlack>, <minecraft:paper>, <ore:stickIron>, <minecraft:gunpowder>*2, <hbm:casing_buckshot>]);
mods.immersiveengineering.Blueprint.addRecipe("Intermediate calibers", <hbm:ammo_12gauge>, [<ore:dyeBlue>, <minecraft:paper>, <hbm:pellet_buckshot>*2, <minecraft:gunpowder>*2, <hbm:casing_buckshot>]);
// Intermediate Case
mods.immersiveengineering.Blueprint.addRecipe("Intermediate calibers", <immersiveintelligence:bullet_stg_1bcal>.withTag({core_type: "softpoint", core: "core_lead", fuse: "contact", components: [], component_nbt: [], display: {Name: "Soft Point Assault Ammo"}}), [<immersiveintelligence:ammo_casing:5>, <ore:nuggetLead>, <minecraft:gunpowder>*2]);
// Done!

// ===== Rifle Recipes =====
// Rifle Case
mods.immersiveengineering.Blueprint.addRecipe("Rifle calibers", <immersiveintelligence:bullet_mg_2bcal>.withTag({core_type: "softpoint", core: "core_lead", fuse: "contact", components: [], component_nbt: [], display: {Name: "Soft Point Rifle Ammo"}}), [<immersiveintelligence:ammo_casing:4>, <ore:nuggetLead>, <minecraft:gunpowder>*2]);
// Large Case
mods.immersiveengineering.Blueprint.addRecipe("Rifle calibers", <hbm:ammo_4gauge>, [<ore:dyeYellow>*2, <minecraft:paper>*2, <hbm:pellet_buckshot>*2, <minecraft:gunpowder>*3, <hbm:casing_50>]);
mods.immersiveengineering.Blueprint.addRecipe("Rifle calibers", <hbm:ammo_4gauge_slug>, [<ore:dyeYellow>*2, <minecraft:paper>*2, <immersiveengineering:metal:8>, <minecraft:gunpowder>*3, <hbm:casing_50>]);
mods.immersiveengineering.Blueprint.addRecipe("Rifle calibers", <hbm:ammo_4gauge_flechette>, [<ore:dyeYellow>*2, <minecraft:paper>*2, <hbm:pellet_flechette>*2, <minecraft:gunpowder>*3, <hbm:casing_50>]);
mods.immersiveengineering.Blueprint.addRecipe("Rifle calibers", <hbm:ammo_50ae>, [<ore:nuggetLead>, <minecraft:gunpowder>*2, <hbm:casing_50>]);
mods.immersiveengineering.Blueprint.addRecipe("Rifle calibers", <hbm:ammo_50bmg>, [<ore:nuggetLead>*2, <minecraft:gunpowder>*2, <hbm:casing_50>]);
// Done!

// ===== Red Phosphorus Recipes =====
// Revolver Case
mods.immersiveengineering.Blueprint.addRecipe("Incendiary Ammo", <immersiveengineering:bullet:2>.withTag({bullet: "dragonsbreath"}), [<hbm:powder_fire>, <immersiveengineering:bullet:1>, <hbm:pellet_buckshot>, <minecraft:gunpowder>*2]);
// Buckshot Case
mods.immersiveengineering.Blueprint.addRecipe("Incendiary Ammo", <hbm:ammo_20gauge_incendiary>, [<ore:dyeOrange>, <minecraft:paper>, <hbm:pellet_buckshot>, <minecraft:gunpowder>*2, <hbm:casing_buckshot>, <ore:dustRedPhosphorus>]);
mods.immersiveengineering.Blueprint.addRecipe("Incendiary Ammo", <hbm:ammo_12gauge_incendiary>, [<ore:dyeOrange>, <minecraft:paper>, <hbm:pellet_buckshot>*2, <minecraft:gunpowder>*2, <hbm:casing_buckshot>, <ore:dustRedPhosphorus>]);
// Large Case
mods.immersiveengineering.Blueprint.addRecipe("Incendiary Ammo", <hbm:ammo_50bmg_incendiary>, [<hbm:powder_fire>, <hbm:casing_50>, <ore:nuggetLead>*2, <minecraft:gunpowder>*2]);
// Advanced Short Case
mods.immersiveengineering.Blueprint.addRecipe("Incendiary Ammo", <hbm:ammo_556_flechette_incendiary>, [<hbm:pellet_flechette>, <minecraft:gunpowder>*2, <hbm:casing_9>, <ore:dustRedPhosphorus>]);
// Done!

// ===== White Phosphorus Recipes =====
// Advanced Revolver Case
mods.immersiveengineering.Blueprint.addRecipe("Incendiary Ammo", <hbm:ammo_44_phosphorus>, [<immersiveengineering:bullet>, <ore:dustWhitePhosphorus>, <ore:nuggetLead>*2, <minecraft:gunpowder>*2]);
// Advanced Short Case
mods.immersiveengineering.Blueprint.addRecipe("Incendiary Ammo", <hbm:ammo_556_phosphorus>, [<ore:nuggetLead>*2, <minecraft:gunpowder>*2, <hbm:casing_9>, <ore:dustWhitePhosphorus>]);
// Large Case
mods.immersiveengineering.Blueprint.addRecipe("Incendiary Ammo", <hbm:ammo_50bmg_phosphorus>, [<ore:dustWhitePhosphorus>, <hbm:casing_50>, <ore:nuggetLead>*2, <minecraft:gunpowder>*2]);
mods.immersiveengineering.Blueprint.addRecipe("Incendiary Ammo", <hbm:ammo_4gauge_flechette_phosphorus>, [<ore:dyeOrange>, <ore:dyeBlack>, <minecraft:paper>, <ore:dustWhitePhosphorus>, <hbm:casing_50>, <hbm:pellet_buckshot>, <minecraft:gunpowder>*2]);
// Rifle Case
mods.immersiveengineering.Blueprint.addRecipe("Incendiary Ammo", <immersiveintelligence:bullet_mg_2bcal>.withTag({core_type: "softpoint", core: "core_lead", fuse: "contact", components: ["white_phosphorus"], component_nbt: [{}], display: {Name: "Rifle Ammo (WP)"}}), [<immersiveintelligence:ammo_casing:4>, <ore:dustWhitePhosphorus>, <ore:nuggetLead>, <minecraft:gunpowder>*2]);
// Small Case
mods.immersiveengineering.Blueprint.addRecipe("Incendiary Ammo", <immersiveintelligence:bullet_stg_1bcal>.withTag({core_type: "softpoint", core: "core_lead", fuse: "contact", components: ["white_phosphorus"], component_nbt: [{}], display: {Name: "Rifle Assault Ammo (WP)"}}), [<immersiveintelligence:ammo_casing:5>, <ore:dustWhitePhosphorus>, <ore:nuggetLead>, <minecraft:gunpowder>*2]);
// Intermediate Case
mods.immersiveengineering.Blueprint.addRecipe("Incendiary Ammo", <immersiveintelligence:bullet_smg_1bcal>.withTag({core_type: "softpoint", core: "core_lead", fuse: "contact", components: ["white_phosphorus"], component_nbt: [{}], display: {Name: ".45 ACP (WP)"}}), [<immersiveintelligence:ammo_casing:6>, <ore:dustWhitePhosphorus>, <ore:nuggetLead>, <minecraft:gunpowder>*2]);
// Done!

// ===== Explosive Recipes ===== 
// Buckshot Case
mods.immersiveengineering.Blueprint.addRecipe("Explosive Ammo", <hbm:ammo_20gauge_explosive>, [<ore:dyeYellow>, <minecraft:paper>, <hbm:pellet_cluster>, <minecraft:gunpowder>*2, <hbm:casing_buckshot>]);
mods.immersiveengineering.Blueprint.addRecipe("Explosive Ammo", <hbm:ammo_4gauge_explosive>, [<ore:dyeYellow>, <ore:dyeGreen>, <minecraft:paper>*2, <ore:tnt>, <minecraft:gunpowder>*3, <hbm:casing_50>]);
mods.immersiveengineering.Blueprint.addRecipe("Explosive Ammo", <hbm:ammo_4gauge_semtex>, [<ore:dyeYellow>, <ore:dyeGray>, <minecraft:paper>*2, <hbm:det_miner>, <minecraft:gunpowder>*3, <hbm:casing_50>]);
// Revolver Case
mods.immersiveengineering.Blueprint.addRecipe("Explosive Ammo", <immersiveengineering:bullet:2>.withTag({bullet: "he"}), [<immersiveengineering:bullet>, <minecraft:tnt>, <minecraft:gunpowder>*2]);
// Rifle Case
mods.immersiveengineering.Blueprint.addRecipe("Explosive Ammo", <immersiveintelligence:bullet_mg_2bcal>.withTag({core_type: "softpoint", core: "core_lead", fuse: "contact", components: ["tnt"], component_nbt: [{}], display: {Name: "High Exlosive Rifle Ammo"}}), [<immersiveintelligence:ammo_casing:4>, <minecraft:tnt>, <ore:nuggetLead>, <minecraft:gunpowder>*2]);
// Intermediate Case
mods.immersiveengineering.Blueprint.addRecipe("Explosive Ammo", <immersiveintelligence:bullet_stg_1bcal>.withTag({core_type: "softpoint", core: "core_lead", fuse: "contact", components: ["tnt"], component_nbt: [{}], display: {Name: "High Exlosive Rifle Assault Ammo"}}), [<immersiveintelligence:ammo_casing:5>, <minecraft:tnt>, <ore:nuggetLead>, <minecraft:gunpowder>*2]);
// Small Case
mods.immersiveengineering.Blueprint.addRecipe("Explosive Ammo", <immersiveintelligence:bullet_smg_1bcal>.withTag({core_type: "softpoint", core: "core_lead", fuse: "contact", components: ["tnt"], component_nbt: [{}], display: {Name: ".45 ACP (High Exlosive)"}}), [<immersiveintelligence:ammo_casing:6>, <minecraft:tnt>, <ore:nuggetLead>, <minecraft:gunpowder>*2]);
// Large Case
mods.immersiveengineering.Blueprint.addRecipe("Explosive Ammo", <hbm:ammo_50bmg_explosive>, [<minecraft:tnt>, <hbm:casing_50>, <ore:nuggetLead>*2, <minecraft:gunpowder>*2]);
mods.immersiveengineering.Blueprint.addRecipe("Explosive Ammo", <hbm:ammo_5mm_explosive>, [<minecraft:tnt>, <hbm:casing_9>, <ore:nuggetLead>*2, <minecraft:gunpowder>*2]);
// Done!

// The recipe for explosive pellets, included in Explosive because... yeah...
mods.immersiveintelligence.ChemicalBath.addRecipe(<hbm:pellet_buckshot>, <hbm:pellet_cluster>, <liquid:rocketfuel>*5, 200, 50);

// ===== AP Recipes =====
// Revolver Case
mods.immersiveengineering.Blueprint.addRecipe("Armour Piercing Ammo", <immersiveengineering:bullet:2>.withTag({bullet: "armor_piercing"}), [<immersiveengineering:bullet>, <ore:nuggetSteel>, <ore:nuggetConstantan>, <minecraft:gunpowder>*2]);
// Rifle Ammo
mods.immersiveengineering.Blueprint.addRecipe("Armour Piercing Ammo", <immersiveintelligence:bullet_mg_2bcal>.withTag({core_type: "piercing", core: "core_steel", fuse: "contact", components: [], component_nbt: [], display: {Name: "Armor Piercing Rifle Ammo"}}), [<immersiveintelligence:ammo_casing:4>, <ore:nuggetSteel>, <ore:nuggetConstantan>, <minecraft:gunpowder>*2]);
// Small Case
mods.immersiveengineering.Blueprint.addRecipe("Armour Piercing Ammo", <immersiveintelligence:bullet_smg_1bcal>.withTag({core_type: "piercing", core: "core_steel", fuse: "contact", components: [], component_nbt: [], display: {Name: ".45 ACP (Armor Piercing)"}}), [<immersiveintelligence:ammo_casing:6>, <ore:nuggetSteel>, <ore:nuggetConstantan>, <minecraft:gunpowder>*2]);
// Intermediate Case
mods.immersiveengineering.Blueprint.addRecipe("Armour Piercing Ammo", <immersiveintelligence:bullet_stg_1bcal>.withTag({core_type: "piercing", core: "core_steel", fuse: "contact", components: [], component_nbt: [], display: {Name: "Armor Piercing Assault Ammo"}}), [<immersiveintelligence:ammo_casing:5>, <ore:nuggetSteel>, <ore:nuggetConstantan>, <minecraft:gunpowder>*2]);
// Advanced Revolver
mods.immersiveengineering.Blueprint.addRecipe("Armour Piercing Ammo", <hbm:ammo_44_ap>, [<hbm:casing_44>, <ore:nuggetSteel>, <ore:nuggetConstantan>, <minecraft:gunpowder>*2]);
// Advanced Small Case
mods.immersiveengineering.Blueprint.addRecipe("Armour Piercing Ammo", <hbm:ammo_9mm_ap>, [<hbm:casing_9>, <ore:nuggetSteel>, <ore:nuggetConstantan>, <minecraft:gunpowder>*2]);
mods.immersiveengineering.Blueprint.addRecipe("Armour Piercing Ammo", <hbm:ammo_556_ap>, [<hbm:casing_9>, <ore:nuggetSteel>, <ore:nuggetConstantan>, <minecraft:gunpowder>*2]);
mods.immersiveengineering.Blueprint.addRecipe("Armour Piercing Ammo", <hbm:ammo_22lr_ap>, [<hbm:casing_9>, <ore:nuggetSteel>, <ore:nuggetConstantan>, <minecraft:gunpowder>*2]);
// Large Case
mods.immersiveengineering.Blueprint.addRecipe("Armour Piercing Ammo", <hbm:ammo_50ae_ap>, [<hbm:casing_50>, <ore:nuggetSteel>*2, <ore:nuggetConstantan>*2, <minecraft:gunpowder>*2]);
mods.immersiveengineering.Blueprint.addRecipe("Armour Piercing Ammo", <hbm:ammo_50bmg_ap>, [<hbm:casing_50>, <ore:nuggetSteel>*2, <ore:nuggetConstantan>*2, <minecraft:gunpowder>*2]);
// Done!

// Removing the recipes for ammo press molds
mods.immersiveengineering.Blueprint.removeRecipe(<immersiveintelligence:press_mold:3>);
mods.immersiveengineering.Blueprint.removeRecipe(<immersiveintelligence:press_mold:4>);
mods.immersiveengineering.Blueprint.removeRecipe(<immersiveintelligence:press_mold:5>);
mods.immersiveengineering.Blueprint.removeRecipe(<immersiveintelligence:press_mold:6>);
mods.immersiveengineering.Blueprint.removeRecipe(<immersiveintelligence:press_mold:11>);
mods.immersiveengineering.Blueprint.removeRecipe(<immersiveengineering:mold:3>);

// Removing other stamp type recipes
mods.jei.JEI.removeAndHide(<hbm:stamp_stone_plate>);
mods.jei.JEI.removeAndHide(<hbm:stamp_titanium_plate>);
mods.jei.JEI.removeAndHide(<hbm:stamp_iron_plate>);
mods.jei.JEI.removeAndHide(<hbm:stamp_steel_plate>);
mods.jei.JEI.removeAndHide(<hbm:stamp_obsidian_plate>);
mods.jei.JEI.removeAndHide(<hbm:stamp_schrabidium_plate>);
mods.jei.JEI.removeAndHide(<hbm:stamp_stone_wire>);
mods.jei.JEI.removeAndHide(<hbm:stamp_titanium_wire>);
mods.jei.JEI.removeAndHide(<hbm:stamp_iron_wire>);
mods.jei.JEI.removeAndHide(<hbm:stamp_steel_wire>);
mods.jei.JEI.removeAndHide(<hbm:stamp_obsidian_wire>);
mods.jei.JEI.removeAndHide(<hbm:stamp_schrabidium_wire>);

// Abyssalcraft Rituals
mods.abyssalcraft.SummonRitual.addRitual("summonenderboss", 0, -1, 0, false, "srparasites:sim_enderman", [<minecraft:ender_pearl>, <srparasites:lurecomponent1>, null, <srparasites:lurecomponent1>, <srparasites:lurecomponent2>, <srparasites:lurecomponent1>, null, <srparasites:lurecomponent1>] );
game.setLocalization("ac.ritual.summonenderboss", "Assimilated enderman summon");
game.setLocalization("ac.ritual.summonenderboss.desc", "Summons an Assimilated enderman to fight.");

mods.abyssalcraft.SummonRitual.addRitual("summonmanducaterboss", 0, -1, 0, false, "srparasites:ada_manducater", [<contenttweaker:broken_pearl>, <minecraft:porkchop>, null, <minecraft:porkchop>, <minecraft:golden_apple>, <minecraft:porkchop>, null, <minecraft:porkchop>] );
game.setLocalization("ac.ritual.summonmanducaterboss", "Summon Manducater");
game.setLocalization("ac.ritual.summonmanducaterboss.desc", "Brings an adapted summoner into the world for you to fight.");

mods.abyssalcraft.SummonRitual.addRitual("summonsummonerboss", 0, -1, 0, false, "srparasites:ada_summoner", [<contenttweaker:broken_pearl>, <minecraft:egg>, null, <minecraft:egg>, <minecraft:golden_apple>, <minecraft:egg>, null, <minecraft:egg>] );
game.setLocalization("ac.ritual.summonsummonerboss", "Summon Summoner");
game.setLocalization("ac.ritual.summonsummonerboss.desc", "Brings an adapted summoner into the world for you to fight.");

mods.abyssalcraft.Rituals.mapDimensionToBookTypeAndName(2, 0, "Lunar altar");
mods.abyssalcraft.SummonRitual.addRitual("summonevil", 0, 2, 0, false, "srparasites:anc_dreadnaut", [<srparasites:evclock>]);
game.setLocalization("ac.ritual.summonevil", "Summon ???");
game.setLocalization("ac.ritual.summonevil.desc", "Don't");

mods.jei.JEI.removeAndHide(<hbm:assembly_calamity>);
mods.jei.JEI.removeAndHide(<advancedrocketry:concrete>);
mods.jei.JEI.removeAndHide(<minecraft:anvil>);
recipes.remove(<chisel:factory>);

// Rocket shell fueling
mods.immersiveengineering.BottlingMachine.addRecipe(<hbm:casing_50>.withTag({Filling: 2 as float}), <hbm:casing_50>, <liquid:rocketfuel>);
mods.immersiveintelligence.Filler.addRecipe(<hbm:casing_50>.withTag({Filling: 1 as float}), <hbm:casing_50>, "gunpowder", 1, 60, 200);

// Replacing the recipes for most molds
mods.immersiveengineering.Blueprint.removeRecipe(<immersiveengineering:mold:1>);
mods.immersiveengineering.Blueprint.removeRecipe(<immersiveengineering:mold:2>);
mods.immersiveengineering.Blueprint.removeRecipe(<immersiveengineering:mold:3>);
mods.immersiveengineering.Blueprint.removeRecipe(<immersiveengineering:mold:5>);
mods.immersiveengineering.Blueprint.removeRecipe(<immersiveengineering:mold:6>);
mods.immersiveengineering.Blueprint.removeRecipe(<immersiveengineering:mold:7>);
mods.immersiveengineering.Blueprint.addRecipe("molds", <hbm:stamp_desh_plate>, [<hbm:stamp_desh_flat>]);
mods.immersiveengineering.Blueprint.addRecipe("molds", <hbm:stamp_desh_wire>, [<hbm:stamp_desh_flat>]);
mods.immersiveengineering.Blueprint.addRecipe("molds", <immersiveengineering:mold:1>, [<hbm:stamp_desh_flat>]);
mods.immersiveengineering.Blueprint.addRecipe("molds", <immersiveengineering:mold:2>, [<hbm:stamp_desh_flat>]);
mods.immersiveengineering.Blueprint.addRecipe("molds", <immersiveengineering:mold:3>, [<hbm:stamp_desh_flat>]);
mods.immersiveengineering.Blueprint.addRecipe("molds", <immersiveengineering:mold:5>, [<hbm:stamp_desh_flat>]);
mods.immersiveengineering.Blueprint.addRecipe("molds", <immersiveengineering:mold:6>, [<hbm:stamp_desh_flat>]);
mods.immersiveengineering.Blueprint.addRecipe("molds", <immersiveengineering:mold:7>, [<hbm:stamp_desh_flat>]);
mods.immersiveengineering.Blueprint.addRecipe("molds", <contenttweaker:mold_long>, [<hbm:stamp_desh_flat>]);
//<immersiveengineering:blueprint> <contenttweaker:mold_long>
//mods.immersiveengineering.Blueprint.addRecipe(String category, IItemStack output, IIngredient[] inputs);

// Early weapon mechanism assembly
mods.immersiveintelligence.PrecisionAssembler.addRecipe(<hbm:mechanism_rifle_1>, <hbm:mechanism_revolver_1>,[<hbm:mechanism_revolver_1>*2, <ore:plateIron>*3, <immersiveintelligence:material_ingot:7>*2, <ore:ingotCopper>*2], ["solderer","welder","inserter"], ["inserter pick first","solderer work main","inserter drop main","welder work main"], 8000, 1);
mods.immersiveintelligence.PrecisionAssembler.addRecipe(<hbm:mechanism_revolver_1>, <minecraft:iron_nugget>,[<ore:plateIron>*4, <ore:ingotAluminum>*2, <ore:ingotCopper>*2], ["solderer","welder","inserter"], ["inserter pick first","solderer work main","inserter drop main","welder work main"], 8000, 1);
mods.immersiveintelligence.PrecisionAssembler.addRecipe(<hbm:mechanism_launcher_1>, <hbm:mechanism_rifle_1>,[<ore:plateTungsten>*3, <ore:ingotSteel>*3, <hbm:bolt_tungsten>*3, <hbm:mechanism_rifle_1>], ["solderer","welder","inserter"], ["inserter pick first","solderer work main","inserter drop main","welder work main"], 8000, 1);
recipes.remove(<hbm:mechanism_rifle_1>);
recipes.remove(<hbm:mechanism_revolver_1>);
recipes.remove(<hbm:mechanism_launcher_1>);

recipes.addShaped("AssemblyRevolverMech", <immersiveintelligence:assembly_scheme>.withTag({recipeItem: {id: "advancedrocketry:ic", Count: 1 as byte, Damage: 5 as short}}),
 [[null,<immersiveengineering:revolver>,null],
  [<ore:dyeBlue>,<ore:dyeBlue>,<ore:dyeBlue>],
  [<ore:paper>,<ore:paper>,<ore:paper>]]
);

recipes.addShaped("AssemblyRifleMech", <immersiveintelligence:assembly_scheme>.withTag({recipeItem: {id: "advancedrocketry:ic", Count: 1 as byte, Damage: 5 as short}}),
 [[null,<immersiveintelligence:rifle>,null],
  [<ore:dyeBlue>,<ore:dyeBlue>,<ore:dyeBlue>],
  [<ore:paper>,<ore:paper>,<ore:paper>]]
);

recipes.addShaped("AssemblyLauncherMech", <immersiveintelligence:assembly_scheme>.withTag({recipeItem: {id: "advancedrocketry:ic", Count: 1 as byte, Damage: 5 as short}}),
 [[null,<immersiveengineering:chemthrower>,null],
  [<ore:dyeBlue>,<ore:dyeBlue>,<ore:dyeBlue>],
  [<ore:paper>,<ore:paper>,<ore:paper>]]
);

<hbm:casing_50>.withTag({Filling: 1 as float}).addTooltip("Filled with gunpowder");
<hbm:casing_50>.withTag({Filling: 2 as float}).addTooltip("Filled with rocket fuel");