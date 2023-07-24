function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings to you, %s. What business do you have with us? We are quite busy with the [enchantment of the stone].",e.other:GetName()));				
	elseif(e.message:findi("enchantment of the stone")) then --gives this response at indifferent and at ally
		e.self:Say("That is none of your concern! I do believe that you should be on your way.")
	end
end