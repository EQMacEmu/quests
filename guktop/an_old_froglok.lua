function event_say(e)
	if(e.other:GetFaction(e.self) < 3) then -- need warmly
		if(e.message:findi("hail")) then
			e.self:Say("Frroooaaaaaakkkk!");
		elseif(e.message:findi("mask")) then
			e.self:Say("Frroooaaaaaakkkk! Speciaaal maaask I maaake for sneaky types! Lost long ago! Baaad frogs taaake! I too old to maaake more! Frroooaaaaaakkkk! Maaagic aaalmost used up! So cold! You help me! I help you!");
		elseif(e.message:findi("help")) then
			e.self:Say("Frroooaaaaaakkkk! So cold! You bring me waaarm velium mastodon fur cloaaak! I need supplies! You bring me maaana juice! You bring me elf essence! You bring me sturdy froglock crown those naaasty big frogs stole! Frroooaaaaaakkkk! I maaake you something nice! So cold! You bring me all those things, don't forget cloaaak!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFaction(e.self) < 3 and item_lib.check_turn_in(e.self, e.trade, {item1 = 11275},0)) then
		e.self:Emote("flips and says, 'Frroooaaaaaakkkk! I'm in this book! You see me! Owww that flip hurt my old bones! Frroooaaaaaakkkk! Look there is a picture of my maaask from long ago! Frroooaaaaaakkkk! I keep book!  You taaake this recipe!  Maaaybe more!  I'm in book! Frroooaaaaaakkkk!'");
		e.other:Faction(e.self,251,1); -- Froglok of Guk
		e.other:QuestReward(e.self,0,0,0,0,18499,500);
	elseif(e.other:GetFaction(e.self) < 3 and item_lib.check_turn_in(e.self, e.trade, {item1 = 11274,item2 = 11276,item3 = 10254,item4 = 26999})) then
		e.self:Say("Frroooaaaaaakkkk!!! This cloaaak so waaarm! Here let me work! Frroooaaaaaakkkk!' The old froglok goes to work on the crown and after uttering a few froaks, a small cloud of smoke rises from the crown. You reach over and pick it up. 'Frroooaaaaaakkkk! Maaagic haaat! Taaake good care of it aaand staay away from baaad frogs! Frroooaaaaaakkkk!");
		e.other:Faction(e.self,251,10); -- Froglok of Guk
		e.other:QuestReward(e.self,0,0,0,0,11277,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
