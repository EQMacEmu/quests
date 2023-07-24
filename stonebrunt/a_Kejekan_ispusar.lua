function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Say("I am sorry, friend, but my duties prevent me from conversing. There are others that will gladly greet you and introduce you to the customs of our society.");
		else
			e.self:Say("You have done much to anger the spirits thus you are not accepted by our people.");
		end
	end
end