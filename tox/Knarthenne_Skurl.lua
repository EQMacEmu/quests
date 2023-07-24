-- Part of SK Epic 1.0

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Ah, you do not possess the heart of an innocent. Be gone with you!");
	elseif(e.message:findi("heart of an innocent")) then
		e.self:Say("What's that? Heart of the Innocent, you say?! Ages, it has been, since I was last asked that. The Heart of the Innocent is an item of great power. Few are they who have ever commanded the dark magic of such an object. It is the bound soul of a pure mortal, rare indeed. Take this hollow gem, and combine with it the heart of one who is pure. If your hand is steady and your mind is clear, you shall have what you seek.");
		e.other:SummonCursorItem(17051); -- Item: Soulcase
	end
end
