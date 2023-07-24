function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail to ye as well offlander. I bid you welcome to the Icy Mug, one o' the finest establishments for a drink in Thurgadin. Whether it's [souvenirs] or stories yer lookin for, you've come to the right place.");
	elseif(e.message:findi("souvenir")) then
		e.self:Say("Here at the Icy Mug we have our own signature stein fer yer drinkin pleasure. For only 5 gold pieces ye can take one home to show yer kinfolk.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {gold = 5}, 0)) then
		e.self:Say("Here ya go!");
		e.other:QuestReward(e.self,0,0,0,0,30145); -- The Icy Mug Souvenir Stein
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
