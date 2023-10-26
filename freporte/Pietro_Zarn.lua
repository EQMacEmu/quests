function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Who are you that you dare to speak with the great Pietro Zarn!! I see nothing more than a whelp in front of me. Innoruuk himself speaks with me. And now you expect me to waste words on you, a common. Begone " .. e.other:GetCleanName() .. " . You have nothing to peak my interest, only my rage.");
		else
			e.self:Say("Blasphemer!  You are no ally of the Dismal Rage.  Run while you still have legs!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18743})) then -- A tattered note
		e.self:Say("A new member to carry the rage of Innoruuk into the city and beyond. How wonderful. I must admit that you do not appear to carry the rage within. Hopefully you shall color the battlefields with the blood of many knights from the Hall of Truth. Here. Wear this tunic with pride. Once you are ready to begin your training please make sure that yo see Gunex Eklar, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:Faction(e.self,271,100,0); -- Dismal Rage
		e.other:Faction(e.self,281,-15,0); -- Knights of Truth
		e.other:Faction(e.self,296,20,0); -- Opal Dark Briar
		e.other:QuestReward(e.self,0,0,0,0,13561,20); -- Faded Crimson Tunic
	elseif(e.other:GetFactionValue(e.self) >= 250 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18825})) then -- Bayle List
		e.self:Say("You have proven yourself truly evil. Your hatred shall shine from this day forth. Innoruuk commands that I reward you with this. It is called Rage and it serves the powers of hate. Use it to smite the forces of good. Hail Innoruuk!");
		e.other:Faction(e.self,271,100,0); -- Dismal Rage
		e.other:Faction(e.self,281,-15,0); -- Knights of Truth
		e.other:Faction(e.self,296,20,0); -- Opal Dark Briar
		e.other:QuestReward(e.self,0,0,0,0,12153,100); -- Rage War Maul
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freporte  -- Pietro_Zarn
