function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Correct. Toxdil is my name. No last name. I swear allegiance to no house nor guild. What brings you down here? Perhaps you seek my [deadly liquid], perhaps not. Whatever your reasons, I warn you to keep an eye out for the militia. They have begun to patrol the sewers.");
	elseif(e.message:findi("deadly liquid")) then
		e.self:Say("The deadly liquid I offer to rogues is called snake venom. I will be glad to make it for you, but first you must supply me with two snake venom sacs and my fee of 20 gold pieces. You may find the sacs upon the giant snakes of the Commonlands.");
	elseif(e.message:findi("gem of righteousness")) then
		e.self:Say("That gem is worthless!! If you want it, you can have it. Oh, but I forgot! I sold it to some gem merchant. I can't seem to remember her name, but she paid highly for it. Ha!! Imagine that. Worthless hunk of crystal. Do not bother looking for it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I require two snake venom sacs and my fee of 20 gold coins before I shall create the snake venom."

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12353})) then
		e.self:Say("The gem!! I would notice it's sparkle anywhere!! I cannot believe you are handing it back to me!! What a fool. Here you are fool. You can have this worthless key now.");
		e.other:QuestReward(e.self,0,0,0,0,12351,15000); -- A Tiny Key
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14017,item2 = 14017,gold = 20}, 1, text)) then
		e.self:Say("Here is your snake venom. May you... shall we say... apply it to good use.");
		e.other:QuestReward(e.self,0,0,0,0,14016,100); -- Snake Venom
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
