function event_signal(e)
	e.self:Say("Not a problem sir.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey there " .. e.other:GetCleanName() .. ". Don't listen to my brother Reloen, he's just out to make a quick buck.");
	end
end
