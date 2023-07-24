function event_spawn(e)
	eq.set_timer("1",60000);
end

function event_timer(e)
	if(e.timer == "1") then
		local rand = math.random(2);
		if(rand == 1) then
			e.self:Say("Keep running! I'll get him.");
		end
		if(rand == 2) then
			e.self:Say("Hey down there... Behind you!");
		end
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail friend! Are you just out killing time or are you looking to earn a [wage]?");
	elseif(e.message:findi("wage")) then
		e.self:Say("Hmmm... I see. Well friend, there is plenty for you to do here. There are all sorts of pests in the hollow that lies below the city. It would be nice if we could get rid of all of them. Perhaps then we could concentrate on real soldiering. With that in mind, we are always looking for another brave young citizen to go down there and kill some of the vermin. Tell Khala Dun Bokh that you are being [assigned] to help. He will tell you what to do.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
