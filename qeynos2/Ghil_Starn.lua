function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I'm Ghil...  I used to run a small business before I hooked up with [Hanns]. Together, we muscled our competition out of Qeynos. But I'm getting too old for the rough stuff anymore, so I just lay low down here and peddle my goods. Anyway, I gotta get back to work and pack up this shipment for ol' [Denny-boy].");
	elseif(e.message:findi("den")) then
		if(e.other:GetFaction(e.self) <= 5) then -- requires indifferent faction
			e.self:Say("Den Magason works for ol' [Captain Rohand] down at the Qeynos docks. I need to find someone to take a [package] to him, so it can be shipped to Erudin.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("Hanns")) then
		if(e.other:GetFaction(e.self) <= 5) then -- requires indifferent faction
			e.self:Say("Hanns is one of the most ruthless cutthroats I've ever met...  Glad that I work for him, and not on the other side of his blade.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("captain rohand")) then
		e.self:Say("Captain Rohand runs the Mermaid's Lure and trades goods with the sea merchants from Odus.");
	elseif(e.message:findi("package")) then
		if(e.other:GetFaction(e.self) <= 5) then -- requires indifferent faction
			e.self:Say("I need someone to take this package to Den. He'll make sure it goes out on the next ship to Odus. I owe him a small favor, too.. So when you meet up with him, I need you to do whatever you can to help him out. Do a good job.");
			e.other:SummonCursorItem(13784); -- Package for Den
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(e.other:GetFaction(e.self) <= 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18796})) then
		e.self:Say("Ah, good job, " .. e.other:GetCleanName() .. ". It's good to know that I can trust you to get the job done. Here, take this for your efforts. This is a pair of gloves that we hand out to some of our more trusted members. Keep up the good work.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,223,100,0);		-- Circle of Unseen Hands
		e.other:Faction(e.self,291,-15,0); 	-- Merchants of Qeynos
		e.other:Faction(e.self,230,15,0); 		-- Corrupt Qeynos Guards
		e.other:Faction(e.self,262,-15,0); 	-- Guards of Qeynos
		e.other:Faction(e.self,273,10,0);		-- Kane Bayle
		e.other:QuestReward(e.self,0,0,0,0,1049,50000); -- Item: Brown Leather Gloves
	end
	item_lib.return_items(e.self, e.other, e.trade)
end


