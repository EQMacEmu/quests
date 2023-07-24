function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. "!  Are you just visiting Qeynos?  We have plenty of rooms available or, if your throat is parched, you can always visit Earron in our pub.");
	elseif(e.message:findi("tax")) then -- triggers without starting quest
		e.other:Faction(e.self,291,-1,0); -- Faction: Merchants of Qeynos
		e.self:Say("Taxes? Oh, that time again huh? Here you are. Give Vicus our best. I hear he is under the weather.");
		e.other:SummonCursorItem(13176); -- Item: Huntlans Tax Payment
	end
end

function event_signal(e)
	if(e.signal == 2) then
		e.self:Say("Yes.  He is staying here at the Lion's Mane Inn, but it is against regulations to give out room numbers.  I can tell you that he loves to see the sun rise over the ocean.");
	end
end
