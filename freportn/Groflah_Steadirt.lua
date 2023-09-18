function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, adventurer! Certainly a person who looks as hardened as yourself deserves a fine blade to match your prowess. Here at Groflah's Forge, we supply you with only the finest quality weapons.");
	elseif(e.message:findi("ariska zimel")) then
		e.self:Say("Zimel!! I do not know who you mean. Now go away. I am very busy. I will not talk here!!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18820})) then
		e.self:Say("I am afraid I have some bad news, Steel Warrior. I had one of my workers take the raw blades out to be engraved by the Rivervale craftsmen. On his return, he was killed by the orcs in the Commonlands. The orcs now have the blades in their possession. I believe they have a camp nearby in the Commonlands. You may still be able to find all four blades within their camp and return them to Larn Brugal. Good Luck.");
		e.other:QuestReward(e.self,0,0,0,0,0,500);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13919})) then
		e.self:Say("I heard you were on your way back. Here then. Let us sharpen that blade for you. There you are. That should be much better in a fray now.");
		e.other:Faction(e.self,229,10); -- coalition of tradefolk
		e.other:Faction(e.self,281,10); -- knights of truth
		e.other:Faction(e.self,291,7); -- merchants of qeynos
		e.other:Faction(e.self,336,10); -- coalition of tradefolk underground
		e.other:QuestReward(e.self,0,0,0,0,5418,500); -- Groflar's Stoutbite
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18818})) then
		e.self:Say("Where did you find this? This was the main price list of Zimel's Blades, but it should be all burnt up. I was at Zimel's right after the fire and I did not see it hanging where it should have been. The entire inside was gutted and . . . wait . . . the sequence of the dots!! Hmmm. I cannot talk with you here. Meet me at the Seafarer's by the docks at night. Give me the note when next we meet.");
		e.other:QuestReward(e.self,{itemid = 18818}); -- Item: A tattered flier
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
