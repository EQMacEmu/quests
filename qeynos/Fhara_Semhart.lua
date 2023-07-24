function event_say(e)
	if(e.message:findi("tax")) then -- triggers without starting quest
		e.other:Faction(e.self,291,-1,0); -- Faction: Merchants of Qeynos
		e.self:Say("Taxes? How can I afford more taxes? You tax us poor merchants right out of Qeynos. Freeport is looking better and better every day.");
		e.other:SummonCursorItem(13175); -- Item: Semharts Tax Payment
	end
end
