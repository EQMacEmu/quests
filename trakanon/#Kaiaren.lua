--Quest for Trakanon's Teeth - Kaiaren (True): Monk Epic 1.0
function event_spawn(e)
	eq.set_timer("1",3600000); --Depop in 1 hour
end

function event_say(e)
	if(e.other:HasItem(1689)) then
		if(e.message:findi("lheao")) then
			e.self:Say("Hmmm, never heard of him. Well, it doesn't matter, the book is here now. Curse that idiot for writing it in the first place. Not even sure why I let him stick around. If you ever see that clown monk Aradiel kick him in the shins for me! At any rate, I suppose you'd like to find the Fists and [have a nice chat with them], eh? Their master owes me much. I would reward you well if you were to bring me proof of the master's defeat.");
		elseif(e.message:findi("have a nice chat with them")) then
			e.self:Say("Yes, I suppose you would. All you children looking for fame and glory will eventually learn the poison of ambition. But how will you find them? They are able to meld with their elements seamlessly and they certainly have no interest in fooling with the likes of you. No, you will need to get their attention. Fortunately, I know [how you can do this].");
		elseif(e.message:findi("how can i do this")) then
			e.self:Say("My guess is that the weakest of the Fists will be the easiest to draw out. He is egotistical and arrogant. How he came to master the Discipline of Fire, I do not know. He will most likely be in another form, one of his element. When you find the one you believe to be the Fist, you must challenge him. If you use his true name, Eejag, in your formal challenge, he will respond. A flame can burn intensely but it cannot last for long. Know this when you battle him.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1683},0)) then --Celestial Fists (Book)
		e.self:Say("Now, then. Where did you find this, monk? This is not just some light reading to be borrowed from the town library. Who gave this to you?");
		e.other:QuestReward(e.self,0,0,0,0,1689); --Book of Celestial Fists
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1684},0)) then --Charred Scale
		e.self:Say("Ahhh, impressive indeed! Now that you have broken the chain of the Fists, the others may come toppling down if you persevere. The Fist of Air is now the weakest, then Earth, and finally Water before the master of them all, Vorash. You must defeat them in order, proving the demise of the last to draw out the one you are after. The task before you now is to take this scale and show it to the Fist of Air wherever he may be. Good luck.");
		e.other:QuestReward(e.self,0,0,0,0,1684); --Charred Scale
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1688, item2 = 1689})) then --Demon Fangs and Book of Celestial Fists
		e.self:Emote("bows his head and breathes a long sigh as if relived of a great weight. He then looks up at you and says, 'I honestly did not believe you could have defeated Vorash. Even though he sought nothing but war and bloodshed, it is a life nonetheless and we must mourn him. I will sew these fangs into magical fist wraps and they shall be yours. Remember Xenevorash. A purpose can be found for every situation and individual. To achieve perfection is to perceive this truth.'");
		e.other:QuestReward(e.self,0,0,0,0,10652); --Celestial Fists (Epic)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.depop();
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
