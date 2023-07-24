function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi there " .. e.other:GetCleanName() .. ", I have all kinds of different potions and magical stones you might find a use for.  Please take a look around and let me know what you would like.  Thanks for visiting us.");
	end
end
