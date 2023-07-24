function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("valdanov")) then
		e.self:Say("I have not seen Valdanov Zevfeer in many years. He came to me once when I was still newly reborn wanting to extract a vial of my blood.  When I refused he attacked me and extracted it against my will. I was still new and unfamiliar with my vampyric powers, Valdanov's [abilities] were far more developed than my own.");
	elseif(e.message:findi("abilities")) then
		e.self:Say("His vampyric abilities of course. Valdanov had either been reborn in undeath far before myself or had a powerful mentor and the time and facilities in which to train. I did my best to resist his attack but I was still subdued by his superior skills and strength. He dropped this key in the struggle. I have no use for it, consider it yours. I must be going before I'm seen by the others. Oh no! It's too late! We've been spotted! May you continue your investigations in the afterlife!");
		e.self:Emote("  rapidly transforms into swirling mist indistinguishable from the wind swept mountain fog as other forms begin to solidify from the fog nearby.");
		eq.spawn2(172185,0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); -- a_coterie_general
		eq.spawn2(172185,0,0,e.self:GetX()-5,e.self:GetY()+5,e.self:GetZ(),e.self:GetHeading()); -- a_coterie_general
		eq.spawn2(172185,0,0,e.self:GetX()+5,e.self:GetY()+5,e.self:GetZ(),e.self:GetHeading()); -- a_coterie_general
		eq.spawn2(172185,0,0,e.self:GetX()+5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); -- a_coterie_general
		e.other:QuestReward(e.self,0,0,0,0,31758); -- Old Bone Key
		eq.depop();
	end
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end
