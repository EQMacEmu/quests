function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sniffs the sweetly scented air. 'Ah, nothing will make your mouth water quite like the scent of fresh pastries! I've got the supplies you need to be well on your way to becoming an excellent chef!");
	end
end
