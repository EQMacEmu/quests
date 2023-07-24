function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. " .. e.other:GetCleanName() .. ". The Neriak signal is a newspaper that reports all the events important to the Teir`Dal. which frankly. is the only news that is truly important.");
	end
end

--END of FILE Zone:neriakb  ID:41023 -- Lynsalai_T`Nyal
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
