function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello stranger, what was your name? Ahh good to meet you, " .. e.other:GetCleanName() .. ", I am Grudash the Baker. We do not get many strangers to these parts. Some of those that we have had here turned out to be more trouble than they were worth, so you may encounter a few negative reactions. Not from me though, you look like honest folk and perhaps paying customers, so I will give you a chance. Watch your step around Halcix there, he seems a might hungry today.  He already finished off at least a dozen of my Boysenberry pies. He has what you would call, a very voracious appetite.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(114536)) then
			eq.get_entity_list():GetMobByNpcTypeID(114536):Say("I like pie.");
			eq.get_entity_list():GetMobByNpcTypeID(114496):Say("Yes Halcix, we know you like pie. But you have had enough, we need to feed the others as well you know.");
			eq.get_entity_list():GetMobByNpcTypeID(114536):Say("I'm hungry.");
		end		
	elseif(e.message:findi("boysenberry")) then
		e.self:Emote("chuckles, 'I thought you might, what say you now Ruru? Who is the better cook between us now?'");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(114496)) then
			eq.get_entity_list():GetMobByNpcTypeID(114496):Emote("grumbles, 'Bah, this still doesn't settle anything Grudash. This stranger obviously has no taste for fine cuisine.'");
		end		
	end
end
