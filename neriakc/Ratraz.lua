function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Spend your money or get out! This ain't no pansy social club!");
	elseif(e.message:findi("advisor")) then
		e.self:Say("The royal advisor is a big spender in this club. Better than you, I see. Now, get lost!");
	end
end