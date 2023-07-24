--Quest for Trakanon's Teeth - Kaiaren (Mad): Monk Epic 1.0
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("AHHH get it away from me go away .. leave me alone");
	elseif(e.message:findi("celestial fists")) then
		e.self:Say("Eh? What's that? Bah! That was destroyed long ago. Don't waste my time with fairy taAAAAAGGHHH GET IT AWAY!!!! HELP!!! They're all over MEHEHEHEHEEEEEEee!!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1683},0)) then --Celestial Fists
		e.self:Emote("eyes open wide and he attacks you!");
		e.other:QuestReward(e.self,0,0,0,0,1683); -- Celestial Fists
		eq.attack(e.other:GetName());
		eq.unique_spawn(95040,0,0,2470,306,-339,0); --Kaiaren (True)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1684},0)) then --Charred Scale
		e.self:Say("Ahhh, impressive indeed! Now that you have broken the chain of the Fists, the others may come toppling down if you persevere. The Fist of Air is now the weakest, then Earth, and finally Water before the master of them all, Vorash. You must defeat them in order, proving the demise of the last to draw out the one you are after. The task before you now is to take this scale and show it to the Fist of Air wherever he may be. Good luck.");
		e.other:QuestReward(e.self,0,0,0,0,1684); --Charred Scale
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1688, item2 = 1689})) then --Demon Fangs and Book of Celestial Fists
		e.self:Emote("bows his head and breathes a long sigh as if relived of a great weight. He then looks up at you and says, 'I honestly did not believe you could have defeated Vorash. Even though he sought nothing but war and bloodshed, it is a life nonetheless and we must mourn him. I will sew these fangs into magical fist wraps and they shall be yours. Remember Xenevorash. A purpose can be found for every situation and individual. To achieve perfection is to perceive this truth.'");
		e.other:QuestReward(e.self,0,0,0,0,10652); --Celestial Fists (Epic)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
	e.self:Say("Not bad.. Now lets see if you can find my trueform if you do we discuss this further.");
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
