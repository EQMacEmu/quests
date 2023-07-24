function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Grab a pole and start fishing. You never know what you will catch. Rohan is offering a reward for some fish. Dead or alive!");
	elseif(e.message:findi("donate") or e.message:findi("donation")) then
		e.self:Say("Donate!? I think not. Go ask [Bait Masterson]. He has made a bundle from selling his daily catch.");		
	elseif(e.message:findi("Masterson")) then
		e.self:Say("Masterson? Lately, I hear he has been spending a lot of time fishing in the catacombs underneath Qeynos. Must be at night when his wife is asleep. Ha!");				
	end
end