--Quest Name: Gammle's Display

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Good day " .. e.other:GetCleanName() .. ".  I don't mean to be curt but I have much work to do to be ready for my museum display, and there is not much time left. I expect many young warriors to be visiting here, but it is unfortunate that I do not have the final pieces I am [missing]. They would add to the collection greatly.");
	elseif(e.message:findi("missing")) then
		e.self:Say("If you would be willing to help me, I can make it worth your while. I need you to find a Minotaur Battle Axe, Goblin Two-Handed Sword, Chill Dagger, and an Ancient Sensate Shield. When you get these items, put them in a Collector's Box that you can get from [Merri], close it up and bring it to me.");
	elseif(e.message:findi("merri")) then
		e.self:Say("Curator Merri is the founder of the museum in the Selia district of New Tanaan. She is a true visionary and a wonderful person as well. It is her dream to turn life's love into something truly grand. She also carries with her the Collector's Boxes. If you need one, be sure to ask her for it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28079})) then
		e.self:Say("These will do. Please accept this as a show of my appreciation. Now if you'll excuse me I have much work left to do.");
		e.other:QuestReward(e.self,0,0,0,0,28243);
	end
end
