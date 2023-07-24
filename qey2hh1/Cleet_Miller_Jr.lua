function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("grumbles and looks up at you.");
	elseif(e.message:findi("who") or e.message:findi("what")) then
		e.self:Say(string.format("Listen, %s, I don't want to be rude, but these fields don't tend to themselves, you know.  I don't have time for your little questions.  Go talk to Tiny if you are feeling chatty.",e.other:GetName()));					
	end
end

function event_waypoint_arrive(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	
	if(e.wp == 2 or e.wp == 9) then
		e.self:Emote("gathers up a bale of straw");
		eq.create_ground_object(13990,xloc,yloc,zloc,0,600000);
	elseif(e.wp == 3 or e.wp == 10) then
		e.self:SetRunning(true);
	elseif(e.wp == 5 or e.wp == 12) then
		e.self:SetRunning(false);
	end
end
