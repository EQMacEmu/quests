function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. " .. e.other:GetName() .. ".");
	elseif(e.message:findi("arena")) then
		e.self:Say("We have a fine coliseum here in Sanctus Seru.  Many glorious events are held there throughout the year, from plays to races, to gladiator games.  It can be found at the far south of the city.");
	elseif(e.message:findi("leave")) then
		e.self:Say("If you wish to leave the city, you must first pass by the Vigulum.  If they do not stop you, you are free to go.");
	end
end
