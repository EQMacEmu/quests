function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("Aye, hello there, friend! How are ye on this fine day? A beautiful day to be alive, I must say! Anyway, I just got into Freeport last month. Wow, is this city big! Way bigger than humble little Rivervale. That's where I'm from. I'm working on setting up my own little business here, Falia's Foot Combs and Footwear, it'll be called. But, I don't have anything to sell yet, so check back in a couple of weeks. Safe travels to ye, friend.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18925})) then
		e.self:Say("Heh, that good for nothing fool. I've been here for over a month already, and I haven't seen him yet. Bah, anyway, could you take this back to him for me? It was our grandfather's lucky necklace. He passed it down to our father, and now onto my brother. Knowing that little worm, Grenny, he'll probably trade it for a mug of ale. Oh well, thanks for delivering the letter, friend. Good day to you, and safe travels.");
		e.other:QuestReward(e.self,0,0,0,0,13159,500); -- Item: Broken Heirloom Necklace
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
