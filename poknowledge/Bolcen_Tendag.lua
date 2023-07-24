--Willamina's Needles
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("coughs and says. 'Hello traveler.  Allow me to introduce myself. I am Bolcen. If you are looking for my master Xelrin. you may find him upstairs.  Careful should you stand too close to me however. I have become ill.'  He coughs again.");
	elseif(e.message:findi("needles")) then
		e.self:Say("I feel just terrible that I haven't been to see Willamina yet. Due to my illness I barely have the energy to stand. If you could aid me in some way, I would greatly appreciate it. Mirao Frostpouch might have an elixir that would help me feel better. Please seek him out and ask for it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28091})) then--Curative Potion
		e.self:Say("Oh thank you so much.' He drinks from the bottle, then reaches in his pocket and produces a set of needles. 'I believe this is what Willamina is in need of. Please take these to her and give her my best.");
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,0,0,0,28092,100);--New Sewing Needles
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
