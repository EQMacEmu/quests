-- Crystal Caverns' Ancient Artifacts

function event_say(e)
	if(e.other:GetFaction(e.self) <= 3) then
		if(e.message:findi("hail")) then
			e.self:Say("Huh? Don't you know better than to interrupt a Coldain enjoying his ale? I may be a user of priestly magic but that doesnt mean I can't bash your head in.");
		elseif(e.message:findi("priestly magic")) then
			e.self:Say("Aye. An old one not much taken with idle chit chat.");
		elseif(e.message:findi("old one")) then
			e.self:Say("Very old, very wise, and on and on. You must have some point to bothering me. I'm not a merchant and I don't contract myself out for work. I've performed works for the Dain. There isn't much I haven't done..");
		elseif(e.message:findi("done")) then
			e.self:Emote("chuckles at you. 'If you want to impress me, and let me make certain you understand I doubt you can, then you can do what I never was able. For years I adventured and attempted to venture to the bottom of the Crystal Caverns in search of ancient artifacts from my people. Do that, show me that you have, and I will be impressed.'");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30269}, 0)) then -- Sceptre of the Coldain Ancients
		e.self:Emote("smirks at you. 'Hrm, you again eh? Did you come back to bother me with more...Wait a minute, let me see that. This is... This must be, yes it is. This is one of the ancient coldain priests sceptres of channeling. This is too good to be true. Haha! Oh, what I can do with this. Here, take this gem from the sceptre. If ancient lore proves right it will allow you to persuade beasts of many kinds.' He grins at you strangely and then leaves.");
		e.other:QuestReward(e.self,0,0,0,0,30270,25000); -- Gem of Persuasion
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30271}, 0)) then -- Bottle of Karsin Acid
		e.self:Emote("turns his head long enough for you to slip the contens of the karsin bottle into his mug. As he drinks heavily his face turns even more pale until he looks as if in pain. He rushes from the bar and as he does a trinket slips from his pocket.");
		e.other:QuestReward(e.self,0,0,0,0,30270,25000); -- Gem of Persuasion
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
