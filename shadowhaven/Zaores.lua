function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey there " .. e.other:GetCleanName() .. ", I handle most of the shipping and receiving for the Trade Commissioner here. I might have some leftover wares for sale soon, check back with me later.");
	end
end
