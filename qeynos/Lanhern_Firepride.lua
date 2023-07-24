function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day, traveler! You look as though you are in need of [superior armor]. We here at Firepride's specialize in armor. My [husband], Ton, knows his way around the anvil.");
	elseif(e.message:findi("superior armor")) then
		e.self:Say("Our forge skills were acquired from the armor lords of Kaladim, as were our [drinking skills].");
	elseif(e.message:findi("drinking skill")) then
		e.self:Say("I learned the love of ale from the dwarves of Kaladim. Maybe someday I sall see you in the backroom at Fish's. If I do, don't forget to buy me an Ogre Swill.");
	elseif(e.message:findi("husband") or e.message:findi("ton")) then
		e.self:Say("My husband is quite adept in the art of smithing. We set up shop here but a season ago. We hope to one day be as successful as [Brohan] Ironforge.");
	elseif(e.message:findi("brohan")) then
		e.self:Say("Brohan Ironforge is the owner of Ironforge's in the northern part of Qeynos. He seems to be a good man with good skills. He also has the honor of siring the most handsome man in Qeynos. [Dren] is certainly quite an exceptional man.");	
	elseif(e.message:findi("dren")) then
		e.self:Say("Dren Ironforge is only the most eligible bachelor in Qeynos! Not only has he graced this city with his good looks and charm, he will someday inherit the Ironforge Estate. What a catch he would be!");
	elseif(e.message:findi("donation.* temple.* thunder") or e.message:findi("donate.* temple.* thunder")) then
		e.self:Say("I would love to donate to the Temple of Thunder, but I am afraid my husband is not fond of them. Meet me at Fish's at night and then I will have something to donate.");		
	end
end
