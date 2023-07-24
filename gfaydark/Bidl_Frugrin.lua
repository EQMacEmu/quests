function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greeting. Do not you find the wine of Kelethin as sweet as their women?");
	elseif(e.message:findi("lens")) then
		e.self:Say("Oh my!! I forgot I had that. Here you are. You better take it back I need to go elsewhere, bye now.");
      e.other:SummonCursorItem(13276); -- telescope lens [bidl's lens]
	end
end

-- END of FILE Zone:gfaydark  ID:54302? -- Bidl_Frugrin