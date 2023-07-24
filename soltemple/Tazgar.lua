function event_say(e)
	if(e.message:findi("hail")) then
		-- confirmed live faction 
		e.other:Faction(e.self,415,-50,0); -- Faction: Temple of Sol Ro
	elseif(e.message:findi("solusek ro")) then
		e.self:Say("Solusek Ro is the Master of Fire and the Keeper of Power.");
	end
end
