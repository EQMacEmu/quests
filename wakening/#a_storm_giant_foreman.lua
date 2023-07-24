function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey there scrawny! I lead the finest team of laborers in all of Kael Drakkel! We've got little use for a weak creature like yourself, but if you want to help us out I've got a task for you.");
	elseif(e.message:findi("task")) then
		e.self:Say("Those pansy dragon would bees in the Tunarean Court have become quite the nuisance lately. The deaths of Lord Gossimerwind and Lord Prismwing would certainly put an end to the nuisance for a time. Bring me their wings as proof of their deaths.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 24870,item2 = 24871}, 0)) then -- a prismatic wing and a Gossamer Wing
		e.self:Say("You've done well. Maybe that foolish court will learn yet that the expansion of Kael cannot be impeded.");
		e.other:Faction(e.self,448,10); -- kromzek
		e.other:Faction(e.self,419,2); -- kromrif
		e.other:Faction(e.self,429,2); -- king tormax
		e.other:Faction(e.self,430,-5); -- CoV
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(24887,24889,24886,24885,24884),1000); -- Holgresh Mojo Sticks, Holgresh Grand Vizier Beads
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
