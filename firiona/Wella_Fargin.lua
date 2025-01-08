function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Next!!  Oh,  is that you?  Well, go ahead and make your transaction.  Ho.. Humm.  A beautiful woman such as myself should not have to work alongside her bookish brother day and night.  I long to return to Felwithe and its majesty.  Only marriage would release me from this lowly servitude.");	
	elseif(e.message:findi("marry")) then
		e.self:Emote("blushes softly.  'Oh, you are far too kind, but you are an adventurer.  You would be away and in danger far too frequently.  My heart could not take your absence for more than a hour.  Thank you, anyway.  For your kind words, let me inform you of something I [overheard].");
	elseif(e.message:findi("overheard")) then
		e.self:Say("I have heard of a powerful emperor of the lizard race.  His soul has not been released from this realm and he wanders the land in a spectral state.  It is said that with him lies the key to great treasure.  Where he is, I am afraid I do not know.");
	end
end
