function event_spawn(e)
	eq.set_timer("help",3000000);
end

function event_timer(e)
	local endicRandom = 0;
	if(e.timer == "help") then
		endicRandom = math.random(100);
		if(endicRandom < 50) then
			e.self:Emote("grunts as she tries to fill two buckets of [water]. Her frail arms strain at her work and pain fills her eyes with tears.");
		end		
	end
end



function event_say(e)
	if(e.message:findi("take")) then
		e.self:Emote("looks at you.  'Surely you are a pure soul.  If you would take this bucket of water to my brother, I would be forever grateful.  I'm just so tired, I need to rest...'  She slumps to the floor and begins to breathe shallowly, in short, harsh gasps.");
		e.other:SummonCursorItem(29008); -- bucket of water
	elseif(e.message:findi("water")) then
		e.self:Say("Aye, water, m'lord. For my brother. He is very sick. He's needin' drink. He's burnin' up. I am sick myself but still able to move, a little. I must [take this water to him] before he gets worse.");
	end
end

-- END of FILE Zone:freportw -- peasant_woman