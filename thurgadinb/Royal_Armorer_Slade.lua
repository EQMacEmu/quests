-- Quest for Royal Armorer Slade in Icewell Keep - Custom Crown Quest

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 750) then
			e.self:Say("Welcome, " .. e.other:GetCleanName() .. ". I'm Slade, Royal Armorer to the Dain and his personal guardsmen. I've heard yer name once or twice in these halls and apparently ye've earned the respect of my people. In light of that I'm willin ta offer my [services] to you if'n ye need them.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I'm sorry, " .. e.other:GetCleanName() .. ", while I've heard good things about ye you've yet to prove yerself enough to my people to earn my services.");
		else
			e.self:Say("Leave me be, " .. e.other:Race() .. ". I have no reason to trust you yet.");
		end
	elseif(e.message:findi("service")) then
		if(e.other:GetFactionValue(e.self) >= 750) then
			e.self:Say("If'n ye've had the fortune to earn any of the plate helms that are made by my people in the city then I can use my skills to custom fit and detail it for a " .. e.other:Race() .. " of yer like. I can do this fer the Dark Runed Crown, the Runed Protector's Helm, the Resonant Helm, the Crown of Forbidden Rites, Crown of the Kromzek Kings, Frostreaver's Velium Crown, Cowl of Mortality, and the Champions Crown. Simply hand me one of these and I'll do the work for you.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I'm sorry, " .. e.other:GetCleanName() .. ", while I've heard good things about ye you've yet to prove yerself enough to my people to earn my services.");
		else
			e.self:Say("Leave me be, " .. e.other:Race() .. ". I have no reason to trust you yet.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) <= 3) then -- Require warmly and greater faction
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31084}, 0)) then
			e.self:Say("Here you are " .. e.other:GetCleanName() .. ". Ah, a perfect fit! May it serve you well.");
			e.other:QuestReward(e.self,0,0,0,0,31519); -- Custom Champions Crown
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 26025}, 0)) then
			e.self:Say("Here you are " .. e.other:GetCleanName() .. ". Ah, a perfect fit! May it serve you well.");
			e.other:QuestReward(e.self,0,0,0,0,2612); -- Custom Cowl of Mortality
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31042}, 0)) then
			e.self:Say("Here you are " .. e.other:GetCleanName() .. ". Ah, a perfect fit! May it serve you well.");
			e.other:QuestReward(e.self,0,0,0,0,31518); -- Custom Crown of Forbidden Rites
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25194}, 0)) then
			e.self:Say("Here you are " .. e.other:GetCleanName() .. ". Ah, a perfect fit! May it serve you well.");
			e.other:QuestReward(e.self,0,0,0,0,2611); -- Custom Crown of the Kromzek Kings
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31000}, 0)) then
			e.self:Say("Here you are " .. e.other:GetCleanName() .. ". Ah, a perfect fit! May it serve you well.");
			e.other:QuestReward(e.self,0,0,0,0,31515); -- Custom Dark Runed Crown
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30507}, 0)) then
			e.self:Say("Here you are " .. e.other:GetCleanName() .. ". Ah, a perfect fit! May it serve you well.");
			e.other:QuestReward(e.self,0,0,0,0,2610); -- Custom Frostreavers Velium Crown
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31035}, 0)) then
			e.self:Say("Here you are " .. e.other:GetCleanName() .. ". Ah, a perfect fit! May it serve you well.");
			e.other:QuestReward(e.self,0,0,0,0,31517); -- Custom Resonant Helm
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31021}, 0)) then
			e.self:Say("Here you are " .. e.other:GetCleanName() .. ". Ah, a perfect fit! May it serve you well.");
			e.other:QuestReward(e.self,0,0,0,0,31516); -- Custom Runed Protectors Helm
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

