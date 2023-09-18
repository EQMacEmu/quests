function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, adventurer. I hope the land of Norrath has been kind to you. I myself have made a killing. Hunting is surely the sport of the rich. And if you are not rich at its start, you soon shall be, from the profit made off hides.");
	end
end
