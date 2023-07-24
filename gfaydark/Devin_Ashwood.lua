function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day to you. " .. e.other:GetCleanName() .. "!  I am Devin Ashwood.  Pleased to make your acquaintance.");
	elseif(e.message:findi("Ganelorn Oast") or e.message:findi("greatest")) then
		e.self:Say("Ganelorn Oast! For he has single-handedly caught more poachers than any other ranger. He is credited for helping numerous endangered species recover from certain extinction. I suppose I am lucky he is fond of my sister, as I am soon to train under him as an apprentice. Perhaps one day I will even [call upon the flames] in the way that he does.");
		eq.signal(54086,2); -- NPC: Lily_Ashwood
	elseif(e.message:findi("call upon the flames")) then
		if(e.other:GetLevel() >= 50) then
			e.self:Say("Aye, Ganelorn is renowned not only for his abilities as an archer and a master of melee combat, but also for his use of powerful magics. Never before have I seen a forester evoke a fireball of such great force. It would be any ranger's dream to become his pupil just to study that one spell. Ganelorn doesn't train just anyone, though. If you want to learn from him, I'm certain you would have to prove yourself as a forester.");
		else
			e.self:Say(eq.ChooseRandom("Someone with your skills is more suited to beetle slaying.  Run along, now.","This matter is far too advanced for you to handle.  Come back after you've killed a few more large rats.","It's much safer for you to spend time fishing than on a dangerous issue like this.","I think I saw a gnoll pup you could probably defeat, a few miles back."));
		end
	elseif(e.message:findi("want to learn")) then
		if(e.other:GetLevel() >= 50) then
			e.self:Say("He is a very busy individual. I believe he is currently in the eastern part of the Karanas trying to track down a poacher. Even if you can track him down, don't get your hopes up.' Lily Ashwood says 'Oh! If you're going to see him, would you please take this letter to him? I trust you, since you're a ranger and all.");
			eq.signal(54086,3); -- NPC: Lily_Ashwood
		else
			e.self:Say(eq.ChooseRandom("Someone with your skills is more suited to beetle slaying.  Run along, now.","This matter is far too advanced for you to handle.  Come back after you've killed a few more large rats.","It's much safer for you to spend time fishing than on a dangerous issue like this.","I think I saw a gnoll pup you could probably defeat, a few miles back."));
		end		
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Bah! Why would the greatest forester in all of Norrath ask you to marry him? Between his time spent protecting wildlife, hunting poachers and training me, I doubt he has any spare time for a foolish girl like you, sister.");
		eq.signal(54086,1); -- NPC: Lily_Ashwood
	end
end

-- END of FILE Zone:gfaydark  ID:54081 -- Devin_Ashwood