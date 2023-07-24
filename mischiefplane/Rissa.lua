function event_spawn(e)
	e.self:SetRunning(true);
end

function event_waypoint_arrive(e)
	if(e.wp == 1) then
		e.self:Say("Ahhhhhh!  Someone help me!  This crazy Bixie is chasing me!");
	elseif(e.wp == 9) then
		e.self:Say("Its almost got me!  Someone help!");
	elseif(e.wp == 12) then
		e.self:Say("Won't anyone help me!  Ahhh!");
	elseif(e.wp == 16) then
		e.self:Say("NO NO NO NO!  I can keep running!  You will not catch me you crazed Bixie!");
	elseif(e.wp == 21) then
		e.self:Say("These legs will carry me to salvation!  Someone get this Bixie off me!");
	elseif(e.wp == 24) then
		e.self:Say("Maybe if it rains, her wings will be wet and I can get her!");
	elseif(e.wp == 28) then
		e.self:Say("Blast it all!  No help!  No help from anyone I see!  AHHHHHH!");
	end
end