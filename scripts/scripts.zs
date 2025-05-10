import crafttweaker.event.EntityLivingUseItemEvent.All;
import crafttweaker.events.IEventManager;
import crafttweaker.entity.AttributeModifier;
import crafttweaker.entity.Attribute;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntity;
import crafttweaker.event.ILivingEvent;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.event.EntityLivingSpawnEvent;
import crafttweaker.event.EntityLivingExtendedSpawnEvent;
import crafttweaker.event.EntityLivingUpdateEvent;
import crafttweaker.damage.IDamageSource;
import crafttweaker.util.IRandom;
import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;

var KebabMod = crafttweaker.entity.AttributeModifier.createModifier("generic.maxHealth", 20, 0, "d71169e7-a58b-4046-8b13-c3e93d9b5a64");
var SandwhichMod = crafttweaker.entity.AttributeModifier.createModifier("generic.maxHealth", 40, 0, "582a448e-20b9-41fd-a57d-5a4e0d6795ec");
var RamenMod = crafttweaker.entity.AttributeModifier.createModifier("generic.maxHealth", 10, 0, "00c95161-01fb-44c5-bb39-2dd44113803b");
var EyeBallMod = crafttweaker.entity.AttributeModifier.createModifier("generic.maxHealth", 30, 0, "bff4a0c9-a774-4c23-9027-d8fe09c4e1a2");
static c as int[] = [9990];
val IgnoreGrav = [
    "lycanitesmobs:beholder",
    "lycanitesmobs:arcanelaserstorm",
    "lycanitesmobs:arcanelaser",
    "lycanitesmobs:spectre",
    "lycanitesmobs:spectralbolt",
    "lycanitesmobs:grue",
    "lycanitesmobs:aegis",
    "lycanitesmobs:sylph"
] as string[];
val Sentients = {
    <srparasites:weapon_scythe_sentient> : [
        //Intro Quotes
        [
            "> Greetings, machine",
            "> Greetings, filth",
            "> Greetings, child of man"
        ],
        //Chatter Quotes
        [
            "> We one many, we are many...",
            "> I was the first, I have seen everything...",
            "> We are your god's hubris."
        ],
        //Attack Quotes
        [
            "> Death to all who oppose us!",
            "> Die monster!",
            "> Feel our wrath!"
        ]
    ],
    <srparasites:weapon_axe_sentient> : [
        //Intro Quotes
        [
            "> Greetings, machine",
            "> Greetings, filth",
            "> Greetings, child of man"
        ],
        //Chatter Quotes
        [
            "> We are one, we are many...",
            "> I was the first, I have seen everything...",
            "> We are your god's hubris."
        ],
        //Attack Quotes
        [
            "> Death to all who oppose us!",
            "> Die monster!",
            "> Feel our wrath!"
        ]
    ]
} as string[][][IItemStack];
val ChattyItems = [
    <srparasites:weapon_scythe_sentient>,
    <srparasites:weapon_axe_sentient>
] as IItemStack[];




events.onEntityLivingUseItemFinish(
    function(event as crafttweaker.event.EntityLivingUseItemEvent.Finish){
        if ("srpmeshi:core_kebab".matches(event.item.definition.id)) {
            event.player.addGameStage("corekebabeaten");
            if (!event.entityLivingBase.getAttribute("generic.maxHealth").hasModifier(KebabMod)) {
                event.player.sendStatusMessage("You consume the parasitic cores and gain their power!");
            }
        }
        if ("srpmeshi:sum_jelly_sandwich_b".matches(event.item.definition.id)) {
            event.player.addGameStage("sandwhicheaten");
            if (!event.entityLivingBase.getAttribute("generic.maxHealth").hasModifier(SandwhichMod)) {
                event.player.sendStatusMessage("You consume the summoner jelly sandwhich and gain its power!");
            }
        }
        if ("srpmeshi:eyebush_stick".matches(event.item.definition.id)) {
            event.player.addGameStage("jellyeaten");
            if (!event.entityLivingBase.getAttribute("generic.maxHealth").hasModifier(EyeBallMod)) {
                event.player.sendStatusMessage("You consume the eyeball and gain its power!");
            }
        }
        if ("srpmeshi:rupter_ramen".matches(event.item.definition.id)) {
            event.player.addGameStage("rameneaten");
            if (!event.entityLivingBase.getAttribute("generic.maxHealth").hasModifier(RamenMod)) {
                event.player.sendStatusMessage("You consume the ramen and gain its power!");
            }
        }
    }
);

events.onPlayerTick(
    function(event as crafttweaker.event.PlayerTickEvent){
        if (event.player.hasGameStage("corekebabeaten")){
            if (!event.entityLivingBase.getAttribute("generic.maxHealth").hasModifier(KebabMod)) {
                event.entityLivingBase.getAttribute("generic.maxHealth").applyModifier(KebabMod);
            }
        }
        if (event.player.hasGameStage("sandwhicheaten")){
            if (!event.entityLivingBase.getAttribute("generic.maxHealth").hasModifier(SandwhichMod)) {
                event.entityLivingBase.getAttribute("generic.maxHealth").applyModifier(SandwhichMod);
            }
        }
        if (event.player.hasGameStage("jellyeaten")){
            if (!event.entityLivingBase.getAttribute("generic.maxHealth").hasModifier(EyeBallMod)) {
                event.entityLivingBase.getAttribute("generic.maxHealth").applyModifier(EyeBallMod);
            }
        }
        if (event.player.hasGameStage("rameneaten")){
            if (!event.entityLivingBase.getAttribute("generic.maxHealth").hasModifier(RamenMod)) {
                event.entityLivingBase.getAttribute("generic.maxHealth").applyModifier(RamenMod);
            }
        }
        if (ChattyItems has event.player.currentItem) {
            if (c[0] == 10000 || c[0] == 10001) {
                c[0] = 0;
                event.player.sendChat("<" ~ event.player.currentItem.displayName ~ Sentients[event.player.currentItem][0][event.entity.world.random.nextInt(0,2)]);
            } 
            if (c[0] == 5000 || c[0] == 5001) {
                c[0] = 0;
                event.player.sendChat("<" ~ event.player.currentItem.displayName ~ Sentients[event.player.currentItem][1][event.entity.world.random.nextInt(0,2)]);
            }
            c[0] = c[0]+event.entity.world.random.nextInt(0,2);
        } else {
            c[0] = 9990;
        }
    }
);

events.onEntityLivingUpdate(
    function(event as crafttweaker.event.EntityLivingUpdateEvent){
        if(!isNull(event.entityLivingBase.definition)){
            if (IgnoreGrav has event.entityLivingBase.definition.id){
                event.entityLivingBase.hasNoGravity = true;
            }
        }
        
    }
);

// Sentience

print("Scripts are online");