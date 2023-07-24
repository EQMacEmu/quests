function event_spawn(e)
	eq.set_timer("where",3100000);
end

function event_timer(e)
	e.self:Say("Where are they?! I can't wait forever!");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I have no time to answer questions. whelp!  Now. leave this place before the sting of death finds the life in your veins!");
	elseif(e.message:findi("mission")) then
		e.self:Say("All right, already, if you must know! We were hunting down the escaped prisoner for the bounty. We tracked him here. We saw him take a boat downstream. Moohank and Binnlin grabbed a canoe and went after him. Being the weakest, I stayed behind to make sure the escapee did not backtrack. Of course Moohank and Binnlin will not be bested by one man, so I'm just waiting for their return. Now, will you just leave?!");
	elseif(e.message:findi("moohank")) then
		e.self:Say("Moohank has the worst temper of any Erudite I know. To keep from going insane with anger, he started fishing constantly. He lives by a small pier on the other side of the stream. He and Binnlin are on a mission.");
	elseif(e.message:findi("binnlin")) then
		e.self:Say("Binnlin is about seven feet tall and all muscle. He is very shy with a bad temper which frequently causes him to beat strangers to a pulp.");	
	elseif(e.message:findi("heretic")) then
		e.self:Say("I have no time to answer questions about those madmen!");		
	elseif(e.message:findi("prisoner")) then
		e.self:Say("Listen. That escaped prisoner is already out of this land. Don't waste your time looking for him any more. If you do, you will end up dead like the others.");		
	elseif(e.message:findi("wait")) then
		e.self:Say("I am waiting for some old friends who are headed down the stream this way. I am sure you don't want to be here when they get here. They are a temperamental lot and hate new faces. Go home!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18830})) then -- this is a placeholder item, should be "Tunic" that ID's as "Stained Tunic"
		e.self:Say("You beast! I shall send you back to the sty where you belong!");
		eq.attack(e.other:GetName());
	end
end

--END of FILE Zone:tox  ID:4508 -- Shintar_Vinlail
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

