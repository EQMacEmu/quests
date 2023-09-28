function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("You be tinking you be [real tuff Craknek]?");
	elseif(e.message:findi("real tuff craknek")) then
		if(e.other:GetFactionValue(e.self) >= 50) then
			e.self:Say("Me not tinking so. but maybe me wrongs.. no.. me neber wrongs.  You no tuff. only liddle Craknek is you.  You tink you be tuff Craknek. you bringed me four lizard meats.  Me like lizard meats.  You no tuff.  You bringed me lizard [meats].  I make you tuffer Craknek.  Me bestest Craknek.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("meats")) then
		e.self:Say("Yup, meats.  You brings me four, me gives you sumting.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFactionValue(e.self) >= 50 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13410, item2 = 13410, item3 = 13410, item4 = 13410})) then
		e.self:Say("No, I donut tink so. Who gived you? Bah, me most tuffest Craknek, but me no lier. Me help you be tuffer Craknek. Who gived you dese? Maybe you finded dead lizards, yes, dat it. Bah, taking dis and kills more tings. You learned much, com see me, I teaches you best Craknek ways. Keep eye on dem Greenbloods, dey nasty and not so tuff.");
		e.other:Faction(e.self,232,5); -- Faction: Craknek Warriors
		e.other:Faction(e.self,228,1); -- Faction: Clurg
		e.other:Faction(e.self,261,-1); -- Faction: Green Blood Knights
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(5025,5023),25); -- Rusty Two Handed Battle Axe, Rusty Two Handed Sword
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
