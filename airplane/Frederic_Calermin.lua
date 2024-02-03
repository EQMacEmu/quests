function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Great, let us waste no more time! I offer to you three challenges. Clarification, Empowerment, and Shielding. Please choose one of these.");
	elseif(e.message:findi("clarification")) then 	--magician test of clarification
		e.self:Say("Clarification it is. Proceed upward through the sky and return to me a Crimson Tessera, an Ethereal Sapphire, and Feathered Cape.  This will prove your abilities to me and I will reward you with the Bracelet of Clarification.");
	elseif(e.message:findi("empowerment")) then 	--magician test of empowerment
		e.self:Say("Empowerment it is. Proceed upward through the sky and return to me an Iron Disc, a Gem of Empowerment, and a Ceramic Mask. This will prove your abilities to me and I will reward you with the Mask of Empowerment.");
	elseif(e.message:findi("shielding")) then 		--magician test of shielding
		e.self:Say("Shielding it is. Proceed upward through the sky and return to me a Hyaline Globe, an Ivory Pendant, and a Golden Coffer. This will prove your abilities to me and I will reward you with an Gold White Pendant.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20931, item2 = 20754, item3 = 20755})) then --magician test of clarification using crimson tessera, ethereal sapphire, feathered cape -- dialogue is correct, says cape for some reason
		e.self:Say("Take this cape, mage, you have earned it.");
		e.other:QuestReward(e.self,0,0,0,0,1274,100000); --bracelet of clarification
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20937, item2 = 20756, item3 = 20757})) then --magician test of empowerment using iron disc, gem of empowerment, ceramic mask
		e.self:Say("This mask will suit you well, mage. Use it sparingly.");
		e.other:QuestReward(e.self,0,0,0,0,2707,100000); --mask of empowerment
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20944, item2 = 20758, item3 = 20759})) then	--magician test of shielding using hyaline globe, ivory pendant, golden coffer
		e.self:Say("A pendant of gold and white, " .. e.other:GetCleanName() .. ", wear it and beat back the night.");
		e.other:QuestReward(e.self,0,0,0,0,14557,100000); --gold white pendant
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
