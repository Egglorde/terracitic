import mods.immersiveengineering.AlloySmelter;
import mods.immersiveintelligence.Sawmill;
import crafttweaker.item.IItemTransformer;
import mods.immersiveengineering.MetalPress;
import mods.TinkersForging.Anvil;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import mods.tconstruct.Casting;
import mods.betterwithmods.HeatRegistry;

val steel = <ore:ingotSteel>;
steel.add(<betterwithmods:material:14>);
val steelblock = <ore:blockSteel>;
steelblock.add(<betterwithmods:steel_block>);
val steelplate = <ore:plateSteel>;
steelplate.add(<betterwithmods:material:51>);
val fabric = <ore:fabricHemp>;
fabric.add(<hbm:rag>);

recipes.removeShaped(<immersiveengineering:wooden_decoration>, [[<immersiveengineering:treated_wood>,<immersiveengineering:material>,<immersiveengineering:treated_wood>],[<immersiveengineering:treated_wood>,<immersiveengineering:material>,<immersiveengineering:treated_wood>]]);

recipes.addShapeless(<hbm:powder_neodymium_tiny>, [<immersiveengineering:tool>.anyDamage().reuse(), <hbm:fragment_neodymium>]);
recipes.addShapeless(<hbm:powder_boron_tiny>, [<immersiveengineering:tool>.anyDamage().reuse(), <hbm:fragment_boron>]);

// Soulsteel redone
//      Regular steel removal
mods.immersiveengineering.BlastFurnace.removeRecipe(<immersiveengineering:storage:8>);
mods.immersiveengineering.BlastFurnace.removeRecipe(<immersiveengineering:metal:8>);
//      Hellcoal Replacement
mods.immersiveengineering.BlastFurnace.removeFuel(<immersiveengineering:material:6>);
mods.immersiveengineering.BlastFurnace.removeFuel(<chisel:block_charcoal>);
mods.immersiveengineering.BlastFurnace.removeFuel(<chisel:block_coal_coke>);
mods.immersiveengineering.BlastFurnace.removeFuel(<minecraft:coal:1>);
mods.immersiveengineering.BlastFurnace.addFuel(<hbm:coal_infernal>, 3000);
mods.immersiveengineering.BlastFurnace.addFuel(<hbm:block_coal_infernal>, 40500);
recipes.addShaped("torchesbutmore", <minecraft:torch>*8,
 [[<hbm:coal_infernal>],
  [<minecraft:stick>]]
);
//      Soulsteel production
mods.immersiveengineering.BlastFurnace.addRecipe(<betterwithmods:material:14>, <ore:ingotIron>, 2000);
mods.immersiveengineering.BlastFurnace.addRecipe(<betterwithmods:steel_block>, <ore:blockIron>, 4500);
mods.immersiveengineering.BlastFurnace.addRecipe(<variedcommodities:ingot_demonic>, <ore:ingotLead>, 4500);
//      Crucible based recipe
mods.betterwithmods.Crucible.removeAll();
mods.betterwithmods.Crucible.addStoked([<betterwithmods:material:17>*2, <quark:black_ash>*4, <quark:soul_powder>], [<betterwithmods:material:14>*2]);
// Steel Casting rework
//       non-SoulSteel casting removal
mods.tconstruct.Casting.removeBasinRecipe(<immersiveengineering:storage:8>);
mods.tconstruct.Casting.removeTableRecipe(<immersiveengineering:metal:38>);
mods.tconstruct.Casting.removeTableRecipe(<libvulpes:productgear:6>);
mods.tconstruct.Casting.removeTableRecipe(<immersiveengineering:storage:8>);
mods.tconstruct.Casting.removeTableRecipe(<immersiveengineering:metal:8>);
mods.tconstruct.Casting.removeTableRecipe(<immersiveengineering:metal:28>);
// Cheese removal
mods.tconstruct.Casting.removeBasinRecipe(<rats:block_of_cheese>);
//       Soulsteel casting insertion
mods.tconstruct.Casting.addBasinRecipe(<betterwithmods:steel_block>, null, <liquid:steel>, 2304);
mods.tconstruct.Casting.addTableRecipe(<betterwithmods:material:51>, <tconstruct:cast_custom:3>, <liquid:steel>, 144);
mods.tconstruct.Casting.addTableRecipe(<hbm:meteorite_sword_seared>, <hbm:meteorite_sword>, <liquid:stone>, 1440);
mods.tconstruct.Casting.addTableRecipe(<betterwithmods:material:48>, <tconstruct:cast_custom:4>, <liquid:steel>, 576);
mods.tconstruct.Casting.addTableRecipe(<betterwithmods:material:14>, <tconstruct:cast_custom>, <liquid:steel>, 144);
mods.tconstruct.Casting.addTableRecipe(<betterwithmods:material:30>, <tconstruct:cast_custom:1>, <liquid:steel>, 16);

