function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah.. Greetings.. I am Lu'Sun, Guild Master of the Silent Fist Clan. Here, our goal is to train our body, mind, and soul to the peak of perfection.");
	elseif(e.message:findi("tomer")) then
		e.self:Say("Tomer? I think Seta needs someone to go find him.. Go ask her.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18712})) then -- Note with Fist Insignia
		e.self:Say("Greetings, and welcome to the Silent Fist Clan. Don our guild tunic, purge your mind and soul, and begin your lifelong devotion to the Clan. Brother Esrinap will introduce you to our lifestyle and begin your training. Be sound, allow your spirit to open up and guide you.");
		e.other:Faction(e.self,309,100,0); -- Silent Fist Clan
		e.other:Faction(e.self,262,15,0); -- Guards of Qeynos
		e.other:Faction(e.self,361,15,0); -- Ashen Order
		e.other:QuestReward(e.self,0,0,0,0,13507,20); -- Torn Cloth Tunic*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos2  ID:2077 -- LuSun
