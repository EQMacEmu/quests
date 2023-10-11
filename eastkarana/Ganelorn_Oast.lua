function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please be very quiet. I am tracking a notorious poacher.");
	elseif(e.message:findi("call of flame")) then
		e.self:Say("I suppose you would like to call the flame? I must know you are a dedicated forester before I would even consider teaching such a thing.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20876})) then
		e.self:Say("Ah, what do we have here? A letter? Hmm? Scented with a familiar fragrance too. You must have gotten this from Lily. I do wish I had more time to spend with her, for she is a very sweet girl. If she trusts you to deliver such a letter, I must ask you to do me a favor for me. Please take these eggs. They are a very rare species of albino rattlesnakes which were thought to have been extinct due to poachers who eat them as a delicacy and griffins which prey on them. If these eggs hatch there is hope for the species. I need you to deliver them to my master, Kithicor.");
		e.other:Faction(e.self,246,5,0); -- faydarks champion
		e.other:Faction(e.self,279,1,0); -- king tearis thex
		e.other:Faction(e.self,226,1,0); -- cleric of tunare
		e.other:Faction(e.self,310,1,0); -- soldier of tunare
		e.other:Faction(e.self,234,-1,0); -- crushbone orcs
		e.other:QuestReward(e.self,0,0,0,0,20877,1000); -- Item: Albino Rattlesnake Eggs
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20878})) then
		e.self:Say("This does speak highly of you, my friend, an award from Kithicor does not come easy. But I must see more of your skills before I can consider teaching you. Lily's brother Devin is my current pupil - I need you to gather some equipment for me so I can properly train him. I require the following items of you - a smoldering sash, an adamantine ring and a blade forged of electrum. I also need a favor. Take this credit slip to Aanina Rockfinder. She is a merchant from whom I purchased a gift for Lily; it should be ready by now.");
		e.other:QuestReward(e.self,0,0,0,0,20879,1000); -- Item: A note of credit
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20881,item2 = 20880,item3 = 10151,item4 = 5408})) then
		e.self:Say("You have done well. I sense the one I have been hunting in the distance. As your final test, you must track him down and destroy him.");
		eq.unique_spawn(15183,0,0,-800,-2712,15.6,138); -- NPC: Vance_Bearstalker
		e.other:Faction(e.self,246,100,0); -- faydarks champion
		e.other:Faction(e.self,279,25,0); -- king tearis thex
		e.other:Faction(e.self,226,25,0); -- cleric of tunare
		e.other:Faction(e.self,310,25,0); -- soldier of tunare
		e.other:Faction(e.self,234,-25,0); -- crushbone orcs
		e.other:QuestReward(e.self,0,0,0,0,0,10000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20882})) then
		e.self:Say("You, " .. e.other:GetCleanName() .. ", are a worthy forester. It brings me great pride to present you this scroll that I have only passed to the finest in all of Norrath. Now you, too, may call the flames.");
		e.other:Faction(e.self,246,100,0); -- faydarks champion
		e.other:Faction(e.self,279,25,0); -- king tearis thex
		e.other:Faction(e.self,226,25,0); -- cleric of tunare
		e.other:Faction(e.self,310,25,0); -- soldier of tunare
		e.other:Faction(e.self,234,-25,0); -- crushbone orcs
		e.other:QuestReward(e.self,0,0,0,0,15691,10000); -- Item: Spell: Call of Flame
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
