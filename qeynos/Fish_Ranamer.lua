function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. "!  Welcome to Fish's Ale. I am Fish Ranamer, owner of the joint.  Come in and have some brew but don't be startin' no trouble or Bruno will bust you open!");
	elseif(e.message:findi("tax")) then -- triggers without starting quest
		e.other:Faction(e.self,291,-1,0); -- Faction: Merchants of Qeynos
		e.self:Say("Taxes?! Taxes?! Tax me right out of business is what you folks are doing! Take your taxes and get out of my pub! Unless, of course, you care to buy some drinks...?");
		e.other:SummonCursorItem(13178); -- Item: Ranamers Tax Payment
	end
end
