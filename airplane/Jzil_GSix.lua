-- Necromancer Epic NPC -- Jzil_GSix

function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah, so you have come to be tested. Many fine things can be your reward. There are three tests which I can administer. Shall you take the test of flight, power, or mind?");
	elseif(e.message:findi("flight")) then 			--necromancer test of flight
		e.self:Say("So, you wish the test of flight? So be it. You must return to me a Verdant Tessera, an Ebon Shard, and a Griffons Beak to reap your rewards. May the darkness guide your steps.");
	elseif(e.message:findi("test of power")) then 	--necromancer test of power
		e.self:Say("The test of power it is. Prove yourself worthy of power and bring me a silver disc, spiroc feathers, and a black silk cape. Only then will you know true power.");
	elseif(e.message:findi("mind")) then 			--necromancer test of mind
		e.self:Say("The test of mind it shall be.  You must return to me, from this place of air and mist, a rugous globe, some djinni blood, and fine cloth raiment.  Then, and only then, you shall have the reward you deserve!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20932, item2 = 20780, item3 = 20781})) then 	--necromancer test of flight using verdant tessera, ebon shard, griffon's beak
		e.self:Say("Yesss? You do well, " .. e.other:GetCleanName() .. ".  Take thisss sssmall token to show my ressspect for you.");
		e.other:QuestReward(e.self,0,0,0,0,27712,1000000); --bloody griffon-hide wrist guard -- Original: Rotted Griffon-Hide Wrist Guard (2709)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20938, item2 = 20782, item3 = 20783})) then --necromancer test of power using silver disc, spiroc feathers, black silk cape
		e.self:Say("This feathered cape should be more than enough payment, now be gone from my sight!");
		e.other:QuestReward(e.self,0,0,0,0,1278,1000000); --cloak of spiroc feathers
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20945, item2 = 20784, item3 = 20785})) then --necromancer test of mind using rogous globe, djinni blood, fine cloth raiment -- no reward dialogue, confirmed
		e.other:QuestReward(e.self,0,0,0,0,1279,1000000); --bloodsoaked raiment
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
