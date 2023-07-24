function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The mushrooms!  They will save us.  I must protect and nurture the mushrooms...");
	end
end
