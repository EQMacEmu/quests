function event_waypoint_arrive(e)
	if (e.wp == 3) then
		e.self:Say("What the ..? Hey! Get up Halorak, you slug! Now I'm going to have to clean ale off my bed and who knows where you have been!");
	elseif (e.wp == 12) then
		e.self:Say("Hey Jaldar, I need your help. That good-for-nothing drunkard Halorak passed out in my room and I need you to 'escort' him out.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". If you happen to see Halorak, let me know.");
	end
end
