function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("I carry only the finest tools of the trade.  We wouldn't want any of your 'special' concoctions to go bad, or even leak at an inopportune moment.");
		else
			e.self:Say("We know who you are.  Give me the slightest reason and I will call the scounds upon your head.");
		end
	end
end