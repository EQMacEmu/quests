
function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("It is about time I met up with someone who I can tolerate.  Most of the residents within these plains shun gnomes.  I will happy to leave if I could just find those [pesky skeletons].");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I do not trust you.  I have yet to hear of the great deeds you have done in the name of the Gemchoppers of Ak'Anon."); 		
		else
			e.self:Say("You are quite bold to approach a noble servant of Ak'Anon. The knowledge of your allegiance leaves you with no friend in Ak'Anon. Begone, whelp!"); 
		end
	elseif(e.message:findi("pesky skeletons")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("I was sent here by the Gemchoppers to seek out a pocketful of skeletons.  They are a creation of a one of Ak'Anon's exiled citizens.  He practiced the dark circle of magic and came to find the necromancers of Antonica.  He created and imported undead brownies to this realm.  We must find them to study them.  I can't seem to find them!!  If only I could find a [brave fighter] to assist me.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I do not trust you.  I have yet to hear of the great deeds you have done in the name of the Gemchoppers of Ak'Anon."); 		
		else
			e.self:Say("You are quite bold to approach a noble servant of Ak'Anon. The knowledge of your allegiance leaves you with no friend in Ak'Anon. Begone, whelp!"); 
		end
	elseif(e.message:findi("brave fighter")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Very good. Take this tin box.  Fill each slot with the remains of the tiny undead, should you find them here.  I know not how many there exists, but I am sure that if I return this full tin box shall suffice.  Be quick, I have other matters to to tend to.  I shall depart when next my sun dial points to eight.");
			e.other:SummonCursorItem(17986); -- Item: empty Tin Box
			e.other:Faction(e.self,255,-10,0); -- Gem Choppers, probably to prevent people from spawning a hundred
			eq.set_timer("spawns",10000);
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I do not trust you.  I have yet to hear of the great deeds you have done in the name of the Gemchoppers of Ak'Anon."); 		
		else
			e.self:Say("You are quite bold to approach a noble servant of Ak'Anon. The knowledge of your allegiance leaves you with no friend in Ak'Anon. Begone, whelp!"); 
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12376})) then -- guessing min faction
		e.self:Say("Good Work. Unfortunately, I must investigate other matters in the name of Ak'anon.  Here.  You deliver the tin box to Lord Jenork of the Gem Choppers.  He shall reward you. Be safe my friend.  I must go now. Farewell.");
		e.other:Faction(e.self,255,10,0); -- Gem Choppers
		e.other:Faction(e.self,288,2,0); -- Merchants of Ak'Anon
		e.other:Faction(e.self,333,2,0); -- King Ak'Anon
		e.other:Faction(e.self,238,-2,0); -- Dark Reflection
		e.other:Faction(e.self,1604,-1,0);  -- Clan Grikbar
		e.other:QuestReward(e.self,0,0,0,0,12378,10000); -- Give Undead Brownie Bones for turnin to Narron Jenork (Ak'Anon)
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if(e.timer == "spawns") then
		eq.spawn2(13120,4,0,-1839,829,18,0); -- NPC: a_tiny_skeleton 
		eq.spawn2(13120,4,0,-2149,10351,18,0); -- NPC: a_tiny_skeleton
		eq.spawn2(13120,4,0,-1713,1075,17,0); -- NPC: a_tiny_skeleton
		eq.spawn2(13120,4,0,-1690,363,-7,0); -- NPC: a_tiny_skeleton
		eq.spawn2(13120,4,0,-2604,222,-44,0); -- NPC: a_tiny_skeleton
		eq.stop_timer("spawns");
	end
end
