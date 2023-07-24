function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Lo ho Bumblebro! It's great to meet ye, " .. e.other:GetCleanName() .. "! Behind me leads to the finest quarter in the Shadowhaven. The Short and Stout Quarter, of course! Aye!");
	end
end
