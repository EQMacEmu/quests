function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You're looking a little battle worn friend. I assume you aren't in the merchant business. The Validus Custodus could always use a few more good [vampyre hunters].");
	elseif(e.message:findi("vampyre hunter")) then
		e.self:Say("Speak with Kroldar Strongarm the Governor of War about slaying vampyres. His office is located in the Iustus Castellanus.");
	end
end
