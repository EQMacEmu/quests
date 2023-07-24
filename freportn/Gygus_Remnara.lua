function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The Temple of Marr welcomes you. I am Gygus Remnara. High Sentinel for the Sentries of Passion. We are the order of paladins within the Priests of Marr and whose charge it is to protect the holy Temple of Marr.");
	elseif(e.message:findi("heal")) then
		e.self:Say("It is not my duty to see to the wounded. You must seek out Plur Etinu. He is in here somewhere.");
	elseif(e.message:findi("honored member")) then
		if(e.other:GetFactionValue(e.self) >= 50) then
			e.self:Say("Yes.  The light of righteousness shines from within you.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer, but there is more work to do.");
		else
			e.self:Say("Leave my presence at once. Your ways of life are not acceptable to one who follows the Truthbringer.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18738})) then -- A tattered note
		e.self:Say("Welcome to the Sentries of Passion. We are the protectors of the Temple of Marr. Wear our tunic with pride, young knight! Find your wisdom within these walls and in the words of our priests. And remember to aid all who follow the twin deities, Mithaniel and Erollisi Marr.");
		e.other:Faction(e.self,362,100,0); -- Priests of Marr
		e.other:Faction(e.self,330,-10,0); -- The Freeport Militia
		e.other:Faction(e.self,281,15,0); -- Knight of Truth
		e.other:QuestReward(e.self,0,0,0,0,13556,20); -- White and Blue Tunic
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freportn  ID:8028 -- Gygus_Remnara
