function event_say(e)

	if(e.message:findi("hail")) then
		e.self:Say("Welcome " .. e.other:GetCleanName() .. ". What brings you out this way? Be careful, we have had problems with bandits of late. As if the gnolls were not enough.");
	elseif(e.message:findi("tax")) then
		e.self:Emote("looks up with tear-filled eyes and sobs uncontrollably.");
		e.other:Faction(e.self,291,-1); -- Faction: Merchants of Qeynos
	elseif(e.message:findi("crying")) then
		e.self:Emote(".sniff.. Oh, dear. We do not have the money. We were just robbed by a dreadful halfling bandit named Flynn something-or-other. He took the money we had set asisde for Antonius. Please. Find this highwayman and retrieve our tax payment. ..sob..");
	end
	
end