function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, traveler. Have I informed you about the [travel tax]?");
	elseif(e.message:findi("travel tax")) then
		e.self:Say("The travel tax is a fee of one gold for the privilege of using the highways of Karana. Oh! You know what? You must've used the roads to get here! I guess you owe me 1 gold!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Time to push our weight around. Ahhh. There is nothing better than being a Qeynos Guard.");
		eq.start(19)
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 1) then
		e.self:Say("You know the routine. You give me sixty percent of the McMannus profit and you can continue living. Unless, of course, the McMannus family can take on the entire Qeynos Guard..?");
		eq.signal(12095,1); -- NPC: Sera_McMannus
	elseif(e.wp == 2) then
		eq.stop();
		eq.move_to(-2042,-2912,44,164,true);
	end
end