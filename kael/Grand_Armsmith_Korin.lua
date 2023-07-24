function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 500) then
			e.self:Say("What do you want from me " .. e.other:Race() .. "? I can only imagine that you are here to ask me to use my obviously superior smithing talents to create some [special helmets] to help protect your obviously frail body.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You are still young to the true armies of Rallos, " .. e.other:GetCleanName() .. ", come back after you have served us more.");		
		else
			e.self:Say("Go back to the dog pit where you belong, " .. e.other:Race() .. ", you are not welcome here.");
		end
	elseif(e.message:findi("special helmet")) then
		if(e.other:GetFactionValue(e.self) >= 500) then
			e.self:Say("Just as I suspected " .. e.other:Race() .. ". Using my superior skills I can customize a plate helmet to help better protect you. Give me your Malevolent Crown, Warlord's Crown, Shining Helm, Templar's Crown, Troubadour's Helm, Frostreaver's Velium Crown, Crown of the Kromzek Kings or a Cowl of Mortality and I shall make you a new helm that will better protect you.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You are still young to the true armies of Rallos, " .. e.other:GetCleanName() .. ", come back after you have served us more.");		
		else
			e.self:Say("Go back to the dog pit where you belong, " .. e.other:Race() .. ", you are not welcome here.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) < 4) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 25349}, 0)) then -- Malevolant Crown - Shadowknight
			e.self:Say("Ah, here is your helm, " .. e.other:GetCleanName() .. ", may it serve you as well as you have served us.");
			e.other:QuestReward(e.self,0,0,0,0,31520); -- Custom Malevolent Crown
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25433}, 0)) then -- Warlord's Crown - Warrior
			e.self:Say("Ah, here is your helm, " .. e.other:GetCleanName() .. ", may it serve you as well as you have served us.");
			e.other:QuestReward(e.self,0,0,0,0,31524); -- Custom Warlord's Crown
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25370}, 0)) then -- Shining Helm - Paladin
			e.self:Say("Ah, here is your helm, " .. e.other:GetCleanName() .. ", may it serve you as well as you have served us.");
			e.other:QuestReward(e.self,0,0,0,0,31521); -- Custom Shining Helm
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25391}, 0)) then -- Templar's Crown - Cleric
			e.self:Say("Ah, here is your helm, " .. e.other:GetCleanName() .. ", may it serve you as well as you have served us.");
			e.other:QuestReward(e.self,0,0,0,0,31523); -- Custom Templar's Crown
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25384}, 0)) then -- Troubadour's Helm - Bard
			e.self:Say("Ah, here is your helm, " .. e.other:GetCleanName() .. ", may it serve you as well as you have served us.");
			e.other:QuestReward(e.self,0,0,0,0,31522); -- Custom Troubadour's Helm
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30507}, 0)) then -- Frostreaver's Velium Crown
			e.self:Say("Ah, here is your helm, " .. e.other:GetCleanName() .. ", may it serve you as well as you have served us.");
			e.other:QuestReward(e.self,0,0,0,0,2610); -- Custom Frostreaver's Velium Crown
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25194}, 0)) then -- Crown of the Kromzek Kings
			e.self:Say("Ah, here is your helm, " .. e.other:GetCleanName() .. ", may it serve you as well as you have served us.");
			e.other:QuestReward(e.self,0,0,0,0,2611); -- Custom Crown of the Kromzek Kings
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 26025}, 0)) then -- Cowl of Mortality
			e.self:Say("Ah, here is your helm, " .. e.other:GetCleanName() .. ", may it serve you as well as you have served us.");
			e.other:QuestReward(e.self,0,0,0,0,2612); -- Custom Cowl of Mortality
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
 