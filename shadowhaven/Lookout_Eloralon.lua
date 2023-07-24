function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetins dere, " .. e.other:GetCleanName() .. ".  I be in charge of watching da bank to make sure nutin fishy is going on. If'n ye see any funny business round ere, you be sure and give me a holler. Ayup!");
	end
end
