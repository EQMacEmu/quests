local continue;

function event_spawn(e)
	continue = 0;
end

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("turns a condescending eye toward you. 'I am quite busy here. and I do not appreciate interruptions.  My [research] is important. and I do not have time to explain everything to you.'");
	elseif(e.message:findi("research")) then
		e.self:Say("Well it seems that I am not going to rid myself of you so easily so I will explain what I can. I will be sure to use small words and simple concepts so you will be sure to understand. Every spell is much like an orchestra; there are different instruments and octaves, and every instrument has a range of notes. These notes are the important component. [continue]");
	elseif(e.message:findi("continue") and continue == 0) then
		continue = 1;
		eq.set_timer("cont",60000);
		e.self:Say("It is my theory that all of the notes have been discovered, and creating new spells will just be a matter of combining notes in new and different fashions. Since you seem so interested in my research, I can use assistance in gathering notes. I have separated all teh spells that are readily accessible to me, but I do not have time to gather components from the more difficult to obtain spells. [Continue]");
	elseif(e.message:findi("continue") and continue == 1) then
		continue = 0;
		e.self:Say("I have constructed this extractor to break spells apart into their notes. It will not work on all spells, and I do not have time to compile a list of spells that it will and will not work on. As my apprentice, as that seems to be what you are intent on becoming, you will separate any spells you come across and return the notes to me where, you will need to insert four spell scrolls of the same power belonging to different arcane circles. For some reason the extractor only works for spells between the 10th and 14th circles, I hope to have that problem resolved soon. This extractor is not simple to use, and you will find you will have more success with the more powerful spells if you have a greater understanding on how spells are constructed. There is one more [task] that I require of my understudy.'");
		e.other:SummonCursorItem(17176); -- Item: Sage's Box of Research
	elseif(e.message:findi("task")) then
		e.self:Say("There are two other sages who like to call themselves my equals. They are taking different paths in their studies, and it would be to our benefit to have access to their work, I created that extractor with their aid so I know their methods cannot be far from my own. You must also gather what information you can from their research and return Balic's research to Onirelin Gali my assistant, and Xelrin's research to Xasri Virek his associate. I have nothing more for you, and I have been distracted long enough, be off!");
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
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 15956}, 0)) then -- Aqi Note
		e.other:QuestReward(e.self,{itemid = 32014,exp = 100000}) -- Talisman of Research
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15942}, 0)) then -- Bep Note
		e.other:QuestReward(e.self,{itemid = 32015,exp = 100000}) -- Amulet of Knowledge
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15943}, 0)) then -- Cjo Note
		e.other:QuestReward(e.self,{itemid = 32016,exp = 100000}) -- Book of Forgotten Magic
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15944}, 0)) then -- Da Note
		e.other:QuestReward(e.self,{itemid = 32017,exp = 100000}) -- Arcane Quill
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 15945}, 0)) then -- Eio Note
		e.other:QuestReward(e.self,{itemid = 32018,exp = 100000}) -- Gem of Flowing Breath
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
	end
	item_lib.return_items(e.self, e.other, e.trade)
end