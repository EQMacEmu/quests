function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Step right up! I am the best butcher you have ever seen. Well, are you the next to be fileted?");
	elseif(e.message:findi("back to the closet")) then
		if(e.other:GetFactionValue(e.self) >= 200) then -- requires mid amiably	
			e.self:Say("Darn! I was just starting to have fun. Tell you what, you find me a nice ogre butcher apron and I will gladly go back to my cramped quarters.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You're going to have to prove yourself a stronger aid to my masters, the Darkones.");
		else
			e.self:Say("I would like to assist you, but my masters say you are no friend of the Darkones and would rather see you dead.");
		end	
	end
end

function event_trade(e)
	local item_lib =require("items");
	
	if(e.other:GetFactionValue(e.self) >= 200 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12217})) then --Ogre Butcher Apron
		e.self:Say("Great! Thanks a lot, pal. Lets get moving. I hear my bonehead roomie called the Captain was spotted by Basher Sklama. Go ask [where the Captain] is.");
		e.other:QuestReward(e.self,0,0,0,0,12214,25); --The Butcher
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end