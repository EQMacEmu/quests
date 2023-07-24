function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome! Drink you shall, some of de finest drinks of da lands! [Flaming Pungla], I suggest to you. It all me sells.")
	elseif(e.message:findi("flaming pungla")) then
		e.self:Say("Greatest drink and Plunga's creation. Buy one you should. Dey so gud me gots da charge t'ree golds.")
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {gold = 3})) then
		e.self:Say("Bottoms up!")
		-- confirmed no faction hits
		e.other:QuestReward(e.self,0,0,0,0,13382) -- Flaming Pungla
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end 

function event_combat(e)

	if(e.joined) then
		e.self:Say("Guards! Guards!")
	end
end