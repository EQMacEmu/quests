function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Sorry. Nothing t' sell at this time. Maybe later. Good day.");
	elseif(e.message:findi("back to the closet")) then
		if(e.other:GetFactionValue(e.self) >= 200) then -- requires mid amiably	
			e.self:Say("Back to the closet?! I just got out. I would go back if I had a pair of oven mittens.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You're going to have to prove yourself a stronger aid to my masters, the Darkones.");
		else
			e.self:Say("I would like to assist you, but my masters say you are no friend of the Darkones and would rather see you dead.");
		end			
	end
end

function event_trade(e)
	local item_lib =require("items");
	
	if(e.other:GetFactionValue(e.self) >= 200 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12211})) then --Grobb Oven Mitts
		e.self:Say("Ahh! Oven mittens! Kinda' large, don't you think?! Oh well, now I can bake all I want without burning my hands. OKAY! Lets go. I overheard some basher named Nanrum saying he spotted my friend, the butcher. You should ask him [where the skeleton] is.");
		e.other:QuestReward(e.self,0,0,0,0,12213,25); --The Baker
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end