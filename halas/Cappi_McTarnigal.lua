function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail there, " .. e.other:GetCleanName() .. "! If you are not a [member of the White Rose], then it be best that you stay on the lower level. This here floor is for honest ...ermm respectable rogues only.");
	elseif(e.message:findi("member of the white rose")) then
		if(e.other:GetFactionValue(e.self) >= 0) then -- needs indifferent.
			e.self:Say("I hope that you are indeed respectable and loyal to Halas and the Rogues of the White Rose. To do otherwise would bring the wrath of the Six Hammers down on you. But enough with talk! Our caravan to the frigid north leaves in less than two days. and we are short on mammoth calf hides. Return four of them and you will be given items that show your loyalty to our Clan.");
			eq.signal(29070,1); -- NPC: Ysanna_MacGibbon
		else
			e.self:Say("I will take these as a donation for I can only reward those who are 'respectable.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 5243, item2 = 5243, item3 = 5243, item4 = 5243})) then	-- requires indifferent, Mammoth Calf Hide X 4
		e.self:Say("You returned? We believed the gnoll pups got you. The caravan has already left, and these do me little good now. But, as I said before, one must remain respectable. Here is what I promised.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,305,5,0);	-- Faction Rogue's of the White Rose
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(5238,5239,5242,5236,5233,5231,5240,5241,5234,5232,5235,5237),2500); -- Item(s): Black Wolf Armplates (5238), Black Wolf Bracers (5239), Black Wolf Boots (5242), Black Wolf Cape (5236), Black Wolf Collar (5233), Black Wolf Crown (5231), Black Wolf Gloves (5240), Black Wolf Legplates (5241), Black Wolf Mail (5234), Black Wolf Mask (5232), Black Wolf Pauldrons (5235), Black Wolf Waistband (5237)
		
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
