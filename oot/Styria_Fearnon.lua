function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to my island. I always welcome visitors, but I would prefer that your stay not last too long. My warriors are sometimes tempted by others. That is why they all wear purity belts. I should warn you, also, to be on the lookout for the [Pirates of Gunthak].");
	elseif(e.message:findi("pirates of gunthak")) then
		e.self:Say("The Pirates of Gunthak have been stranded on a nearby island. Their ship was sunk by some unknown water beast. They now attempt to take over this island and commandeer the first ship they encounter. I am looking for brave adventurers to hunt the rogues. Do you wish to hunt the pirates or are you waiting for the next ship?");
	elseif(e.message:findi("hunt the pirates")) then
		e.self:Say("Go and seek them out. They are on a nearby island. You will have to swim if you have no boat. Each pirate wears the pirate earring of the Pirates of Gunthak. I shall reward you for each earring you return to me. They have also stolen the Bracers of Erollisi from us. Their leader may have the pair. Return it to me and I shall be very appreciative.");
	elseif(e.message:findi("sentry xyrin")) then
		e.self:Say("What? Why are you so concerned for Sentry Xyrin? She returned to Freeport last night right before.. Oh!! Oh, dear!! Right before the storm hit. If she did not make it back to Freeport. I fear she has drowned or is shipwrecked upon one of the nearby islands!! You must find her!");
		eq.unique_spawn(69132,0,0,-7332,-612,1,90); -- NPC: Sentry_Xyrin
	elseif(e.message:findi("purity belt")) then
		e.self:Say("The purity belts were devised with the help of the dwarven smiths. Each warrior of the Sisterhood of Erollisi wears one. It keeps them from impure acts. Only I hold the key.")
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13337})) then -- Bracers of Erollisi 
		e.self:Say("Oh!! Thank you!! We are so grateful to you. I offer you this as reward. It is one of the dwarven smith's finest works.");
		-- confirmed live factions
		e.other:Faction(e.self,246,20,0); -- Faydarks Champoins
		e.other:Faction(e.self,279,5,0); -- King Tearis Thex
		e.other:Faction(e.self,310,5,0); -- Soldiers of Tunare
		e.other:Faction(e.self,226,5,0); -- Clerics of Tunare
		e.other:Faction(e.self,234,-5,0); -- Crushbone Orcs		
		e.other:QuestReward(e.self,0,math.random(5),math.random(5),0,eq.ChooseRandom(5007,5008,3101,3102,3103,3104,3105,3106,3107,3108,3109,3110,3111,3112),250); -- Axe, Broad Sword, All medium ringmail pieces
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13336})) then -- Pirate Earrings
		e.self:Say("Good work. That is one less pirate to worry about. We do not have much, but take this as payment.");
		-- confirmed live factions
		e.other:Faction(e.self,246,5,0); -- Faydarks Champoins
		e.other:Faction(e.self,279,1,0); -- King Tearis Thex
		e.other:Faction(e.self,310,1,0); -- Soldiers of Tunare
		e.other:Faction(e.self,226,1,0); -- Clerics of Tunare
		e.other:Faction(e.self,234,-1,0); -- Crushbone Orcs
		e.other:QuestReward(e.self,0,math.random(5),math.random(5),0,eq.ChooseRandom(13339,13342,7017,13340,13075),100); -- Item(s): Aviak Feather (13339), Conch Shell (13342), Fishing Spear (7017), Kiola Nut (13340), Shark Skin (13075)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
