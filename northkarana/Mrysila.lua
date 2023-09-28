--#############
--#Quest Name: Research Aid
--#Author: Blaz
--#Converted to Lua: robregen
--#NPCs Involved: 1
--#Items Involved: 3
--#################

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

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10300})) then -- Lightstone turn in, reward is either Runes and Research Volume I or II
		e.self:Say("A lightstone? Thank you very much. Here is a copy of 'Runes and Research'.");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(18175,18176),10000); -- Item(s): Runes and Research Volume I (18175), Runes and Research Volume II (18176)
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10400})) then -- Greater lightstone turn in, reward is Concordance of Research
		e.self:Say("A greater lightstone? Thank you very much. Here is a 'Concordance of Research' for you.");
		e.other:QuestReward(e.self,0,0,0,0,17504,10000); -- Item: Concordance of Research
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:northkarana  ID:13067 -- Mrysila