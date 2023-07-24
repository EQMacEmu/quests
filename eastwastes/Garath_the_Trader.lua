function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail to ya, Traveller, and well met! My Name's Garath, a warrior by trade, though I do dabble in some merchanting on the side. My exploring brought me here, and I saw some wonderous things. I ventured inside this ancient tomb with some friends, and oh! The horrors we encountered! I barely made it out alive, but I did manage to pick up some [weapons to trade].");
	elseif(e.message:findi("weapon")) then
		e.self:Say("Interested in a trade, are ya? Well, let me tell ya.. I headed into this tomb in hopes of getting a sword I could use, maybe a warhammer.. Humm, yeah a hammer woulda been good also.. Anyhow, I was unlucky in finding those, but I did manage to get a couple weapons... Sadly, they're really more suited to a [Monk] or a [Knight], not really much use to a warrior like myself at all.");
	elseif(e.message:findi("monk")) then
		e.self:Say("Ah, my eyes fail me lately.. Maybe the cold weather is getting to me? Well, in any case, I picked up some velium hand wraps inside the Tomb here, quite nice.. Yes indeed. I guess I would trade them to ya if you were to give me a warhammer for em. I gotta say, I'm not picky. I'd accept either a primal or a priceless warhammer, and give you these wraps in a straight trade. Heck, I'd take one of each and give you both these hand wraps.");
	elseif(e.message:findi("knight")) then
		e.self:Say("Knight? Yeah, I don't make much distinction, paladin or shadow knight, they're all knights to me. Well, look here, I got two swords from inside the tomb, but I'll be damned if either of em was suited for a warrior. Clearly a knight's blade, what bad luck for me. I was hopin for a good warsword. That's why I'm standin out here ya know? I was hopin I could find someone who might swap me either a primal or priceless warsword, and take one of these knightly swords in trade.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	-- Priceless Velium Battlehammer => Priceless Velium Fist Wraps
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 27301}, 0)) then
		e.self:Say("Ah, excellent! Guess standin out here in the cold proved worthwhile for me after all. You take that weapon and enjoy it, I know I`ll be getting some use of this one. Safe travel to ya, friend!");
		e.other:QuestReward(e.self,0,0,0,0,5833,1000);
	-- Primal Velium Battlehammer => Primal Velium Fist Wraps
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 27321}, 0)) then
		e.self:Say("Ah, excellent! Guess standin out here in the cold proved worthwhile for me after all. You take that weapon and enjoy it, I know I`ll be getting some use of this one. Safe travel to ya, friend!");
		e.other:QuestReward(e.self,0,0,0,0,27320,1000);
	-- Priceless Velium Warsword => Priceless Velium Knight's Sword
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 27300}, 0)) then
		e.self:Say("Ah, excellent! Guess standin out here in the cold proved worthwhile for me after all. You take that weapon and enjoy it, I know I`ll be getting some use of this one. Safe travel to ya, friend!");
		e.other:QuestReward(e.self,0,0,0,0,5834,1000);
	-- Primal Velium Warsword => Primal Velium Knight's Sword
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 27328}, 0)) then
		e.self:Say("Ah, excellent! Guess standin out here in the cold proved worthwhile for me after all. You take that weapon and enjoy it, I know I`ll be getting some use of this one. Safe travel to ya, friend!");
		e.other:QuestReward(e.self,0,0,0,0,5835,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
