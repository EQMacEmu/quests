local SIRRANS = {
	71058, -- isle 1
	71023, -- isle 2
	71025, -- isle 3
	71026, -- isle 4
	71029, -- isle 5
	71036, -- isle 6
	71078  -- isle 7
}

function SirranSpawn(e)
	eq.set_timer("bye",1200000);
end

function SirranTimer(e)
	if(e.timer == "bye") then
		eq.stop_timer("bye");
		eq.depop();
	end
end

function SirranCombat(e)
	if(e.joined == true) then
		e.self:Shout("What?! Now you've done it! The bunnies are angry! ANGRY I TELL YOU!");
	end
end

function ThunderSpiritDeath(e)
	eq.unique_spawn(71058,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: Sirran_the_Lunatic isle 1
end

function ProtectorSkyDeath(e)
	eq.unique_spawn(71023,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: Sirran_the_Lunatic isle 2
end

function GorgaloskDeath(e)
	eq.unique_spawn(71025,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: Sirran_the_Lunatic isle 3
end

function KeeperSoulDeath(e)
	eq.unique_spawn(71026,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: Sirran_the_Lunatic isle 4
	eq.delete_global("keeper"); -- removed the global timer.
end

function SpirocLordDeath(e)
	eq.unique_spawn(71029,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: Sirran_the_Lunatic isle 5
	eq.signal(71013, 1); -- The_Spiroc_Guardian
end

function BazztZzztDeath(e)
	eq.unique_spawn(71036,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: Sirran_the_Lunatic isle 6
end

function SisterSpireDeath(e)
	eq.unique_spawn(71078,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: Sirran_the_Lunatic isle 7
end

function SirranThundersay(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ehem! What? Oh, hello there! Sirran be my name. Yes? So, come to the Plane of Sky, have you? Killed all my fairies! Hah! So! Do you wish to know how to traverse this plane? Or should I just go away? I know much about this plane. You would do well to listen!");
	elseif(e.message:findi("plane")) then
		e.self:Say("Ahah! Wise you are and tell you I will. Hrm? Don't have wings, do you? Fairies have swords! Fairies stole my lucky feet! Hand me them, one by one, and be in for a treat! Haha!");
	elseif(e.message:findi("go away")) then
		e.self:Say("Oh, so you want me gone, eh? So be it.  Your wish is my command.  Wait?  I'm not listening to you!  Go away!");
		eq.attack(e.other:GetName());
	elseif(e.message:findi("do")) then
		e.self:Say("I can tell you how to get from island to island, so, nyah!  I can also tell you about the Veil. Hold on to everything you find up here.  It may come in handy.");
	elseif(e.message:findi("veil")) then
		e.self:Say("The veil is dissolving!  Centuries ago, when Veeshan brought me to this place, she sealed the plane with the Veil.  By you being here, it is evidence that the Veil is lifting.");
	end
end

function SirranThunderTrade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20920})) then 		--A Miniature Sword
		e.self:Say("These are the keys! Use them well! Hold them in your hand and touch them to the runed platforms! Guide you thy will! Hah! The last to go, must tell me so, or be in for a [hassle]! If there's a hassle, I will go!");
		e.other:QuestReward(e.self,{itemid = 20911}); -- Key of Swords
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20921})) then 	--Lost Rabbit's Foot
		e.self:Say("These are the keys! Use them well! Hold them in your hand and touch them to the runed platforms! Guide you thy will! Hah! The last to go, must tell me so, or be in for a [hassle]! If there's a hassle, I will go!");
		e.other:QuestReward(e.self,{itemid = 20912}); -- Key of the Misplaced
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function SirranProtectorsay(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah! Come far you have! You are all crazy! I like it! Swords spin no more! Spin, spin. Unlucky they were! I thought them [vain]!");		
	end
end

function SirranProtectorTrade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20922})) then 	--Broken Mirror
		e.self:Say("You move fast, you crazy kids! Keep going! Prod you I will! Stuck here I have been! Oh! Let me know when you are [done] or this will be no fun! Haha!");
		e.other:QuestReward(e.self,{itemid = 20913}); -- Key of Misfortune
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function SirranGorgalosksay(e)
	if(e.message:findi("hail")) then
		e.self:Say("What! Die already! Come so far. Can't you see I am cold! Give me a cloak or something! Bah! You don't look the type to give anything! Be off with you, then!");
	end
end

function SirranGorgaloskTrade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20923})) then 	--Animal Figurine
		e.self:Say("Always want something for nothing? Oh yes, you gave me something! Here you go! Take this! Used one you have. [Teleport] away you will! Let me know, or no kill! Haha!");
		e.other:QuestReward(e.self,{itemid = 20914}); --Key of Beasts
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function SirranKeeperSay(e)
	if(e.message:findi("hail")) then
		e.self:Say("What is this? Bah! Take that! And this! What was I thinking? I was thinking you had best let me know when you use those teleporters. Just say, [Icky Bicky Barket]. Aye, that is what I was thinking.");
	end
end

