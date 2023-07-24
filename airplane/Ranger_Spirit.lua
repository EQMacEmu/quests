function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". Are you a true servant of the Pine?");
	elseif(e.message:findi("servant of the pine")) then
		e.self:Say("Very well my friend. In order to reach your true potential you must pass many tests. Relinin Skyrunner and Gordon Treecaller are here to perform these tests. Please choose one.");
	elseif(e.message:findi("relinin")) then
		e.self:Say("Relinin Skyrunner, you say. True to Tunare is she.  Take this book and read it. When you feel you know it well, return it and Relinin will appear to test you.");
		e.other:SummonCursorItem(18546); -- Sisters and Life
	elseif(e.message:findi("gordon")) then
		e.self:Say("Ahhh, Gordon Treecaller.  Many say he is the finest swordsman ever. Read of his tale and return the book when you are finished.");
		e.other:SummonCursorItem(18547); -- The Mother
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18546})) then --Sisters and Life
		e.self:Say("Relinin Skyrunner, I summon thee.");
		eq.spawn2(71095,0,0,617.1,1399.5,-766.9,129.4); -- NPC: Relinin_Skyrunner
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18547})) then --The Mother
		e.self:Say("Gordon Treecaller, I summon thee.");
		eq.spawn2(71090,0,0,592.8,1400.1,-766.9,129.4); -- NPC: Gordon_Treecaller
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end