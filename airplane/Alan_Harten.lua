function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings faithful. Your faith shall be tested this day.  Shall you take the test of courage, skill, or protection?");
	elseif(e.message:findi("courage")) then	--cleric test of courage
		e.self:Say("You have come seeking the knowledge and treasures I possess.  I will impart such things to you, if you do a service to your god.  It matters not who that god may be, but the service and the faith you must exemplify.  Bring to me an ochre tessera, a sky emerald, and a silver hoop.");
	elseif(e.message:findi("skill")) then --cleric test of skill
		e.self:Say("The test of skill it will be.  Bring to me a golden disc, a piece of dark wood, and a small shield.  You shall be rewarded upon your return.");
	elseif(e.message:findi("protection")) then --cleric test of protection
		e.self:Say("So, you must be a great protector to have ventured this far.  Bring to me an adumbrate globe, a faintly glowing diamond, and some shiny pauldrons to get your reward.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20933, item2 = 20807, item3 = 20806})) then	--cleric test of courage using ochre tessera, silver hoop, sky emerald
		e.self:Say("Your deeds impress even me, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,14563,100000); --truewind earring
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20808, item2 = 20939, item3 = 20809})) then --cleric test of skill using dark wood, gold disc, small shield
		e.self:Say("This shield shall protect you as your faith has in the past. Take it.");
		e.other:QuestReward(e.self,0,0,0,0,27716,100000); --aegis of the wind -- Original: Darkwood Aegis (9201)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20946, item2 = 20810, item3 = 20811})) then	--cleric test of protection using adumbrate globe, faintly glowing diamond, shiny pauldrons
		e.self:Say("You deserve these pauldrons, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,27717,100000); --pauldrons of piety -- Original: Glowing Pauldrons (4323)
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