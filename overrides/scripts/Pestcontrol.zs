#loader contenttweaker 
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.IItemRightClick;
import mods.contenttweaker.Commands;

var zsItem = VanillaFactory.createItem("broken_pearl");
zsItem.rarity = "rare";
zsItem.maxStackSize = 1;

zsItem.register();

var placeholder = VanillaFactory.createItem("john_placeholder");
placeholder.rarity = "rare";
placeholder.maxStackSize = 1;

placeholder.register();

var moldbuckshot = VanillaFactory.createItem("mold_buckshot");
moldbuckshot.maxStackSize = 1;

moldbuckshot.register();

var mold44 = VanillaFactory.createItem("mold_44");
mold44.maxStackSize = 1;

mold44.register();

var mold357 = VanillaFactory.createItem("small_cup_case");
mold357.register();

var moldlarge = VanillaFactory.createItem("large_cup_case");
moldlarge.register();

var moldlong = VanillaFactory.createItem("mold_long");
moldlong.maxStackSize = 1;
moldlong.register();

var brasssheet = VanillaFactory.createItem("brass_sheet");
brasssheet.register();
