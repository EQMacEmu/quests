function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, there, " .. e.other:Race() .. ". How goes it? Much fairer than I, I'll wager. Me troops can't hit the broad side of a mammoth with their crossbows. Oh, by the way, I'm Lieutenant Ulfur, Commander of the 23rd Coldain crossbow regiment, if ye kin call it a regiment.");
	elseif(e.message:findi("regiment")) then
		e.self:Say("Yes. we assist our troops in military endeavors. Although we're almost more harm than good. All me troops have soldier envy. They want in the middle of the rumble, face ta face with their enemies stompin them into the ground. That's all well and good but a contingent of crossbowmen can be the difference in winning or losing. Do you favor ranged weapons, " .. e.other:GetCleanName() .. "?");
	elseif(e.message:findi("yes")) then
		e.self:Say("Ahh, well, maybe sometime I'll let ya try out one of our famed crossbows. Maybe even give ye one if ye prove yerself to the Coldain cause. Unfortunately. though. we can spare no crossbows now. Perhaps in the future we will be able to.");
	elseif(e.message:findi("no")) then
		e.self:Say("Heh, figures. Almost no one kin fully appreciate the warm feelin' ye get when a bolt ye fired splits the skull of yer adversary. They don't even see it comin'; kinda absolvers yer guilt fer killin' another bein'. Anonymous killin', heheheh.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 15) then
		e.self:Emote("yawns and says, 'Well, time fer me ta walk the floor again lads.'");
		eq.signal(115104);
		eq.signal(115206);
		eq.signal(115105);
		eq.signal(115207);
		eq.signal(115107);
		eq.signal(115208);
		eq.signal(115109);
		eq.signal(115110);
		eq.signal(115209);
		eq.signal(115112);
		eq.signal(115113);
		eq.signal(115211);	
	end
end
