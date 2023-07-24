function event_say(e)
	if(e.message:findi("hail"))then
		e.self:Say("A warm hello to you. " .. e.other:GetCleanName() .. "! Please make yourself at home here in the serene locale of Sunset Home. Here you can forget about the [queue]. and enjoy the company of your fellow guides!");
	elseif(e.message:findi("What queue?"))then
		e.self:Say("Queue? What queue? We don't need no stinkin' QUEUE!' Starzin glances around and giggles gleefully. then whispers. 'Just don't tell anyone else!");
	end
end

--Converted to LUA by Speedz
