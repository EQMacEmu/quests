function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:GetCleanName() .. ". Please watch where you are stepping when you're out in the field.  Nothing is more frustrating than having some fine jumjum ruined by our own careless feet. That reminds me, [Deputy Tagil] still owes us for that jumjum he stomped on the other day!");
	elseif(e.message:findi("deputy tagil")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
			e.self:Say("Deputy Tagil is a fine young halfling who serves the vale well. But the other day, chasing that dirty Nillipuss, he trampled some fresh Jumjum.  He promised to make amends but it must have slipped his mind.  Please take this note to him as a friendly reminder.");
			e.other:SummonCursorItem(18013); -- Item: A Note 
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.")
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end		
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13240})) then
		e.self:Say("I knew that Deputy Tagil had simply forgotten. He really is a good young halfling. Here, take this as a small payment for your time.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,355,5,0); -- Faction: Storm Reapers
		e.other:Faction(e.self,286,1,0); -- Faction: Mayor Gubbin
		e.other:Faction(e.self,292,1,0); -- Faction: Merchants of Rivervale
		e.other:Faction(e.self,324,-1,0); -- Faction: Unkempt Druids
		e.other:QuestReward(e.self,math.random(10),math.random(3),0,0,eq.ChooseRandom(13977,13100,14014,13083),100); -- Item(s): Carrot (13977), Fishing Pole (13100), Potion of Wisdom (14014), Pine Needles (13083)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF Zone:rivervale  NPC:19053 -- Uner_Gnarltrunk
