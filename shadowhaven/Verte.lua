function event_waypoint_arrive(e)
	if (e.wp == 1) then
		e.self:Say("Ok Talor, I'm off to the keep to deposit our daily earnings. Watch the shop while I'm gone, will ya mate.");
	elseif (e.wp == 11) then
		e.self:Say("Hello there Faloensar, having a good day I would hope.");
		eq.signal(150286,1); -- NPC: Fordel_Keeper_Faloensar
	elseif (e.wp == 12) then
		e.self:Say("Ah well just here to make my daily deposit then it's back to the bar for me. Had quite a brawl last night and still got some cleaning up to do. Those crazy Dwarves I tell you, get a few drinks in them and they want to take on the world or the closest Barbarian.");
		eq.signal(150286,2); -- NPC: Fordel_Keeper_Faloensar
	elseif (e.wp == 13) then
		e.self:Say("Ill try my best! Nice doing business with you as always. Take care");
		eq.signal(150286,3); -- NPC: Fordel_Keeper_Faloensar
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Hey there " .. e.other:GetCleanName() .. ". We carry many Shadowhaven exclusive brews here in our tavern. Pull up a barstool and enjoy an ale or two.");
		else
			e.self:Say("Due to the problems we have had lately with dishonorable visitors to the Haven we require all newcomers to see Daloran and Mistala for some simple tasks to prove that your intentions are good. I hope to see you soon.");
		end
	end
end
