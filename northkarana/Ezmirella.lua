-- Part of quest for Incandescent Wand
function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Welcome. I am Ezmirella.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6338, gold = 50})) then
		e.self:Say("I have blessed your silver wand.  To complete the enchantment, you must take the wand to Raine Beteria in the Erudin Library.  Tip her 50 golden coins, and she will help you.");
		e.other:QuestReward(e.self,0,0,0,0,6339,1000); -- Item: Blessed Silver Wand
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Quest by mystic414 / converted to lua by robregen
