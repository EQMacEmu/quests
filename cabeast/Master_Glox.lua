--This killable version of Grand Master Glox is part of the Test of Agility, for the Whistling Fists quest line. Please see Grand Master Glox's file in this zone for more details.

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("That took you long enough. Well then, are you ready to prove your agility to me?");
	end
end

function event_death_complete(e)
	e.self:Say("You have come into your own. Spread the pain you have shown me to all of your foes.");
end

--Submitted by Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