mods.MobStages.addStage("srp_phase_4", "srparasites:pri_vermin");
mods.MobStages.addReplacement("srparasites:pri_vermin", "srparasites:pri_longarms");

// Soulsteel Anvil recipes
mods.betterwithmods.Anvil.addShapedFixed(<immersiveengineering:stone_decoration:1>*27, [
   [<ore:blockSeared>, <minecraft:nether_brick>, <minecraft:nether_brick>, <ore:blockSeared>],
   [<minecraft:nether_brick>, <betterwithmods:material:25>, <betterwithmods:material:25>, <minecraft:nether_brick>],
   [<minecraft:nether_brick>, <betterwithmods:material:25>, <betterwithmods:material:25>, <minecraft:nether_brick>],
   [<ore:blockSeared>, <minecraft:nether_brick>, <minecraft:nether_brick>, <ore:blockSeared>]
]);
mods.betterwithmods.Anvil.addShapedFixed(<betterwithmods:material:17>, [
   [<betterwithmods:material:16>, <betterwithmods:material:16>, <betterwithmods:material:16>, <betterwithmods:material:16>]
]);
mods.betterwithmods.Anvil.addShapedFixed(<variedcommodities:demonic_head>, [
   [<variedcommodities:ingot_demonic>, <variedcommodities:ingot_demonic>, <variedcommodities:ingot_demonic>, <variedcommodities:ingot_demonic>],
   [<variedcommodities:ingot_demonic>, null, null, <variedcommodities:ingot_demonic>],
   [<variedcommodities:ingot_demonic>, null, null, <variedcommodities:ingot_demonic>]
]);
mods.betterwithmods.Anvil.addShapedFixed(<variedcommodities:demonic_chest>, [
   [<variedcommodities:ingot_demonic>, null, null, <variedcommodities:ingot_demonic>],
   [<variedcommodities:ingot_demonic>, <variedcommodities:ingot_demonic>, <variedcommodities:ingot_demonic>, <variedcommodities:ingot_demonic>],
   [<variedcommodities:ingot_demonic>, <variedcommodities:ingot_demonic>, <variedcommodities:ingot_demonic>, <variedcommodities:ingot_demonic>],
   [<variedcommodities:ingot_demonic>, <variedcommodities:ingot_demonic>, <variedcommodities:ingot_demonic>, <variedcommodities:ingot_demonic>]
]);
mods.betterwithmods.Anvil.addShapedFixed(<variedcommodities:demonic_legs>, [
   [<variedcommodities:ingot_demonic>, <variedcommodities:ingot_demonic>, <variedcommodities:ingot_demonic>, <variedcommodities:ingot_demonic>],
   [<variedcommodities:ingot_demonic>, null, null, <variedcommodities:ingot_demonic>],
   [<variedcommodities:ingot_demonic>, null, null, <variedcommodities:ingot_demonic>],
   [<variedcommodities:ingot_demonic>, null, null, <variedcommodities:ingot_demonic>]
]);
mods.betterwithmods.Anvil.addShapedFixed(<variedcommodities:demonic_boots>, [
   [<variedcommodities:ingot_demonic>, null, null, <variedcommodities:ingot_demonic>],
   [<variedcommodities:ingot_demonic>, null, null, <variedcommodities:ingot_demonic>]
]);
mods.betterwithmods.Anvil.addShapedFixed(<variedcommodities:demonic_broadsword>, [
   [null, <variedcommodities:ingot_demonic>, null, <variedcommodities:ingot_demonic>],
   [<variedcommodities:ingot_demonic>, null, <variedcommodities:ingot_demonic>, null],
   [null, <ore:logWood>, null, <variedcommodities:ingot_demonic>],
   [<variedcommodities:ingot_demonic>, null, <variedcommodities:ingot_demonic>, null]
]);
mods.betterwithmods.Anvil.addShapedFixed(<lycanitesmobs:soulkey>, [
   [null,null,<ore:ingotSteel>,null],
   [<ore:ingotSteel>,<ore:ingotSteel>,<variedcommodities:heart>,<ore:ingotSteel>],
   [<ore:ingotSteel>,null,<ore:ingotSteel>,null]
]);

