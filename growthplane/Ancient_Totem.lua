function event_say(e)
	if(e.other:GetLevel() >= 55) then
		if(e.message:findi("hail")) then
			e.self:Say("Greetings, my friend. It is not often that we see strangers coming to this plane. I fear that our growing infestation problem has kept us busy as of late. The time for battle grows near yet we still do not have the offensive magics necessary to fend off our enemies.");
		elseif(e.message:findi("magic")) then
			e.self:Say("There are legends describing scrolls of ultimate power and enlightenment from fallen channelers that preserver the knowledge necessary for us to overcome our plight. Since these are just legends I cannot assure you that these scrolls exist, but at this point they are our only hope.");
		elseif(e.message:findi("scroll")) then
			e.self:Say("The ancient scrolls needed to complete the Tome that will aid us are found in Dragon Necropolis if the legends are true. The tome itself was made up of the incantations and the teachings of the great Lel`Farthok who was a mighty channeler for his time.");
		elseif(e.message:findi("hope")) then
			e.self:Say("Our hope is that sometime soon these scrolls will be discovered by a hero. Are you that hero, " .. e.other:GetCleanName() .. "?");
		elseif(e.message:findi("hero")) then
			e.self:Say("The difficutly of this task will test you to your limits. Go seek the ancient scrolls within the confines of the Dragon Necropolis.  When you have retrieved all four of them, return them to me immediately.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31440,item2 = 31442,item3 = 31441,item4 = 31439}) and e.other:GetLevel() >= 55) then
		e.self:Say("Thank you, friend.  These scrolls will serve us well in the future.  Please take this as a sign of my gratitude."); -- Text made up
		e.other:QuestReward(e.self,0,0,0,0,1324,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end