function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Why, hello there!!  What is a powerful adventurer such as yourself doing in a dive like this?  I hope it is buying little ol' me a drink...?");
	elseif(e.message:findi("donation.* temple.* thunder") or e.message:findi("donate.* temple.* thunder")) then
		e.self:Say("Yes, yes, yes.  We will talk about donations, but first, how about [offering a lonely woman a drink]?");
	elseif(e.message:findi("offer.* drink") or e.message:findi("Ogre Swill")) then		
		e.self:Say("I would love a drink. I prefer Ogre Swill. Just don't [ask what my sign is] or call me [beautiful].");
	elseif(e.message:findi("sign") or e.message:findi("beautiful")) then				
		e.self:Say("How original. Why don't you take a long walk off the short Qeynos Pier?");
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
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Mmmm. Ahh... <Burp!> That was delicious. How about another?";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13038,item2= 13038,item3 = 13038,item4 = 13038},1,text)) then		
		e.self:Say("Mmmm... <Burp!>  Thank you. Here is a little dona... <Hic!> dona... <Hic!> mmmoney for your generosity.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,291,1); -- Merchants of Qeynos
		e.other:Faction(e.self,223,-1); -- Circle Of Unseen Hands
		e.other:Faction(e.self,219,1); 	-- Antonius Bayle
		e.other:Faction(e.self,229,1); 	-- Coalition of Tradefolk
		e.other:Faction(e.self,262,1); -- Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,13291,500);	-- Donation (Lore #2)	
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