function SirranKeeperTrade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20924})) then 	--Bird Whistle
		e.self:Say("What is this? Bah! Take that! And this! What was I thinking? I was thinking you had best let me know when you use those teleporters. Just say, [Icky Bicky Barket]. Aye, that is what I was thinking.");
		e.other:QuestReward(e.self,{itemid = 20915}); --Avian Key
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function SirranSpirocSay(e)
	if(e.message:findi("hail")) then
		e.self:Say("Children, run to the wall and give the deputies some milk. Oh, I almost forgot. Give me your trinkets, or give me death!");
	end
end

function SirranSpirocTrade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20925})) then 	--Noise Maker
		e.self:Say("Phew! These are heavy. Well, not really. I'm sure I don't have to remind you to remind me when you are [leaving].");
		e.other:QuestReward(e.self,{itemid = 20916}); --Key of the Swarm
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function SirranBazztSay(e)
	if(e.message:findi("citanul eht narris, liah")) then 	--island6
		e.self:Say("Lortap llaw taerg eht fo lahsram, Narris lahsram ma I. Flesym ecudortni ot em wolla. Sgniteerg");
	elseif(e.message:findi("llaw eht htiw eno I ma")) then 		--island6
		e.self:Say("Kcul doog! Ouy rof ydaer si erips eht fo retsis eht won, sdik boj doog.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(71076) == false) then
			eq.unique_spawn(71076,0,0,-929,-1035,1093,64); 	--used Magelo to get the closest loc as possible.
		end
	end
end

function SirranBazztTrade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20926})) then 	--Dull Dragon Scale
		e.self:Say("Dnib a ni era uoy ro esarhp eht yas dna yrruh!! Sruoy era syek eht dna romra em evig. Erom on gnits seixib eht ahahahahah!");
		e.other:QuestReward(e.self,{itemid = 20917}); --Key of Scale
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function SirranSisterSay(e)
	if(e.message:findi("hail")) then
		e.self:Say("Nyah! The tears are welling up in my eyes! I am so proud. I think of you as if I were your father! Sniff. Sniff. Give me Veeshan, and I give you death.");
	end
end

function SirranSisterTrade(e)
	local item_lib = require("items")
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20927})) then 	--Replica of the Wyrm Queen
		e.self:Say("Not too much farther. I spit on thee knave! Ehem. Take these. Go on! Make your fortunes. No one cares about Narris. I mean Sirran. Hah! See if I care what you think! Oh, when did you say you were [leaving]?");
		e.other:QuestReward(e.self,{itemid = 20918}); --Veeshan's Key (not the one purchased on island --1 which is 20919)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_encounter_load(e)
	
	eq.register_npc_event("Sirran", Event.death_complete, 71032, ThunderSpiritDeath);
	eq.register_npc_event("Sirran", Event.death_complete, 71059, ProtectorSkyDeath);
	eq.register_npc_event("Sirran", Event.death_complete, 71021, GorgaloskDeath);
	eq.register_npc_event("Sirran", Event.death_complete, 71075, KeeperSoulDeath);
	eq.register_npc_event("Sirran", Event.death_complete, 71012, SpirocLordDeath);
	eq.register_npc_event("Sirran", Event.death_complete, 71072, BazztZzztDeath);
	eq.register_npc_event("Sirran", Event.death_complete, 71076, SisterSpireDeath);
	eq.register_npc_event("Sirran", Event.say, 71058, SirranThundersay);
	eq.register_npc_event("Sirran", Event.trade, 71058, SirranThunderTrade);
	eq.register_npc_event("Sirran", Event.say, 71023, SirranProtectorsay);
	eq.register_npc_event("Sirran", Event.trade, 71023, SirranProtectorTrade);
	eq.register_npc_event("Sirran", Event.say, 71025, SirranGorgalosksay);
	eq.register_npc_event("Sirran", Event.trade, 71025, SirranGorgaloskTrade);
	eq.register_npc_event("Sirran", Event.say, 71026, SirranKeeperSay);
	eq.register_npc_event("Sirran", Event.trade, 71026, SirranKeeperTrade);
	eq.register_npc_event("Sirran", Event.say, 71029, SirranSpirocSay);
	eq.register_npc_event("Sirran", Event.trade, 71029, SirranSpirocTrade);
	eq.register_npc_event("Sirran", Event.say, 71036, SirranBazztSay);
	eq.register_npc_event("Sirran", Event.trade, 71036, SirranBazztTrade);
	eq.register_npc_event("Sirran", Event.say, 71078, SirranSisterSay);
	eq.register_npc_event("Sirran", Event.trade, 71078, SirranSisterTrade);
	for _, Sirran in ipairs(SIRRANS) do
		eq.register_npc_event("Sirran", Event.spawn, Sirran, SirranSpawn);
	end
	for _, Sirran in ipairs(SIRRANS) do
		eq.register_npc_event("Sirran", Event.timer, Sirran, SirranTimer);
	end
	for _, Sirran in ipairs(SIRRANS) do
		eq.register_npc_event("Sirran", Event.combat, Sirran, SirranCombat);
	end
end
