function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day, " .. e.other:GetCleanName() .. ". If you're interested in serving the war effort you can begin by speaking with one of the scouts here in the outpost. If you'll excuse me, I must return to making plans.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if ( item_lib.check_turn_in(e.self, e.trade, {item1 = 4396}, 0) ) then -- Silver Medal of War
		e.self:Say("Just in time, ".. e.other:GetCleanName() ..". I have finished plans for an attack deep in enemy territory. I have had scouts gather information on two newly constructed grimling camps. These grunts need to be taught that they will not be allowed to spread across the surface of this world unchecked! Take these plans and study them. Keep them confidential. When you have gathered an army of at least two dozen loyal soldiers return the plans to me and we will begin.");
		e.other:QuestReward(e.self,0,0,0,0,5987); -- Vadrel's Plans
		
	elseif ( item_lib.check_turn_in(e.self, e.trade, {item1 = 5987}, 0) ) then -- Vadrel's Plans
		e.self:Say("You know the drill by now, "..e.other:GetName()..". Order your people to make ready for war! Follow me.");
		e.other:QuestReward(e.self,0,0,0,0,0,50000);
		eq.unique_spawn(167701, 36, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #Veteran_Vadrel
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
