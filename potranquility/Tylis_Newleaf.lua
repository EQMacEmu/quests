function event_say(e)
	local qglobals = eq.get_qglobals(e.other);

	if ( e.message:findi("hail") ) then
	
		if ( qglobals.saryrn or qglobals.cipher ) then
			e.other:Message(0, "Tylis Newleaf tells you, 'You took on and destroyed the Mistress of Torment? Truly impressive! Now that you have found the knowledge that is the cipher, I recall that there was one that I had met once in New Tanaan. He might be able to use it properly. I believe he is now the Grand Librarian of the city.  Good luck with all that you seek friends.'");
			
		elseif ( qglobals.tylis and qglobals.tylis == "2" ) then
			e.other:Message(0, "Tylis Newleaf tells you, 'I wanted to thank you once again for your kind efforts, friend. That place had laid claim to me for far too long. So long that I have seen what Saryrn carries. I believe it to be a cipher between the language of the gods and common tongue. If it is real ultimate power that you seek, you should obtain it from her.'");
			
		else
			e.other:Message(0, "Tylis Newleaf lies on the floor still quivering in pain.  You notice the concern that Fahlia is showing for him.");
		end
	end
end
