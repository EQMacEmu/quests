function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ooooh, it you, " .. e.other:GetCleanName() .. ". Me's been waitin for you cuz our frenz say you comin an need da test. So's I gib you da test. Hmm, now where me put it? Ooglyn been waiting for sign for so long dat me forget where me put test. Keep your eyes out for sign while me look for test. Oh, hey, " .. e.other:GetCleanName() .. ", they gib you gem? I need dat gem, please, heheh.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1666})) then -- Part of Shaman Epic 1.0
		e.self:Say("Ahhh, tank you, now me can...OH LOOK!! DA SIGN!!!! Oh, sorry you missed it. The sign show you where to wait for da test. Follow me...I like you so I take you there. We goin for a swim, " .. e.other:GetCleanName() .. "!");
		e.other:Faction(e.self,404,100,0); -- Faction: True Spirit
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
		e.self:Say("Ok shaman, let us be off.");
		eq.start(4);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_waypoint_arrive(e)
	if(e.wp == 17) then
		e.self:Say("Ok, here is place for you to for waiting. Hab fun shaman!");
		eq.set_timer("depop",60000);
	end
end

function event_timer(e)
	eq.spawn2(98046,0,0,4196,-1586,-280,181); -- NPC: Srafen_the_Soaked
	eq.depop_with_timer();
end

-- Ooglyn