// Alternative recipes
recipes.addShapeless("glowstonedust",<minecraft:glowstone_dust>,[<hbm:powder_thermite>,<hbm:powder_thermite>,<hbm:powder_thermite>, <minecraft:blaze_powder>]);
recipes.addShapeless("firecharge",<minecraft:fire_charge>,[<betterwithmods:material:16>, <minecraft:blaze_powder>]);
recipes.addShapeless("infernalcoal",<hbm:coal_infernal>,[<hbm:coke>, <minecraft:fire_charge>]);
recipes.addShapeless("bonedupe",<tconstruct:materials:17>,[<quark:black_ash>, <minecraft:bone>]);
recipes.addShapeless("artistrap",<betterwithmods:material:8>*4,[<immersiveintelligence:material:27>, <minecraft:shears>.reuse()]);

// Coke, redone!
mods.immersiveengineering.CokeOven.addRecipe(<hbm:coke>, 500, <minecraft:coal>, 2000);
mods.immersiveengineering.CokeOven.addRecipe(<hbm:coke>*2, 1000, <hbm:lignite>, 2000);
mods.immersiveengineering.CokeOven.addRecipe(<hbm:block_coke>, 5000, <ore:blockCoal>, 2000);
mods.immersiveengineering.CokeOven.addRecipe(<hbm:block_coke>*2, 10000, <hbm:block_lignite>, 2000);
mods.immersiveengineering.CokeOven.addRecipe(<hbm:coke>*4, 2000, <hbm:briquette_lignite>, 2000);
mods.immersiveengineering.CokeOven.removeRecipe(<immersiveengineering:stone_decoration:3>);
mods.immersiveengineering.CokeOven.removeRecipe(<immersiveengineering:material:6>);
furnace.remove(<hbm:coke>);
furnace.remove(<hbm:meteorite_sword_seared>);

// Ingot grinding
mods.betterwithmods.Mill.addRecipe([<ore:ingotAluminum>],[<immersiveengineering:metal:10>]);
mods.betterwithmods.Mill.addRecipe([<minecraft:iron_ingot>],[<immersiveengineering:metal:18>]);
// Necrotic bone grinding
mods.betterwithmods.Mill.addRecipe([<tconstruct:materials:17>],[<quark:black_ash>*2]);
// Brimstone grinding
mods.immersiveengineering.Crusher.addRecipe(<betterwithmods:material:25>*2, <quark:biome_cobblestone>, 200, <hbm:coal_infernal>, 0.25);
// Lignite grinding
mods.betterwithmods.Mill.addRecipe([<hbm:lignite>],[<hbm:powder_lignite>]);
mods.immersiveengineering.Crusher.addRecipe(<hbm:powder_lignite>*2, <hbm:lignite>, 200, <hbm:dust>, 0.25);


// Hellfire recipe removal
mods.betterwithmods.Cauldron.remove([<betterwithmods:material:17>]);
mods.betterwithmods.Cauldron.remove([<betterwithmods:material:1>*4]);

// Summoning Greater Daemons
mods.abyssalcraft.SummonRitual.addRitual("summonArchvile", 0, -1, 0 as float, false, "lycanitesmobs:archvile", [<minecraft:skull>, <minecraft:quartz>, <hbm:powder_fire>, <minecraft:quartz>, <hbm:powder_fire>, <minecraft:quartz>, <hbm:powder_fire>, <minecraft:quartz>] as crafttweaker.item.IIngredient[], {MobLevel:40} as crafttweaker.data.IData);
game.setLocalization("ac.ritual.summonArchvile", "Summon Apollyon");
game.setLocalization("ac.ritual.summonArchvile.desc", "Summons an Apollyon, the most dangerous of all greater daemons.");

mods.abyssalcraft.SummonRitual.addRitual("summonVorach", 0, -1, 0 as float, false, "lycanitesmobs:vorach", [<quark:soul_powder>, <quark:black_ash>, <betterwithmods:material:17>, <quark:black_ash>, <quark:soul_powder>, <quark:black_ash>, <betterwithmods:material:17>, <quark:black_ash>] as crafttweaker.item.IIngredient[], {MobLevel:40} as crafttweaker.data.IData);
game.setLocalization("ac.ritual.summonVorach", "Summon Vorach");
game.setLocalization("ac.ritual.summonVorach.desc", "Summons an Vorach, a rock golemite demon from the deepest depths of hell.");

