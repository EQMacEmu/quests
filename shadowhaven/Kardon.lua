function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey there " .. e.other:GetCleanName() .. ", I am currently waiting for my teacher to arrive so that I can begin my training. It was nice to meet you.");
	end
end
