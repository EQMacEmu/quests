function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings good " .. e.other:GetCleanName() .. "! I am Shara Aristos. Governess of History and Lore. I aid the scholars and Magistrate Salic in keeping accurate and detailed records of the history of Katta Castellum and the Combine Empire as well as organize and record lore on an abundance of topics.");
	end
end
