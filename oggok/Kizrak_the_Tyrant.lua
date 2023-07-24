function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Yes? What do you want?! I have one [purpose] here, to speak with potential heroes that the gods send to me, not to give pointless chit chat to some base, frail mortal who I could destroy in less time than it would take for me to unsheath my weapon.");
	elseif(e.message:findi("purpose")) then
		e.self:Say("Are you as deaf as your are ugly? I had stated before what my purpose here is, and I will not repeat myself. You apparently know nothing of [Kizrak the Tyrant], nor of my glorious victories and domination among the heroes.");
	elseif(e.message:findi("kizrak")) then
		e.self:Emote("sniffs once, his eyes blaring with impatience as he drums his large fingers on the hilt of the sword at his side. 'I am Kizrak the Tyrant, mighty warrior of Zek, and now champion of The Warlord. Once I brought fear and destruction to any whom would stand in the path of the Ogre nation, but now, [they are all sniveling fools] who cannot find their backside with both of their hands.");
	elseif(e.message:findi("fools")) then
		e.self:Say("The ogres, of course! I am not even sure if that is such a fitting name of these monstrous, fleshy bags of stupidity. Before the curse of Zek, the Ogres were the strongest of the gods' creations upon Norrath. I am a product of our greatest years of glory, and it was then that I ascended to take my place within the [Realm of Heroes]. I am sure that my lack of third person speech had confused you a bit as to my origins.");
	elseif(e.message:findi("heroes")) then
		e.self:Say("I led a mighty army for several decades beneath the powers of war. My deeds were recognized by The Warlord himself, and in return for my strengthening of his name in battle, I was chosen to walk the Realm of Heroes. Now, I find that I have returned to a nation of slobbering buffoons who have allied with the Teir`Dal of all creatures. It is almost painful to be subjected to the witnessing of it, but, as The [Warlord] commands, it shall be done.");
	elseif(e.message:findi("Warlord")) then
		e.self:Say("My purpose, fool! My purpose is The Warlord's command! I grow tired of you. Bring forth the coin, if of course any god would be so out of their right mind as to bestow such honor to a creature as filthy and devoid of intelligence as yourself, or leave me be before I find a much more painful route to deliver you to the hand of your god.");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------