function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What have we here?  Perhaps a future Ebon Strongbear?  A [member of the Steel Warriors]?  If the way of the warrior is not to your liking, might I suggest joining the League of Antonican Bards?  The only damage you might take there is a sore throat! HAHAHA!");
	elseif(e.message:findi("steel warrior")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("A warrior, you say?  I have never met you.  You must be from the [bunker] or perhaps just a new recruit.  You should test your skills with Brin Stolunger.  When you have done that, then, maybe you could [assist] me.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then					
			e.self:Say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
		else
			e.self:Say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!!");
		end
	elseif(e.message:findi("assist")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("So, you think you be of assistance to me? Let me test your skill. Travel to Erudin and seek out the beasts which are called Kobolds. I have never seen one and would very much like to have four Kobold Hides with which to make a rug. To do so would earn you some barely used rawhide armor - maybe even a shield.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then					
			e.self:Say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
		else
			e.self:Say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!!");
		end
	elseif(e.message:findi("dangerous task")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("A ship sank while returning from Odus. On this ship was my squire, Tombor. He sank to the bottom and there he still lies. With him went a map. I would very much like you to search for this sunken ship. Return the map to me. I am sure it is still in the rotting hands of Tombor.");							
		elseif(e.other:GetFactionValue(e.self) >= 0) then					
			e.self:Say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
		else
			e.self:Say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!!");
		end
	elseif(e.message:findi("bunker")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Far to the eastern coast of Antonica lies the great trade city of Freeport.  It is there that our second chapter of Steel Warriors has built the arena called the bunker.");		
		elseif(e.other:GetFactionValue(e.self) >= 0) then					
			e.self:Say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
		else
			e.self:Say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I believe I stated that I need four kobold hides to make a rug.";

	if(e.other:GetFaction(e.self) <= 4 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13423})) then -- requires amiably
		e.self:Say("The map!! It is all blurred. The ink has run. I shall never be able to decipher it now. Still, I owe you for completion of your mission. May these be of assistance. It is always good for a warrior to be well supplied.");
		-- Confirmed Live Faction
		e.other:Faction(e.self,311,5,0); -- Faction: Steel Warriors
		e.other:Faction(e.self,262,1,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,230,-1,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(e.self,330,-1,0); -- Faction: The Freeport Militia
		e.other:Faction(e.self,281,1,0); -- Faction: Knights of Truth
		e.other:QuestReward(e.self,math.random(10),math.random(5),0,0,eq.ChooseRandom(5082,9001,5024),5000);
	elseif(e.other:GetFaction(e.self) <= 4 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13424, item2 =13424, item3 = 13424,item4 = 13424},1,text)) then
		e.self:Say("Incredible!! Such grand tones. It shall make a fine rug. You have shown me that you cannot always judge a book by its cover. You are quite skilled. Would you like to perform a [dangerous task] for me?");
		-- Confirmed Live Faction
		e.other:Faction(e.self,311,20,0); -- Faction: Steel Warriors
		e.other:Faction(e.self,262,4,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,230,-3,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(e.self,330,-3,0); -- Faction: The Freeport Militia
		e.other:Faction(e.self,281,4,0); -- Faction: Knights of Truth
		e.other:QuestReward(e.self,math.random(10),math.random(5),0,0,eq.ChooseRandom(2140,2147,9002),5000); -- Item(s): Raw-hide Tunic (2140), Raw-hide Leggings (2147), Round Shield (9002)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1098 -- Tabure_Ahendle
