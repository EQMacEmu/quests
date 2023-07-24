-- Winds of Karana
-- Broken Lute

function event_waypoint_arrive(e)
	if(e.wp == 1 or e.wp == 3 or e.wp == 8) then
		e.self:SetRunning(true);
	elseif(e.wp == 2 or e.wp == 6 or e.wp == 10) then
		e.self:SetRunning(false);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings!  I am Cordelia, a traveling piper. I am afraid I cannot play a tune for you, however, as my [flute] is gone.");
	elseif(e.message:findi("flute")) then
		e.self:Say("I traded my flute to a hermit in the southern plains of Karana. I had a spare flute, but that was taken from me by some bandits. If you could find this hermit and ask him for my flute back, I would be most appreciative.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13310})) then -- A cracked Flute
		e.self:Say("Why thank you, kind adventurer! Here is a little something to keep food in your belly. Now back to practice. La la la..");
		e.other:Faction(e.self,284,5); -- Faction: League of Antonican Bards
		e.other:Faction(e.self,281,1); -- Faction: Knights of Truth
		e.other:Faction(e.self,262,1); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,304,-1); -- Faction: Ring of Scale
		e.other:Faction(e.self,285,-1); -- Faction: Mayong Mistmoore
		e.other:QuestReward(e.self,0,math.random(5),0,0,13119,1000); -- Winds of Karana sheet 2
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE zone:northkarana ID:13037 -- Cordelia_Minster.pl
