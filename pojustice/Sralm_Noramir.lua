function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("pounces at you, grabbing you by your throat. 'What are you doing here? Who sent you?'");
	elseif(e.message:findi("no one.* sent me")) then
		e.self:Say("I hope you are not here to free a prisoner. The Tribunal punishes such actions harshly. Once here there is no hope of escape. Even for one such as I.");
	elseif(e.message:findi(".* sent me")) then
		e.self:Say("Hmm, that name is not familiar to me.  You must be in the wrong place.  Begone before I wear your hide to keep myself warm.");		
	elseif(e.message:findi("such as i")) then
		e.self:Say("Ahh, how rude of me. Allow me to introduce myself. I am Sralm Noramir, warrior by birth thief by choice.");
	elseif(e.message:findi("thief")) then
		e.self:Say("Aye, I could steal the sword from a warriors hands or a kiss from a ladys lips. Ever hear of Emperor Sllanar?");
	elseif(e.message:findi("Emperor Sllanar")) then
		e.self:Say("He was the ruler of Sebilis, for a short time.  It does not surprise me that you have not heard of him.  His rule was not long, and he did little good or bad for the iksar.  He was, however, quite [wealthy].");
	elseif(e.message:findi("wealthy")) then
		e.self:Say("Quite wealthy, indeed.  More money than you could ever imagine, but it was just as much as I could imagine.  I felt that the good Emperor had more wealth than he could possibly ever spend, so I thought it was my duty to [relieve] him of some of the excess.");
	elseif(e.message:findi("emperor")) then
		e.self:Say("You see, generally thieves were imprisoned, or at worst executed, but banishment here was usually reserved to those who committed heinous crimes.  I guess you should be careful when you rob the person who gets to decide on the definition of heinous.  Have you any news of [Sebilis]?");
	elseif(e.message:findi("relieve")) then
		e.self:Say("Yes, and quite a job it was.  He kept all of his accumulated wealth in caves deep below the city.  Though they were well guarded, it was nothing for one such as myself.  I will not bore you with details, but the short of it is I made off with a king's ransom... Literally.  Unfortunately, I was [caught].");
	elseif(e.message:findi("caught")) then
		e.self:Emote("sighs, 'It seems the good Emperor was quite paranoid, and took precautions against this contingency.  All of his wealth was enchanted by a tracking spell.  It was silly of me not to look for it.  Stealing was a minor crime in Sebilis, but stealing from the [Emperor] was another issue all its own.'");
	elseif(e.message:findi("Sebilis")) then
		e.self:Say("Sebilis is the city of the Iksar.  The greatest city on all of Kunark, and was my home at one time.  I guess no news is good news.");
	elseif(e.message:findi("trakanon.* dragon") or e.message:findi("dragon.* trakanon")) then
		e.self:Say("A dragon in Sebilis!  Stop your foul lies. Your humor does not suit my tastes.");
	elseif(e.message:findi("who am i")) then
		e.self:Say("Well, assuming the question is as silly as it sounds, you are " .. e.other:GetCleanName() .. ".");
	end
end
