function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ".  What brings you to the Tin Soldier?  We have the finest in previously owned weapons and armor.  Feel free to browse.");
	elseif(e.message:findi("tax")) then
		e.other:Faction(e.self,291,-1,0); -- Faction: Merchants of Qeynos
		e.self:Say("Here are the taxes, " .. e.other:GetCleanName() .. ". Boy, you call the guards and they take their time to show up but be a few days late on your taxes and they send the goons after you. Sheesh!");
		e.other:SummonCursorItem(13171); -- Item: Sedders Tax Payment
	end
end
