function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello stranger, what was your name? Ahh good to meet you, " .. e.other:GetCleanName() .. ", I am Grudash the Baker. We do not get many strangers to these parts. Some of those that we have had here turned out to be more trouble than they were worth, so you may encounter a few negative reactions. Not from me though, you look like honest folk and perhaps paying customers, so I will give you a chance. Watch your step around Halcix there, he seems a might hungry today.  He already finished off at least a dozen of my Boysenberry pies. He has what you would call, a very voracious appetite.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(114496)) then
			eq.get_entity_list():GetMobByNpcTypeID(114496):Say("Hah! Whatever Grudash. You know that my Roasted Walrus in Plum Sauce is better. You just don't want to admit it.");
			e.self:Say("Why would I admit to such a lie? Everyone loves my pies. I rarely see anyone come in here asking for your Roasted Walrus.");
			eq.get_entity_list():GetMobByNpcTypeID(114496):Say("Just you wait, just you wait! One of these days Grudash, you'll see.");
			e.self:Say("Please ignore my friend Ruru here. He is a bit delusional.");
			eq.get_entity_list():GetMobByNpcTypeID(114496):Say("Bah!");
		end		
	elseif(e.message:findi("boysenberry")) then
		e.self:Emote("chuckles, 'I thought you might, what say you now Ruru? Who is the better cook between us now?'");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(114496)) then
			eq.get_entity_list():GetMobByNpcTypeID(114496):Emote("grumbles, 'Bah, this still doesn't settle anything Grudash. This stranger obviously has no taste for fine cuisine.'");
		end		
	end
end
