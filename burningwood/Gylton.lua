function event_combat(e)
	local random_result = math.random(60);

	if(e.joined) then
		e.self:Say("You will perish!!  You are weak and should have kept to your own realm!!");
		if(random_result < 21) then
			e.self:Say("" .. e.other:Class() .. " like you always bring out the worst in me!");
		elseif(random_result < 41) then
			e.self:Say("I really hate " .. e.other:Class() .. " like you!");
		else
			e.self:Say("" .. e.other:Class() .. " like you are an affront to my senses!");
		end
	end
end

function event_death_complete(e)
	e.self:Emote("slams to the ground with a loud THUD!!  The ground around you still trembles.  'Now.. I shall never slay my blasphemous.. brother..  Xyl..'");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

--by: Qadar
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
