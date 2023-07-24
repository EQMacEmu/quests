local continue;

function event_spawn(e)
	continue = 0;
end

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings " .. e.other:GetCleanName() .. ".  I assume you are here to ask about my research?  I imagine that word has spread of my groundbreaking approach to spell creation.  Well I am always willing to enlighten those that choose to learn.  As not to bog you down with too many details. my theory is simple. [Continue]");
	elseif(e.message:findi("continue") and continue == 0) then
		continue = 1;
		eq.set_timer("cont",60000);
		e.self:Say("Well the idea is rather basic.  As I am sure you know. there are many magical artifacts in the world with effects that we have not mastered.  It is my conjecture that some of the magic may be extracted from these items in order to further our magical repertoire.  Even in the case where an object has a spell that we already have access to. I believe the binding used to tie the magic to the object could be useful as well. [Continue]");
	elseif(e.message:findi("continue") and continue == 1) then
		continue = 0;
		e.self:Say("By using this box created in cooperation with the [other sages] in Knowledge. you will be able to either extract a magical scroll or the binding used to hold the magic to the object.  Those elements will be the basis for my research.  Just bring anything you manage to extract for me.");
		e.other:SummonCursorItem(17176); -- Item: Sage's Box of Research
	elseif(e.message:findi("other sages")) then
		e.self:Say("chuckles. 'Well my associates are working on their own theories for the creation of new magic.  I am sure that their projects are no where near advanced as mine. but even their primitive research could prove a boon in my own work.  If you happen to come across any of their research feel free to show it to my assistants. they will know the best manner in which to process it.  Bring reseach from Balic to Bolcen. and Gunyth's research to Acomar.  Thank you for your assistance.'");
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
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 15952}, 0)) then -- Evocation Binding
		e.other:QuestReward(e.self,{itemid = 32025,exp = 100000}) -- Orb of Arcane Visions
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15954}, 0)) then -- Abjuration Binding
		e.other:QuestReward(e.self,{itemid = 32027,exp = 100000}) -- Flawed Spell Creation
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15955}, 0)) then -- Spell: Strong Poison
		e.other:QuestReward(e.self,{itemid = 32028,exp = 100000}) -- Visionary's Lens
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15951}, 0)) then -- Spell: Ykesha
		e.other:QuestReward(e.self,{itemid = 32024,exp = 100000}) -- Gleaming Bauble
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15953}, 0)) then -- Spell: Screaming Mace
		e.other:QuestReward(e.self,{itemid = 32026,exp = 100000}) -- Sentient Medallion
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15946}, 0)) then -- Word of Combine
		e.other:QuestReward(e.self,{exp = 100000}) 
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15947}, 0)) then -- Word of Sorcery
		e.other:QuestReward(e.self,{exp = 100000}) 
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15948}, 0)) then -- Word of Helix
		e.other:QuestReward(e.self,{exp = 100000}) 
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15949}, 0)) then -- Word of Inverse
		e.other:QuestReward(e.self,{exp = 100000}) 
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15950}, 0)) then -- Word of Impetus
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
