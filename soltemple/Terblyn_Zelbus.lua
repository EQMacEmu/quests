function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. " .. e.other:GetCleanName() .. ". I am the wizard known as Terblyn Zelbus.  I became a merchant after I couldn't handle the pressures of being one of [Al'Kabor]'s assistants.  He's an old fogey, but don't tell him I said that. I don't think he likes short people very much.");
	elseif(e.message:findi("who is al")) then
		e.self:Say("Master Al'Kabor is the most powerful living wizards on Norrath.  His powers are rather scary to be around.  When I was one of his assistants, he would often try out his new spells and experiments on me.  Some of them left me not feeling so well.   I must say, though, I don't think I suffered as much as poor [Sorko Talvazon] did.");
	elseif(e.message:findi("sorko talvazon")) then
		e.self:Say("Sorko Talvazon was one of the master's assistants for a long time.  He did a fine job . . . At least that's what I thought.   So what if he decided to sell me information?  The old man can't keep all those [nifty secrets] to himself forever.");
	elseif(e.message:findi("nifty secrets")) then
		e.self:Say("Hehe.. Well, if I told you that, then they wouldn't be secrets anymore, now would they?  Hehe.. okay, okay,  you win.  I will tell you part of one.   Awhile ago, Sorko Talvazon brought some spell scrolls to me at the request of the master himself.  He wanted the younger wizards of Norrath to experiment with the effects of the spells.  That was when Sorko first informed me of other spells that Al'Kabor created back in his laboratory hidden away in Erudin.  It seems to me that he was quite [selfish] about them.");
	elseif(e.message:findi("selfish")) then
		e.self:Say("Al'Kabor didn't want to distribute those spells for some reason.  I told Sorko that I would pay him handsomely if he would bring me the scrolls.  At first Sorko was worried about betraying Al'Kabor, but after I upped the offer, he willingly accepted.  He brought me five new spell scrolls along with some [vital information] about them.  Over time, Sorko and I sent a few letters back and forth.  Unfortunately, one of the letters got intercepted by Al'Kabor.  I tried to warn Sorko, but I guess the warning was too late.  Enraged, Master Al'Kabor stripped Sorko of his wizardry and banned him from his laboratory.");
	elseif(e.message:findi("vital information")) then
		e.self:Say("Oh no, I can't give you that information.  How else would I keep the edge on profitability?  What I will tell you is that Sorko gave me the formula for Al'Kabor's portal fragment enchantment process.  This process is needed in order to augment the power of the fragments.  If you want a sample of the enchanted fragments, you'll have to buy them from me.  These small portal fragments are a vital component of the [teleportation] spells that lead to several locations.");
	elseif(e.message:findi("teleportation")) then
		e.self:Say("Aye, teleportation. Translocation, to be exact.  Apparently, with this magic power, a wizard can send his target to a location without needing to travel there himself.  I have several scrolls for sale right now.  Care to buy one? I even have some that reach the [dragon circles] on the icy continent of Velious.");
	elseif(e.message:findi("dragon circles")) then
		e.self:Say("The dragon circles.. you know those pretty circular locations that we can gate to using a special dragon's tooth.  The teeth aren't enough for the translocation spells though.  I tried to duplicate Al'Kabor's research, but I wasn't able to figure out how to reach that far.  The grumpy ol' wizard figured it out though.  He finally determined the right incantations needed to reach the icy land.  A friend of mine happened to be delivering him a message when he figured it out.  I'm willing to sell the scrolls and fragments to you if you promise not to tell.");
	end
end

--END of FILE Zone:soltemple  ID:6473 -- Terblyn_Zelbus
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------