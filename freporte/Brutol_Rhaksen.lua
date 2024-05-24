function event_say(e)
	if(eq.is_the_shadows_of_luclin_enabled()) then
		if(e.message:findi("hail")) then
			e.self:Say("Oh, hello down there, puny one. I'm Brutol Rhaksen. Commmander of warriors who [serve] the Dismal Rage, and that's really all you need to know..for now.");
		elseif(e.message:findi("serve")) then
			e.self:Say("You must become strong to survive amongst the ranks of the Dismal Rage. Take this note to Rolfic Gohar and he will help you get a suit of armor to protect your scrawny hide from the weapons of our enemies. Once you have been properly outfitted return to me and will give you your [next orders].");
			e.other:SummonCursorItem(19843); -- Note to Rolfic Gohar
		elseif(e.message:findi("next orders")) then
			e.self:Say("Ready to make yourself useful " .. e.other:GetCleanName() .. " ? Beneath West Freeport are sewer tunnels leading to North Freeport being used by the Knights of Truth and the Sentries and Passion that have gained too much notoriety with the Freeport Militia and the Dismal Rage to pass safely through the eastern and western quarters of Freeport. We believe a sympathizer of the Sentries of Passion, Tarsa Yovar, is hiding somewhere in the western tunnel system. The sympathizer is a Steel Warrior faithful to Erollisi and although she is only a minor nuisance must be dealt with. Find her and bring me her head.");
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("Oh, hello down there, puny one. I'm Brutol Rhaksen. Commmander of warriors who serve the Dismal Rage, and that's really all you need to know..for now.");	--text made up	
		end
	end
end


function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18857})) then -- A tattered note
		e.self:Say("Hahaha.. I sure hope you prove more valuable than you look, little one.");
		e.other:Faction(e.self,271,100,0); -- Dismal Rage
		e.other:Faction(e.self,281,-15,0); -- Knights of Truth
		e.other:Faction(e.self,296,20,0); -- Opal Dark Briar
		e.other:QuestReward(e.self,0,0,0,0,13561,20); -- Faded Crimson Tunic
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 19932})) then -- Tarsa Yovar's Head
		e.self:Say("Take this and get it sharpened. Bring it back to me with a Giant Rattlesnake Skin and you will have proven yourself able to wield a Dismal Rage Battle Axe, to help teach the way of Innoruuk!");
		e.other:QuestReward(e.self,0,0,0,0,19921,100); -- Dull Dismal Battleaxe
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 19926,item2 = 19852})) then -- Sharpened Dismal Battleaxe - Giant Rattlesnake Skin
		e.self:Say("You have proven your faith " .. e.other:GetCleanName() .. ". Take this to vanquish any and all whom question the absolute power of Innoruuk!");
		e.other:QuestReward(e.self,0,0,0,0,19938,100); -- Dismal Rage BattleAxe
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freporte -- Brutol_Rhaksen
