function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("glares with eyes that seem to pierce through you like fiery daggers.  'Run while you can weakling!  My appetite grows stronger with the presence of your mortal scent!'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31754}, 0)) then
		e.self:Say("You've been sent by the Validus Custodus to question me!! You mortals are more foolish than I had presumed! The only information I have for you is the fact that you are about to face your death!!");
		e.other:QuestReward(e.self,0,0,0,0,31757); -- Third Badge of Service
		eq.attack(e.other:GetName());
		e.self:Emote("roars flashing glistening fangs that are sharper and longer than the average Vah Shirs!");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
	eq.unique_spawn(172187,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end