mods.abyssalcraft.SummonRitual.addRitual("summonImp", 0, -1, 0 as float, false, "lycanitesmobs:afrit", [<quark:soul_powder>, <betterwithmods:material:17>, <tconstruct:materials:17>, <betterwithmods:material:17>, <quark:soul_powder>, <betterwithmods:material:17>, <tconstruct:materials:17>, <betterwithmods:material:17>] as crafttweaker.item.IIngredient[], {MobLevel:40} as crafttweaker.data.IData);
game.setLocalization("ac.ritual.summonImp", "Summon Afrit");
game.setLocalization("ac.ritual.summonImp.desc", "Summons an Afrit, an imp used by Apollyons as a servant or herald.");

// Summoning Lesser Daemons
mods.abyssalcraft.SummonRitual.addRitual("summonCacodemon", 0, -1, 0 as float, false, "lycanitesmobs:cacodemon", [<minecraft:ender_eye>, <minecraft:blaze_powder>, <minecraft:bone>, <minecraft:blaze_powder>, <tconstruct:edible:3> , <minecraft:blaze_powder>, <minecraft:bone>, <minecraft:blaze_powder>] as crafttweaker.item.IIngredient[], {MobLevel:40} as crafttweaker.data.IData);
game.setLocalization("ac.ritual.summonCacodemon", "Summon Malwrath");
game.setLocalization("ac.ritual.summonCacodemon.desc", "Summons a Malwrath, a horrible floating demon filled with souls.");

mods.abyssalcraft.SummonRitual.addRitual("summonPinky", 0, -1, 0 as float, false, "lycanitesmobs:pinky", [<minecraft:bone>, <minecraft:glowstone>, <minecraft:porkchop>, <minecraft:netherrack>, <minecraft:bone>, <minecraft:netherrack>, <minecraft:porkchop>, <minecraft:glowstone>] as crafttweaker.item.IIngredient[], {MobLevel:40} as crafttweaker.data.IData);
game.setLocalization("ac.ritual.summonPinky", "Summon Kathoga");
game.setLocalization("ac.ritual.summonPinky.desc", "Summons an Kathoga, a hungry beast that desires nothing but flesh.");

mods.abyssalcraft.SummonRitual.addRitual("summonBaronOfHell", 0, -1, 0 as float, false, "lycanitesmobs:behemoth", [<minecraft:wool:12>, <betterwithmods:material:16>, <minecraft:beef>, <betterwithmods:material:16>,<minecraft:wool:12>, <betterwithmods:material:16>, <minecraft:beef>, <betterwithmods:material:16>] as crafttweaker.item.IIngredient[], {MobLevel:40} as crafttweaker.data.IData);
game.setLocalization("ac.ritual.summonBaronOfHell", "Summon Behemoth");
game.setLocalization("ac.ritual.summonBaronOfHell.desc", "Summons a Behemoth, a flaming knight of hell.");

// Summoning Basic Daemons
mods.abyssalcraft.SummonRitual.addRitual("summonarchLostSoul", 0, -1, 0 as float, false, "lycanitesmobs:wraith", [<minecraft:skull>, <ore:dustSaltpeter>, <ore:dustSaltpeter>, <ore:dustSaltpeter>, <minecraft:flint_and_steel>, <ore:dustSulfur>, <ore:dustSulfur>, <ore:dustSulfur>] as crafttweaker.item.IIngredient[], {MobLevel:40} as crafttweaker.data.IData);
game.setLocalization("ac.ritual.summonarchLostSoul", "Summon Wraith");
game.setLocalization("ac.ritual.summonarchLostSoul.desc", "Summons an Wraith, the flaming remains of a damnned soul.");

mods.abyssalcraft.SummonRitual.addRitual("summonBelphegor", 0, -1, 0 as float, false, "lycanitesmobs:belph", [<minecraft:skull:2>, <minecraft:bone>, <minecraft:rotten_flesh>, <minecraft:rotten_flesh>, <minecraft:bone>, <minecraft:rotten_flesh>, <minecraft:rotten_flesh>, <minecraft:bone>] as crafttweaker.item.IIngredient[], {MobLevel:40} as crafttweaker.data.IData);
game.setLocalization("ac.ritual.summonBelphegor", "Summon Belphegor");
game.setLocalization("ac.ritual.summonBelphegor.desc", "Summons a Belphegor, a low-level demon of hell.");

