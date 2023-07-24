function event_spawn(e)
	eq.set_timer("bye",1200000);
end

function event_say(e)
	local qglobals = eq.get_qglobals();

	if(e.message:findi("hail")) then
		if(qglobals["sirran"] == "1") then 		--island1
			e.self:Say("Ehem! What? Oh, hello there! Sirran be my name. Yes? So, come to the Plane of Sky, have you? Killed all my fairies! Hah! So! Do you wish to know how to traverse this plane? Or should I just go away? I know much about this plane. You would do well to listen!");
		elseif(qglobals["sirran"] == "2") then 	--island2
			e.self:Say("Ah! Come far you have! You are all crazy! I like it! Swords spin no more! Spin, spin. Unlucky they were! I thought them [vain]!");
		elseif(qglobals["sirran"] == "3") then 	--island3
			e.self:Say("What! Die already! Come so far. Can't you see I am cold! Give me a cloak or something! Bah! You don't look the type to give anything! Be off with you, then!");
			e.self:Say("Always want something for nothing? Oh yes, you gave me something! Here you go! Take this! Used one you have. [Teleport] away you will! Let me know, or no kill! Haha!");
		elseif(qglobals["sirran"] == "4") then 	--island4
			e.self:Say("What is this? Bah! Take that! And this! What was I thinking? I was thinking you had best let me know when you use those teleporters. Just say, [Icky Bicky Barket]. Aye, that is what I was thinking.");
		elseif(qglobals["sirran"] == "5") then 	--island5
			e.self:Say("Children, run to the wall and give the deputies some milk. Oh, I almost forgot. Give me your trinkets, or give me death!");
		elseif(qglobals["sirran"] == "7") then 	--island7
			e.self:Say("Nyah! The tears are welling up in my eyes! I am so proud. I think of you as if I were your father! Sniff. Sniff. Give me Veeshan, and I give you death");
		end
	elseif(e.message:findi("citanul eht narris, liah") and qglobals["sirran"] == "6") then 	--island6
		e.self:Say("Lortap llaw taerg eht fo lahsram, Narris lahsram ma I. Flesym ecudortni ot em wolla. Sgniteerg");
	elseif(e.message:findi("llaw eht htiw eno I ma") and qglobals["sirran"] == "6") then 		--island6
		e.self:Say("Kcul doog! Ouy rof ydaer si erips eht fo retsis eht won, sdik boj doog.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(71076) == false) then
			eq.spawn2(71076,0,0,-929,-1035,1093,64); 							--used Magelo to get the closest loc as possible.
		end
	elseif(e.message:findi("traverse this plane") and qglobals["sirran"] == "1") then
		e.self:Say("Ahah! Wise you are and tell you I will. Hrm? Don't have wings, do you? Fairies have swords! Fairies stole my lucky feet! Hand me them, one by one, and be in for a treat! Haha!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20920})) then 		--A Miniature Sword
		if(eq.get_qglobals()["sirran"] == "1") then
			e.self:Say("These are the keys! Use them well! Hold them in your hand and touch them to the runed platforms! Guide you thy will! Hah! The last to go, must tell me so, or be in for a [hassle]! If there's a hassle, I will go!");
			e.other:QuestReward(e.self,{itemid = 20911}); -- Key of Swords
		else
			e.self:Say("I have no need for this item " .. e.other:GetCleanName() .. ", you can have it back.")
			e.other:QuestReward(e.self,{itemid = 20920}); -- Item: Miniature Sword
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20921})) then 	--Lost Rabbit's Foot
		if(eq.get_qglobals()["sirran"] == "1") then
			e.self:Say("These are the keys! Use them well! Hold them in your hand and touch them to the runed platforms! Guide you thy will! Hah! The last to go, must tell me so, or be in for a [hassle]! If there's a hassle, I will go!");
			e.other:QuestReward(e.self,{itemid = 20912}); -- Key of the Misplaced
		else
			e.self:Say("I have no need for this item " .. e.other:GetCleanName() .. ", you can have it back.")
			e.other:QuestReward(e.self,{itemid = 20921}); -- Item: Lost rabbits foot
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20922})) then 	--Broken Mirror
		if(eq.get_qglobals()["sirran"] == "2") then
			e.self:Say("You move fast, you crazy kids! Keep going! Prod you I will! Stuck here I have been! Oh! Let me know when you are [done] or this will be no fun! Haha");
			e.other:QuestReward(e.self,{itemid = 20913}); -- Key of Misfortune
		else
			e.self:Say("I have no need for this item " .. e.other:GetCleanName() .. ", you can have it back.")
			e.other:QuestReward(e.self,{itemid = 20922}); -- Item: Broken Mirror
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20923})) then 	--Animal Figurine
		if(eq.get_qglobals()["sirran"] == "3") then
			e.self:Say("Always want something for nothing? Oh yes, you gave me something! Here you go! Take this! Used one you have. [Teleport] away you will! Let me know, or no kill! Haha!");
			e.other:QuestReward(e.self,{itemid = 20914}); --Key of Beasts
		else
			e.self:Say("I have no need for this item " .. e.other:GetCleanName() .. ", you can have it back.")
			e.other:QuestReward(e.self,{itemid = 20923}); -- Item: Animal Figurine
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20924})) then 	--Bird Whistle
		if(eq.get_qglobals()["sirran"] == "4") then
			e.self:Say("What is this? Bah! Take that! And this! What was I thinking? I was thinking you had best let me know when you use those teleporters. Just say, [Icky Bicky Barket]. Aye, that is what I was thinking.");
			e.other:QuestReward(e.self,{itemid = 20915}); --Avian Key
		else
			e.self:Say("I have no need for this item " .. e.other:GetCleanName() .. ", you can have it back.")
			e.other:QuestReward(e.self,{itemid = 20924}); -- Item: Bird Whistle
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20925})) then 	--Noise Maker
		if(eq.get_qglobals()["sirran"] == "5") then
			e.self:Say("Phew! These are heavy. Well, not really. I'm sure I don't have to remind you to remind me when you are [leaving].");
			e.other:QuestReward(e.self,{itemid = 20916}); --Key of the Swarm
		else
			e.self:Say("I have no need for this item " .. e.other:GetCleanName() .. ", you can have it back.")
			e.other:QuestReward(e.self,{itemid = 20925}); -- Item: Noise Maker
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20926})) then 	--Dull Dragon Scale
		if(eq.get_qglobals()["sirran"] == "6") then
			e.self:Say("Dnib a ni era uoy ro esarhp eht yas dna yrruh!! Sruoy era syek eht dna romra em evig. Erom on gnits seixib eht ahahahahah!");
			e.other:QuestReward(e.self,{itemid = 20917}); --Key of Scale
		else
			e.self:Say("I have no need for this item " .. e.other:GetCleanName() .. ", you can have it back.")
			e.other:QuestReward(e.self,{itemid = 20926}); -- Item: Dull Dragon Scale
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20927})) then 	--Replica of the Wyrm Queen
		if(eq.get_qglobals()["sirran"] == "7") then
			e.self:Say("Not too much farther. I spit on thee knave! Ehem. Take these. Go on! Make your fortunes. No one cares about Narris. I mean Sirran. Hah! See if I care what you think! Oh, when did you say you were [leaving]?");
			e.other:QuestReward(e.self,{itemid = 20918}); --Veeshan's Key (not the one purchased on island --1 which is 20919)
		else
			e.self:Say("I have no need for this item " .. e.other:GetCleanName() .. ", you can have it back.")
			e.other:QuestReward(e.self,{itemid = 20927}); -- Item: Replica of the Wyrm Queen
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
	if(e.joined == true) then
		e.self:Shout("What?! Now you've done it! The bunnies are angry! ANGRY I TELL YOU!");
	end
end

function event_timer(e)
	if(e.timer == "bye") then
		eq.stop_timer("bye");
		eq.depop();
	end
end

function event_death_complete(e)
	eq.delete_global("sirran");
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
