function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Avast, matey! Captain Bones here. This here island is mine! Raise anchor and ship out!");
	elseif(e.message:findi("captain")) then
		if(e.other:GetFactionValue(e.self) >= 200) then -- requires mid amiably	
			e.self:Say("I wish I could be leaving this isle of the damned, alas, me boat has gone to Prexus' locker. I'll not be leavin' here until I get meself another ship.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You're going to have to prove yourself a stronger aid to my masters, the Darkones.");
		else
			e.self:Say("I would like to assist you, but my masters say you are no friend of the Darkones and would rather see you dead.");
		end	
	end
end

function event_trade(e)
	local item_lib =require("items");
	
	if(e.other:GetFactionValue(e.self) >= 200 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12218})) then --Ship in a bottle
		e.self:Say("Aye, matey! Ye found me another vessel with which to sail the seven seas? Let's be shoving off then! Come on, hop aboard, swabby! Be sure to pick up the minstrel. His hide was last seen by Basher Avisk. Only he be knowin' [where the minstrel ] be.");
		e.other:QuestReward(e.self,0,0,0,0,12215,25); --The Captain
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

