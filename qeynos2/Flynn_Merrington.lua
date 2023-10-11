function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("Oh look.. another gnoll pup. This bar is too rough for the likes of you. Why don't you try Fish's. We don't need any more regulars here, chump!");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("mira.* tax")) then
		e.self:Say("Ha! Yeah, I took their tax money. What are you going to do about it, little gnoll pup? Tell you want.. I will cut you a deal. You tell me you are a [gnoll loving weakling who isn't fit to comb my feet] and I will give you that merchant's tax money.");
	elseif(e.message:findi("gnoll loving weakling.* feet")) then
		e.other:Faction(e.self,223,-1); -- Faction: Circle of Unseen Hands
		e.self:Say("BWAH! HA HA HA! Did you all hear that?! " .. e.other:GetCleanName() .. " is a gnoll loving weakling who isn't fit to comb my feet! BWAH HA HA! MY FEET! HA HA HA! Oh.. too rich.. Heh.. HA HA HA! Oh.. Heh heh heh");
		e.other:SummonCursorItem(13174); -- Item: Sayers Tax Payment
		eq.signal(2083,6); -- NPC: Sabnie_Blagard
		eq.signal(2063,5); -- NPC: Crow
		eq.signal(2040,1); -- NPC: Moodoro_Finharn
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13122})) then
		e.self:Say("Well, now... That's cutting out the middle man. Thanks, chum! Now, beat it!");
		-- Confirmed Live Factions
		e.other:Faction(e.self,223,-20,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(e.self,291,3,0); -- Faction: Merchants of Qeynos
		e.other:Faction(e.self,230,-3,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(e.self,262,3,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,273,-2,0); -- Faction: Kane Bayle
		e.other:QuestReward(e.self,0,0,0,0,13123,20000); -- Item: Label of Erud's Tonic
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	e.self:Say("HA! You Erudites never could handle your liquor. Go feed the fish.");
	eq.signal(2040,1); -- NPC: Moodoro_Finharn
end
