function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met " .. e.other:GetCleanName() .. "! I pray that you have learned of the teachings of Tsaph Katta during your visit to Katta Castellum. I am Arialestra Dionicas, the Governess of Faith. Many begin to lose faith in such dark times but through our devotion to the will of Tsaph Katta and the maintaining of the traditional teachings of the Gods of Light we are able to move forward and progress despite the burdens of our troubles.");
	end
end
