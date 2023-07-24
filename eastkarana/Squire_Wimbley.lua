
function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then --guessing on faction level, only tested at scowls
			e.self:Say("Hello! Good to meet you. The road ahead is full of all sorts of nasty creatures. If I were you, I would speak with my master, [Sir Morgan].")
		else
			e.self:Say("I care not to speak with one who treats the people of Karana in such a vile fashion. Leave, before I call Sir Morgan!")		
		end
	elseif(e.message:findi("morgan")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Sir Morgan is only the bravest warrior in all the plains!");
		else
			e.self:Say("I care not to speak with one who treats the people of Karana in such a vile fashion. Leave, before I call Sir Morgan!")		
		end
	end
end