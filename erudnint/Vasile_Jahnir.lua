-- The Power of the Gatecallers
-- Rungupp

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings!  You seek knowledge of our ways. You shall find knowledge and you shall offer knowledge you have been taught.  What is the power of the Gatecallers?");
	elseif(e.message:findi("slight problem") or e.message:findi("summoning")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
			if(e.message:findi("slight problem")) then
				e.self:Say("We have heard rumor of an troll who has taken residence within the forest of Toxxulia. During your travels in Toxxulia, we command you to keep a watchful eye out for the beast. Slay it on sight and return its head to me. To do so will earn you the spell Fire Flux or Burn, whichever may be available at the time.");
			elseif(e.message:findi("summoning")) then
				e.self:Say("Yes. We are the true summoners of Norrath. We are the power supreme. You will learn more and we shall test you. You will go forth and learn the art of summoning. Let your first test be to master the summoning of the dagger and of food. Return to me two summoned daggers and two of the food source you learn to call forth. Do so, and I shall give you the gloves of the Gatecaller.");
			end	
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("A foe of the Gatecallers you are not, but you must do more to earn our respect and trust.");
		else
			e.self:Say("You dare to approach any of the Gatecallers! You have summoned forth my rage! Leave at once!");
		end			
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Your proof lies in TWO summoned daggers and two summoned loaves of black bread.";

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13078,item2 = 13078,item3 = 7305,item4 = 7305},1,text)) then -- requires amiably, 2x summoned bread, 2x summoned daggers
		e.self:Say("You have mastered these spells quickly. You shall now wear the gloves of the Gatecaller. Cumbersome they may feel, but they protect the hands of a young magician. In your young days of magic they will protect you from harm. They are not valued much by merchants, but they are prized by other circles. Nevertheless, we offer them only to our young Gatecallers. You may now be of assistance with a [slight problem].");
		-- Confirmed Live Factions
		e.other:Faction(e.self,254,5); --faction with Gate Callers increased
		e.other:Faction(e.self,266,1); --faction with High Council of Erudin increased
		e.other:Faction(e.self,267,1); --faction with High Guards of Erudin increased
		e.other:Faction(e.self,265,-1); --faction with Heretics decreased
		e.other:QuestReward(e.self,0,0,0,0,12209,175); -- Item: Gloves of the Gatecaller	
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13895})) then -- requires amiably, Rungupp
		e.self:Say("So the rumor shows true. Good work. You are an excellent student and a noble Erudite. Here is your spell as I promised. Go forth and fill your brain with knowledge.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,254,10); --faction with Gate Callers increased
		e.other:Faction(e.self,266,1); --faction with High Council of Erudin increased
		e.other:Faction(e.self,267,1); --faction with High Guards of Erudin increased
		e.other:Faction(e.self,265,-1); --faction with Heretics decreased
		e.other:QuestReward(e.self,0,0,math.random(20),0,15313,250); -- Item: Spell: Fire Flux
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:erudnint  ID:24073 -- Vasile_Jahnir 
