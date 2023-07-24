function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ".  You may call me Tolah. Please feel free to peruse my wares. I think you'll find my prices very fair considering the risk I take to bring them here. If not, you can always head into town for your shopping.");
	end
end
