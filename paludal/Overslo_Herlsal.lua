function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What ya doing here " .. e.other:GetCleanName() .. "? From da looks of ya ye dont appear to be a miner. A lil dainty if ya ask me! Har");
	end
end
