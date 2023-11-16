function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh, hi.  Listen, um.. " .. e.other:GetCleanName() .. ", was it?  Listen, pal.  I really don't have time for the friendly-friendly, so why don't you just move on?");
	elseif(e.message:findi("dishwasher")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Dishwasher, huh?  You must not mind getting your feet wet then, huh?  Well, I do have a job for you.  It seems one of our younger employees got a little nevous around a Deputy and ditched his um..  recent purchase into the river.  We sent the fool after it but ol' [Chomper] got him.  He said he had dropped it off the docks but the currents might have moved it from there.  It should be in an old pouch.  Return the merchandise to me.  Well?  Get going!");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.")
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end	
	elseif(e.message:findi("chomper")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
				e.self:Say("Chomper is a big, mean ol' fish.  He looks like a normal fish, but a little bigger, and boy, oh boy, is he mean!");		
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.")
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end	
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13785})) then -- requires amiably
		e.self:Say("What is this? The pouch is empty!  Where is the Ruby?! What do you mean you don't have it? Oh no. I bet [Chomper] swallowed it! Get it back and bring it to me.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,241,5,0); -- Faction: DeepPockets
		e.other:Faction(e.self,223,1,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(e.self,292,-1,0); -- Faction: Merchants of Rivervale
		e.other:Faction(e.self,336,1,0); -- Faction: Coalition of Tradefolk Underground
		e.other:Faction(e.self,329,1,0); -- Faction: Carson McCabe
		e.other:QuestReward(e.self,math.random(5),0,0,0,0,100);
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13786})) then -- requires amiably
		e.self:Say("You found it! Heh. Good thing you brought it back bub. This thing isn't priceless, its worthless but at least you proved you are loyal. Poor ol' Chomper..");
		-- Confirmed Live Factions
		e.other:Faction(e.self,241,10,0); -- Faction: DeepPockets
		e.other:Faction(e.self,223,1,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(e.self,292,-1,0); -- Faction: Merchants of Rivervale
		e.other:Faction(e.self,336,1,0); -- Faction: Coalition of Tradefolk Underground
		e.other:Faction(e.self,329,1,0); -- Faction: Carson McCabe
		e.other:QuestReward(e.self,math.random(5),0,0,0,0,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:rivervale  ID:19063 -- Toelia_Snuckery 
