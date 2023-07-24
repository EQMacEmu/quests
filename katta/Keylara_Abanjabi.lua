function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, brave " .. e.other:GetCleanName() .. "! I am Magistrate Keylara Abanjabi of Katta Castellum, Grand City of the Loyalist Combine Empire. I hope that your stay here is a pleasant one. Even in these dark times the will and teachings of Tsaph Katta light the way for our citizens to live amiable and fulfilling lives.");
	end
end
