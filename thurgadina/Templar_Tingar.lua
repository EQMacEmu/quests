-- Templar Tingar

function event_spawn(e)
	eq.set_timer("talk",480000);
end

function event_timer(e)
	local count = 0;
	if(e.timer == "talk") then
		count = count + 1;
		if(count == 1) then
			e.self:Say("Oh Brell, what ever did I do to inspire your wrath?");
		elseif(count == 2) then
			e.self:Say("Ok, let's try this again.");
			e.self:Say("ROYGHT FACE!");
			count = 0;
		end
	end
end
