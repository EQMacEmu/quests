function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". I am Rallena Doyle, Governess of Shamanism here in Katta Castellum. I work closely with Magistrate Malicus in maintaining the practice of traditional shamanism here on Luclin and maintaining a healthy relationship with the native spirits and the Vah Shir Spiritists in Shar Vahl.'");
	end
end
