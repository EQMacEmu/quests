function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What are you doing here? Can't you see we're trying to get some rest. It's not easy trying to find [Gant's Remains].");
	elseif(e.message:findi("gant")) then
		e.self:Say("We're looking for Gant's Remains. We've heard that they can be found somewhere in the caves not to far from here. Though. it's not easy getting into those caves. Those dawnhoppers are a vicious bunch. Maybe you'd like to help us. If you can find Gant's Remains bring it back to me and you'll get a handsome reward."); 
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30173}, 0)) then
		e.self:Say("No way! You're telling me you were able to recover Gant's Remains?! Gant will finally be able to rest in peace now. Here take this.");
		e.other:QuestReward(e.self,0,0,0,0,29897,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
