function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met " .. e.other:GetCleanName() .. "! I am the governess of negotiation and communication here in Katta Castellum. The majority of my dealings are with the government representatives of Shadow Haven since most of our dealings with Shar Vahl are handled by Magistrate Broote and Governess Rallena with the Shar Vahl Spiritists. Sanctus Seru unfortunately is still determined to stamp out all who do not submit to the iron fisted rule of Seru and is not open to negotiation or communication unless absolutely necessary.");
	end
end
