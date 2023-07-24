function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Trading Post. While I don't have much to offer right now, I hope adventurers like you will bring me your spoils so that I may offer the best prices around.");
	end
end
