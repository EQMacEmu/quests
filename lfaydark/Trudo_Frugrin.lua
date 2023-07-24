function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What. what?!! I am quite busy here. I have studies to complete and charts to make!");
	elseif(e.message:findi("lens")) then
		e.self:Say("Yes, of course. Here you are. Now be off.");
		e.other:QuestReward(e.self,0,0,0,0,13275); --telescope lens [trudo's lens]
	end
end

--END of FILE Zone:lfaydark  ID:57059 -- Trudo_Frugrin
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------