mods.betterwithmods.Saw.add(<ore:stoneBasalt>, [<tconstruct:materials>*4]);

// Artificial leather and such like
mods.inworldcrafting.FluidToItem.transform(<immersiveintelligence:material:26>, <liquid:creosote>, [<immersiveintelligence:material:25>]);
mods.inworldcrafting.FluidToItem.transform(<immersiveintelligence:material:25>, <liquid:water>, [<betterwithmods:material:22>]);
mods.immersiveengineering.Crusher.addRecipe(<betterwithmods:material:33>, <betterwithmods:material:31>, 2048);
mods.immersiveengineering.Crusher.addRecipe(<betterwithmods:material:7>, <minecraft:leather>, 2048);
mods.immersiveengineering.BottlingMachine.addRecipe(<betterwithmods:material:6>, <betterwithmods:material:7>, <liquid:tannin>*5);
mods.immersiveengineering.BottlingMachine.addRecipe(<betterwithmods:material:32>, <betterwithmods:material:33>, <liquid:tannin>*5);
mods.immersiveengineering.Mixer.addRecipe(<liquid:tannin>*50, <liquid:ethanol>*5, [<ore:barkWood>*2], 2048);
mods.immersiveengineering.Mixer.addRecipe(<liquid:tannin>*500, <liquid:ethanol>*50, [<ore:dung>], 2048);
// <betterwithmods:bark>
// CHANGE THIS!!!

// Solid and Liquid fuel chain
mods.immersiveintelligence.Coagulator.addRecipe(<srparasites:infestedore:4>*32, <liquid:oil>*1000, <liquid:blood>*200, 8000, 1000);
mods.immersiveintelligence.Coagulator.addRecipe(<srparasites:infestedore:4>*32, <liquid:deadblood>*1000, <liquid:blood>*200, 8000, 1000);
mods.immersivetechnology.Boiler.addRecipe(<liquid:hotoil> * 10, <liquid:oil> * 10, 3);

// Metorite Sword Tree
mods.immersiveengineering.AlloySmelter.addRecipe(<hbm:ingot_meteorite>, <betterwithmods:material:45>, <hbm:fragment_meteorite>*10, 2000);
Anvil.addItemHeat(<hbm:ingot_meteorite>, 1300, 1501);
Anvil.addItemHeat(<hbm:meteorite_sword_seared>, 1300, 1501);
Anvil.addItemHeat(<hbm:ingot_meteorite_forged>, 1300, 1501);
Anvil.addRecipe(<hbm:ingot_meteorite>*10, <hbm:ingot_meteorite_forged>, 2, "hit_any", "punch_second_last", "draw_last");
Anvil.addRecipe(<hbm:meteorite_sword_seared>, <hbm:meteorite_sword_reforged>, 3, "hit_any", "draw_second_last", "draw_last");
Anvil.addRecipe(<hbm:ingot_meteorite_forged>*10, <hbm:blade_meteorite>, 2, "hit_any", "draw_second_last", "draw_last");
mods.immersiveengineering.MetalPress.addRecipe(<tconstruct:spaghetti>, <betterwithmods:raw_pastry:3>, <hbm:stamp_desh_wire>, 2000);

