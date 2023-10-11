function event_say(e)
	
	if(e.message:findi("hail")) then
		e.self:Say("Mlech!  You am NOT [Deeppocketsss].  Go aways and don't talk to Gunrich or I am hafta kill you.");
	elseif(e.message:findi("deeppockets")) then
		e.self:Say("MLACH!  I AM TOLDED YOU!  NOT TO TALKS!");
		e.self:AddToHateList(e.other, 1);
	elseif(e.message:findi("dark rivers flow east")) then
		if(e.other:GetFactionValue(e.self) >= 300) then
			e.self:Say("Heh!  Here, here, here.  Tell Rueppy hellos from Gunrich.  She am so perties.  Heh, heh.");
			e.other:SummonCursorItem(13131); --Case of Blackburrow Stout
		else
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		end
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
