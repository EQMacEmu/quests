function event_signal(e)
	e.self:Say("Thank ya General, I do me best to protect our fine citizens.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hold it right there! You have any unauthorized goods that you are carrying that I should know about? Well ya seem to look all right. Move along!");
	end
end
