function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1093}, 0)) then
		e.self:Say("Thank you. I will return to the Dain and inform him that the battle is underway. Please escort Garadain to the battlefield and see that he returns safely. May Brell bless you and bring you victory over these beasts.");
		eq.depop_with_timer(116084);
		eq.depop_with_timer(116196);
		eq.depop_with_timer(116063);
		eq.depop_all(116007);
		eq.depop_all(116013);
		eq.depop_all(116197);
		eq.depop_all(116015);
		eq.depop_all(116571);
		eq.unique_spawn(116064,22,0,-390,-2713,181.5,19); -- NPC: #Garadain_Glacierbane
		eq.unique_spawn(116058,21,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
