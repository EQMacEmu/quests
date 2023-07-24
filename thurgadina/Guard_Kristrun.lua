function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("staggers in surprise, then quickly regains her composure. Guard Kristrun says, 'Oh, I'm sorry, it's just that I haven't ever seen a " .. e.other:Race() .. " before. Tell me something, is it true that your people sacrifice your own people to foreign gods?");
	end
end
