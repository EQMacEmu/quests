function event_signal(e)
	e.self:Say("Oi there General! No im not squintin in the least just was testing my eyes on somethin. Im in tip top shape 100 percent!");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Allo " .. e.other:GetCleanName() .. ", you sure are a tall one! If you're gonna stand there make sure ya don't for too long cause I can't see very well. I wish I had my spectacles.");
	end
end

