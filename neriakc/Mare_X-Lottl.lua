function event_spawn(e)
	eq.set_timer("yoohoo",4200000);
end

function event_timer(e)
	e.self:Say("Yoohoo!");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, sweetie!!  How about letting me dance for you?  Two gold and I will do a little dance for you.");
	elseif(e.message:findi("tayla")) then
		e.self:Say("Why do you seek that little scamp when you have Mare right here? If you really want to know where she is, it will cost you. Did I ever tell you that my heart belongs to Jasper?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10020})) then --Jasper
		e.self:Say("Jasper! My one and only love! All right.. That Tayla creature was lost in a game of King's Court with a very important and secret merchant. Belyea will not speak of him but that he was some sort of Baron. He did give me this trinket from his new friend and owner of the half-elf scamp. You keep it. It is worth nothing compared to sweet, beautiful Jasper.");
		e.other:QuestReward(e.self,0,0,0,0,1096); --Klok's Seal
	elseif(item_lib.check_turn_in(e.self, e.trade, {gold = 2})) then 
		e.self:Say("Oooh, yes! I just love a patron with an overabundance of gold.");
		e.self:DoAnim(58); -- dance
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
