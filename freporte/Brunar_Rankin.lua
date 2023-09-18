function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("How are you? Please excuse my stench. I fish all day and night just to feed my large family. You look like an adventurer. That must be exciting. I am but a humble fisherman. Maybe someday we shall both be rich. You by your treasure and me by my catch.");
	elseif(e.message:findi("steal")) then
		e.self:Say("How dare you accuse me of being a thief!? I labor hour after hour trying to catch one fish which will bring me one copper piece to buy one slice of bread which I will split into five pieces to feed me, my sick wife and three little children, one of whom has the plague!! Poor little Repi. Now please, leave this humble little fisherman alone!");
	elseif(e.message:findi("Gregor")) then
		e.self:Say("Gregor Nasin is the barkeep at the Seafarer's Roost. He is the man who pays me for the fish I catch. A really good man.");
	elseif(e.message:findi("fishing")) then
		e.self:Say("Oh, yes.  It will be a good haul today.  Gregor will pay me plenty today.");
	end
end


function event_waypoint_arrive(e)
	if(e.wp == 13) then
		e.self:Say("Here is my catch for today, Gregor");
		eq.signal(10171,1); -- NPC: Gregor_Nasin
	elseif(e.wp == 34) then
		e.self:Say("Ho hum, what a lovely day !");
		e.self:SetRunning(true);
	elseif(e.wp == 39) then
		e.self:SetRunning(false);
	elseif(e.wp == 44) then
		e.self:SetRunning(true);
	elseif(e.wp == 59) then
		e.self:SetRunning(false);
	end
end

-- END of FILE Zone:freporte -- Brunar Rankin