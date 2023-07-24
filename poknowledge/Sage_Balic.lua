--------------------------
--Quest Name: Crown of Deceit
--Author: Shadestrike
--NPCs Involved: Sage Balic, an_old_froglok
--Zone: Plane of Knowledge
----------------------------
local continue;

function event_spawn(e)
	continue = 0;
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings friend. Welcome to my place of private contemplation. I relax here and leaf through my old studies, admiring at creations from the past made by races we thought would never amount to anything. My favorite tomes to look at are those that deal with Frogloks.");
	elseif(e.message:findi("your research")) then
		e.self:Say("My research? Oh, I imagine Tenada sent you to me. I'd love to tell you about my studies, if you have time to listen. [Continue]");
	elseif(e.message:findi("continue") and continue == 0) then
		continue = 1;
		eq.set_timer("cont",60000);
		e.self:Say("I have come to Knowledge to fine-tune my abilities in spell craft. To date I've been able to create some minor incantations, but have had little success in creating any magic that was truly revolutionary. I am actually in a bit of a race with the other Sages who are my contemporaries. They too are looking to make a major breakthrough . . . Come to think of it, I could probably find quite a few [uses for their research], should you manage to come by any of it. [Continue]");
	elseif(e.message:findi("continue") and continue == 1) then
		continue = 0;
		e.self:Say("Sorry, I digress. Where was I? Oh yes! In the past I, as well as the other Sages, have had little success; however from the volumes of information found here, each of us found a new outlook on the creation of magic. I found that most of the magical discoveries came from existing magical components, mostly runes and words of power. Should you come by any of these components please use this box to check to see if they have the proper magical configuration. The extractor will be able to remove what it needs if you find a valid combination. Right now I believe the box will only function with a single word and rune of approximately the same power.");
		e.other:SummonCursorItem(17176); -- Item: Sage's Box of Research
	elseif(e.message:findi("their research")) then
		e.self:Say("Well it couldn't hurt, now could it? If you manage to 'acquire' any of their research feel free to show it to my assistants; Xelrin's research to Tenada and Gunyth's research to Winon downstairs.");
	elseif(e.message:findi("froglok")) then
		e.self:Say("A surprising race to study is the Frogloks of Antonica. While we may think their magic was weak, it was at one time so powerful the Gods reached down and smote them for their creations. Balls of energy that made life into magic! Their High Enchanter even made a mask that transformed the wearer into a Teir`Dal! Quite an interesting race worthy of some study if you ask me, someday I shall like to go and see these frogloks, especially to learn more knowledge of the magical mask.");
	elseif(e.message:findi("magical mask")) then
		e.self:Emote("blinks and looks at you. 'I have told you all that I know, for more knowledge you will need to seek its creator.  The enchanter is more than likely very old, the mask having been made at the height of the power of the Froglok race.  Here take this picture book to aid you in your quest.'  Sage Balic hands you a book.");
		e.other:SummonCursorItem(11275); -- Item: Picturebook
	end
end

function event_timer(e)
	if(e.timer == "cont") then
		eq.stop_timer("cont");
		continue = 0;
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 15946}, 0)) then -- Word of Combine
		e.other:QuestReward(e.self,{itemid = 32019,exp = 100000}) -- Sage's Apprentice Cap
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15947}, 0)) then -- Word of Sorcery
		e.other:QuestReward(e.self,{itemid = 32020,exp = 100000}) -- Twisted Talisman
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15948}, 0)) then -- Word of Helix
		e.other:QuestReward(e.self,{itemid = 32021,exp = 100000}) -- Three Ringed Hoop
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15949}, 0)) then -- Word of Inverse
		e.other:QuestReward(e.self,{itemid = 32022,exp = 100000}) -- Joined Signet
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15950}, 0)) then -- Word of Impetus
		e.other:QuestReward(e.self,{itemid = 32023,exp = 100000}) -- Apprentice's Notebook
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15952}, 0)) then -- Evocation Binding
		e.other:QuestReward(e.self,{exp = 100000})
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15954}, 0)) then -- Abjuration Binding
		e.other:QuestReward(e.self,{exp = 100000})
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15955}, 0)) then -- Spell: Strong Poison
		e.other:QuestReward(e.self,{exp = 100000})
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15951}, 0)) then -- Spell: Ykesha
		e.other:QuestReward(e.self,{exp = 100000})
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15953}, 0)) then -- Spell: Screaming Mace
		e.other:QuestReward(e.self,{exp = 100000}) 
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15956}, 0)) then -- Aqi Note
		e.other:QuestReward(e.self,{exp = 100000}) 
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15942}, 0)) then -- Bep Note
		e.other:QuestReward(e.self,{exp = 100000}) 
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15943}, 0)) then -- Cjo Note
		e.other:QuestReward(e.self,{exp = 100000}) 
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15944}, 0)) then -- Da Note
		e.other:QuestReward(e.self,{exp = 100000}) 
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15945}, 0)) then -- Eio Note
		e.other:QuestReward(e.self,{exp = 100000}) 
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
