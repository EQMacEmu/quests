function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I am Mrysila, custodian of the [Concordance of Research].");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("concordance of research")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The 'Concordance of Research' is an aid to those who follow the path of academia. It, and its sister books, 'Runes and Research,' volumes I and II, help those who are [interested] in researching spells.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("interested")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I have several copies of each book. If you want a copy of 'Runes and Research', volume I or II, bring me a lightstone and I will give you whichever book I have more of at the moment. Bring me a greater lightstone, and I will give you a copy of the 'Concordance of Research.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local gls = item_lib.count_handed_item(e.self, e.trade, {10400});
	local ls = item_lib.count_handed_item(e.self, e.trade, {10300});

	if(e.other:GetFactionValue(e.self) >= 0 and (ls > 0)) then -- Lightstone turn in, reward is either Runes and Research Volume I or II
		repeat
			e.self:Say("A lightstone? Thank you very much. Here is a copy of 'Runes and Research'.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(18175,18176),10000); -- Item(s): Runes and Research Volume I (18175), Runes and Research Volume II (18176)
			ls = ls - 1;
		until ls == 0
	end	

	if(e.other:GetFactionValue(e.self) >= 0 and (gls > 0)) then -- Greater Lightstone
		repeat
			e.self:Say("A greater lightstone? Thank you very much. Here is a 'Concordance of Research' for you.");
			e.other:QuestReward(e.self,0,0,0,0,17504,10000); -- Item: Concordance of Research
			gls = gls - 1;
		until gls == 0
	end	

	item_lib.return_items(e.self, e.other, e.trade)
end


--this npc had no dialogue until 2015ish, but the quest was always there