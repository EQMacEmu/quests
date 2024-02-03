function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail and well met! You have traveled far indeed to cross my path. I will be testing you in compassion, sacrifice, and love. Are you ready for the test of the heart, " .. e.other:GetCleanName() .. "?");
	elseif(e.message:findi("test of the heart")) then
		e.self:Say("As I said before, the test of the heart is in three parts.  Compassion, Sacrifice and Love. Choose one and we will begin.");
	elseif(e.message:findi("compassion")) then 	--paladin test of compassion
		e.self:Say("Compassion is of great importance to us. Without it, we do not feel empathy, and cannot truly follow the path we claim to travel. Return to me an Efreeti zweihander, dulcet nectar, a golden hilt, and a large sky diamond. If you present these to me, I will award you Truvinan, the divine wind.");
	elseif(e.message:findi("sacrifice")) then 	--paladin test of sacrifice
		e.self:Say("You have sacrificed much to come so far, Erudite.  Sacrifice this one last time and the Sword of the Ocean shall be yours.  Retrieve a griffon statuette, a spiroc peace totem, and a bixie sword blade.");
	elseif(e.message:findi("love")) then 		--paladin test of love
		e.self:Say("Love is what brings us close to the gods we follow.  Without it, we could not truly worship them, and would be lost.  Prove yourself to me and return with a dark spiroc feather, ethereal topaz, and a sphinxian claw.  In return, I will give you Thelvorn.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20725, item2 = 20964, item3 = 20726, item4 = 20727})) then 		--paladin test of compassion using efreeti zweihander, dulcet nectar, golden hilt, large sky diamond
		e.self:Say("Truvinan is now yours, " .. e.other:GetCleanName() .. ". I pray that you use the Divine Wind wisely.");
		e.other:QuestReward(e.self,0,0,0,0,11682,100000); --Truvinan, the divine wind
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20950, item2 = 20721, item3 = 20722})) then 	--paladin test of sacrifice using griffon statuette, spiroc peace totem, bixie sword blade
		e.self:Say("Rare is it to see one such as yourself go so far. Wield Aldryn with pride, " .. e.other:GetCleanName() .. ", and know that you are perhaps unique among your peers.");
		e.other:QuestReward(e.self,0,0,0,0,27708,100000); --Aldryn, blade of the ocean
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20957, item2 = 20723, item3 = 20724})) then 	--paladin test of love using dark spiroc feather, ethereal topaz, sphinx claw
		e.self:Say("You are indeed worthy of this divine sword, " .. e.other:GetCleanName() .. ". As long as you wield Thelvorn, you will follow the true path.");
		e.other:QuestReward(e.self,0,0,0,0,27709,100000); --Thelvorn, Blade of Light -- Original: Zephyrwind (11681)
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