// Rupter Ramen Tree
recipes.remove(<srpmeshi:rupter_ramen>);
mods.ntm.Press.addRecipe(<tconstruct:spaghetti>,<betterwithmods:raw_pastry:3>, 3);
mods.betterwithmods.Cauldron.addUnstoked([<tconstruct:moms_spaghetti>, <srparasites:lurecomponent1>, <minecraft:bowl>, <ore:stickWood>*2, <ore:meatPork>, <tconstruct:edible:3>, <ore:egg>], [<srpmeshi:rupter_ramen>]);
// Potion stews recipes
mods.betterwithmods.Cauldron.addUnstoked([<ore:mushroomAny>*3, <minecraft:bowl>, <minecraft:milk_bucket>, <futuremc:cornflower>], [<futuremc:suspicious_stew>.withTag({CustomPotionEffects: [{CurativeItems: [{id: "minecraft:milk_bucket", Count: 1 as byte, Damage: 0 as short}], Ambient: 0 as byte, ShowParticles: 1 as byte, Duration: 100, Id: 8 as byte, Amplifier: 1 as byte}]})]);
mods.betterwithmods.Cauldron.addUnstoked([<ore:mushroomAny>*3, <minecraft:bowl>, <minecraft:milk_bucket>, <futuremc:lily_of_the_valley>], [<futuremc:suspicious_stew>.withTag({CustomPotionEffects: [{CurativeItems: [{id: "minecraft:milk_bucket", Count: 1 as byte, Damage: 0 as short}], Ambient: 0 as byte, ShowParticles: 1 as byte, Duration: 100, Id: 19 as byte, Amplifier: 1 as byte}]})]);
mods.betterwithmods.Cauldron.addUnstoked([<ore:mushroomAny>*3, <minecraft:bowl>, <minecraft:milk_bucket>, <minecraft:red_flower:1>], [<futuremc:suspicious_stew>.withTag({CustomPotionEffects: [{CurativeItems: [{id: "minecraft:milk_bucket", Count: 1 as byte, Damage: 0 as short}], Ambient: 0 as byte, ShowParticles: 1 as byte, Duration: 100, Id: 23 as byte, Amplifier: 1 as byte}]})]);
mods.betterwithmods.Cauldron.addUnstoked([<ore:mushroomAny>*3, <minecraft:bowl>, <minecraft:milk_bucket>, <futuremc:wither_rose>], [<futuremc:suspicious_stew>.withTag({CustomPotionEffects: [{CurativeItems: [{id: "minecraft:milk_bucket", Count: 1 as byte, Damage: 0 as short}], Ambient: 0 as byte, ShowParticles: 1 as byte, Duration: 100, Id: 20 as byte, Amplifier: 1 as byte}]})]);
mods.betterwithmods.Cauldron.addUnstoked([<ore:mushroomAny>*3, <minecraft:bowl>, <minecraft:milk_bucket>, <minecraft:yellow_flower>], [<futuremc:suspicious_stew>.withTag({CustomPotionEffects: [{CurativeItems: [{id: "minecraft:milk_bucket", Count: 1 as byte, Damage: 0 as short}], Ambient: 0 as byte, ShowParticles: 1 as byte, Duration: 100, Id: 23 as byte, Amplifier: 1 as byte}]})]);
mods.betterwithmods.Cauldron.addUnstoked([<ore:mushroomAny>*3, <minecraft:bowl>, <minecraft:milk_bucket>, <srparasites:lurecomponent1>], [<futuremc:suspicious_stew>.withTag({CustomPotionEffects: [{CurativeItems: [{id: "minecraft:milk_bucket", Count: 1 as byte, Damage: 0 as short}], Ambient: 0 as byte, ShowParticles: 1 as byte, Duration: 100, Id: 70 as byte, Amplifier: 1 as byte}]})]);
// Plauge cauldron recipes
mods.betterwithmods.Cauldron.addUnstoked([<quark:sugar_block>], [<rats:treacle>]);
mods.betterwithmods.Cauldron.addUnstoked([<rats:treacle>, <rats:herb_bundle>, <rats:plague_leech>], [<rats:plague_stew>]);
// Blood thing
mods.tconstruct.Casting.addTableRecipe(<hbm:iv_blood>, <hbm:iv_empty>, <liquid:blood>, 250);

// Campfire heat sources
// All of these are neesecary to disable usage of out campfires for cooking
mods.betterwithmods.HeatRegistry.addHeatSource(<futuremc:campfire:4>, 1);
mods.betterwithmods.HeatRegistry.addHeatSource(<futuremc:campfire:5>, 1);
mods.betterwithmods.HeatRegistry.addHeatSource(<futuremc:campfire:6>, 1);
mods.betterwithmods.HeatRegistry.addHeatSource(<futuremc:campfire:7>, 1);
mods.betterwithmods.HeatRegistry.addHeatSource(<futuremc:campfire:12>, 1);
mods.betterwithmods.HeatRegistry.addHeatSource(<futuremc:campfire:13>, 1);
mods.betterwithmods.HeatRegistry.addHeatSource(<futuremc:campfire:14>, 1);
mods.betterwithmods.HeatRegistry.addHeatSource(<futuremc:campfire:15>, 1);
