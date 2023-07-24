function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh, I uh... err, hello there. Umm, thank Brelll you're here, those bloody Kromrif were going to torture me! Yes, yes, and you've saved me! How can I ever repay you?");
	elseif(e.message:findi("murdrick")) then
		e.self:Emote("looks away and stammers, Ehh, ahh, Mur who?");
	elseif(e.message:findi("berradin")) then
		e.self:Emote("goes even paler than usual, Hmm, Berradin you say? Sorry, but I've never even heard the name.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18171}, 0)) then
		e.other:QuestReward(e.self,0,0,0,0,0,5000);
		PeffinCampFire(e);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function PeffinCampFire(e)
	eq.unique_spawn(116038,0,0,3413,-1742,143,194); -- NPC: #Peffin_Ambersnow
	eq.spawn2(116040,0,0,3411,-1768,155,194); -- NPC: #Kromrif_Elite
	eq.spawn2(116040,0,0,3382,-1754,155,194); -- NPC: #Kromrif_Elite
	eq.spawn2(116040,0,0,3383,-1740,155,194); -- NPC: #Kromrif_Elite
	eq.spawn2(116040,0,0,3382,-1719,155,194); -- NPC: #Kromrif_Elite
	eq.spawn2(116040,0,0,3410,-1710,155,194); -- NPC: #Kromrif_Elite
	-- hut spawn
	eq.spawn2(116182,0,0,3323,-1557,173,47); -- NPC: Kromrif_Elite
	eq.spawn2(116182,0,0,3370,-1564,173,34); -- NPC: Kromrif_Elite
	eq.spawn2(116182,0,0,3375,-1616,173,23); -- NPC: Kromrif_Elite
end