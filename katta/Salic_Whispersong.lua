function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met " .. e.other:GetCleanName() .. "! I am Magistrate Salic Whispersong of Katta Castellum and the Empire of the Loyalist Combine. I assist the scholars of Katta Castellum with study and documentation of the rich and detailed history of our grand city. Should you find the need to discover a tid bit of information regarding our city or empires past I will be of service of point you in the right direction.");
	end
end
