function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("There are those who might say that If all trade eventually goes through me then it must be I who controls all the trade.  Heehee, I would never say that of course.  I value my neck too much and Duke Norfin Is not known for his sense of humor.");
		else
			e.self:Say("We know who you are.  Give me the slightest reason and I will call the scounds upon your head.");
		end
	end
end
