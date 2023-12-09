function event_spawn(e)
	eq.set_timer("visit",150000);
end

function event_timer(e)
	if(e.timer == "visit") then
		eq.depop();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Didn't your mother teach you not to walk in other people's rooms without knocking?! You didn't even have the courtesy to close the door behind you!!");
	elseif(e.message:findi("princess lenya thex")) then
		e.self:Say("What?!!  You have word of the Princess?  She has been missing for quite a while.  I sent Tearon to Tunaria to search for her, but he has not reported back.  If you wish to help, you'd better prove yourself worthy first. I believe you should talk to Tynkale.");
	elseif(e.message:findi("glory.* mother.* shine.* bright")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
			e.self:Say("So you're the slayer of Jojongua. Funny, I thought you would be taller. I guess you will have to do. I am Tolon Nurbyte of the Silent Watch. We do all the dirty work of King Tearis Thex. No one knows of us. So I hope you accept this mission or I will have to kill you. Do you [accept the mission] or do you [wish to leave]?");
		else
			e.self:Say("When you have furthered your service to the Paladins of Tunare, we shall make conversation.");
		end
	elseif(e.message:findi("wish.* leave")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
			e.self:Say("There is only insufferable labor and merciless torment here, stranger. Kaya Rishareth has condemned her eternal self to servitude in the War Forge -- her selfless act malignantly repaid by the gods with this existence. Her spirit died here long ago and her life's [effort and struggles] were ultimately for naught.");
			eq.attack(e.other:GetName());
		else
			e.self:Say("When you have furthered your service to the Paladins of Tunare, we shall make conversation.");
		end
	elseif(e.message:findi("accept.* mission")) then
		if(e.other:GetFactionValue(e.self) >= 500) then -- requires kindly
			e.self:Say("In her mortal life, Kaya Rishareth was a keeper of tranquility and served her beloved child-like goddess with every fiber of her being. A native to the free city of Freeport, Kaya found herself traveling on her own as soon as her master would allow. Erudin was the destination she chose and it was the temples dedicated to The Tranquil where she sought to learn more about her goddess and perhaps share philosophies and knowledge with the High Men. Erudin received her graciously and for nearly a year, she studied the High Men's way of worship and reverence to their shared deity. However, tranquility is easily disrupted and those who seek it, must also [defend it].");
		else
			e.self:Say("When you have furthered your service to the Paladins of Tunare, we shall make conversation.");
		end
	elseif(e.message:findi("silent watch")) then
		if(e.other:GetFactionValue(e.self) >= 500) then
			e.self:Say("The Silent Watch was established in the early years of Felwithe. King Tearis Thex had many cruel deeds to do. The regular Koad'Vie were too righteous to carry out any of the necessary missions and we dare not bring in the Fier'Dal. After all, some of the operations were against Kelethin.  King Tearis formed our group from Koada'Dal not of such prim and proper breeding. Now we act as his secret guard and report only to him.");
		else
			e.self:Say("When you have furthered your service to the Paladins of Tunare, we shall make conversation.");
		end
	elseif(e.message:findi("thex dagger")) then
		if(e.other:GetFactionValue(e.self) >= 500) then
			e.self:Say("The heretics had planted a false convert in Kaya's midst, and when her good nature was focused upon this deceitful youth, she was led into a trap. The heretics defeated her in battle within the very temple of the city and her unconscious, bound and gagged body was taken to the shores. She was executed -- hollowed in a fashion that mimicked the fate to befall the heretics captured in these dark times. This, however, was not the end. A vile rite was performed upon her remains and she was returned as one of the undead -- cursed to obey the commands of those she fought to redeem in the eyes of their own people. Eventually, she was killed upon the battlefield and her spirit was destroyed. Consciousness and memories continued on, however, and here is where they reside. Fallen as a prisoner of war, what was not destroyed remained for the cosmos to consume, and the Warlord found it to be a fitting slave.");
		else
			e.self:Say("When you have furthered your service to the Paladins of Tunare, we shall make conversation.");
		end
	end
end