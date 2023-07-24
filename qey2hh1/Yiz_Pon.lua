-- Hollow Skull

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Argh... The [beasts] are on my tail. They will find me soon... I gave them the [skull] and still they pursue me!");
	elseif(e.message:findi("skull")) then
		e.self:Say("The skull of Wun Toque! I have found it. And have learned the location of its eyes! But now the [beasts] have it and I must flee...");
	elseif(e.message:findi("beasts")) then
		e.self:Say("Here... No time left... Take this please... My brother [Hyrill] is staying in [Freeport]. Please... Ugh... Must keep moving...");
		e.other:SummonCursorItem(18010); -- Item: Torn Parchment
		eq.unique_spawn(12005,0,0,-15467,1118,21,0):AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(12006),1);
		eq.set_timer("assassin",60000);
	elseif(e.message:findi("hyrill") or e.message:findi("freeport")) then
		e.self:Say("There is no time... must keep moving... ugh.");
	end
end

function event_timer(e)
	if(e.timer == "assassin") then
		eq.stop_timer("assassin");
		e.self:Say("Leave me be! I have friends all over the Commonlands who will avenge me!");
		eq.depop_with_timer();
	end
end

function event_combat(e)
	if(e.joined and eq.get_entity_list():IsMobSpawnedByNpcTypeID(12005)) then
		eq.get_entity_list():GetMobByNpcTypeID(12005):Say("You cannot escape the claws of Splitpaw!");
		e.self:Say("He has found me! Help meeeeeee!");
	end
end

-- END of FILE zone: ID:12167 -- Yiz_Pon.pl 