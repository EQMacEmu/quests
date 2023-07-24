--Champion of the Vah Shir
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("speaks to you without opening her eyes or disturbing her meditations, 'Greetings to you. I, like others before me, have dedicated my life to protecting the animals that roam these lands. The blight of poachers and others that would profit from their destruction has overrun their peaceful way of life. You may also serve this noble cause, speak with Sentry Ferin in the field. No doubt there is plenty to be done.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30856, item2 = 30853, item3 = 30853, item4 = 30853})) then --The Champion's Cape, 3x Drop of Loda Kai Blood
		e.self:Say("You are indeed a friend to us and have earned a place of high honor among our people and our four-legged cousins. Wear this robe with pride and none will ever doubt your conviction for the honor of the felidae.");
		e.other:Faction(e.self,1513, 15);--Guardians of Shar Vahl faction
		e.other:QuestReward(e.self,0,0,0,0,30857); --Blessed Champion's Cape
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
