-- Enchanter epic weapon Staff of the Serpent lead-in quest

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day, I have discovered something truly wonderful! If I only had the materials required so I can copy my notes and send them to my teacher.");
	elseif(e.message:findi("discover")) then
		e.self:Say("I was researching a new spell, and discovered new information concerning the history of the Serpent.");
	elseif(e.message:findi("material")) then
		e.self:Say("The materials I need are a mechanical pen, ink of the dark, and white paper. Bring me those and I will give you a copy of this information.");
	elseif(e.message:findi("teacher")) then
		e.self:Say("My teacher is Jeb Lumsed. He was last seen in the regions of the newly discovered lands of Kunark. If you wish to find him that is where you must seek him out.");
	elseif(e.message:findi("ink of the dark")) then
		e.self:Say("Dark illusions, thievery, and the plague of the living will guide you. These are the only hints I can provide. Safe travels and may you be protected from all maladies.");
	elseif(e.message:findi("mechanical pen")) then
		e.self:Say("The answer you seek is in your question. If you are unable to figure it out, then perhaps you are not ready to travel along this path.");
	elseif(e.message:findi("white paper")) then
		e.self:Say("It may seem like ordinary paper at first. However, this paper was enchanted by a friend of mine. This paper was given to a lass in the Karanas to help with her writings. The paper will guide her hands and draw forth the thoughts in her mind. I no longer have any and I have not had contact with my friend in some time. Search them out.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	--  check for ink of the dark, mechanical pen and white paper
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10600,item2 = 10601,item3 = 10602})) then
		e.self:Say("Yes, that is what I wanted. Here, take these notes. My teacher will be very interested if he is shown what I have found.");
		e.other:Faction(e.self,404,100); -- Faction: True Spirit
		e.other:QuestReward(e.self,0,0,0,0,10603,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--  EOF Zone: erudnext ID: 24013 NPC: Stofo_Olan
