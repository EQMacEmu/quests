function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks up irritably. 'I do not have time to speak with thee. I have a problem on my hands. Feel free to speak with any of my trainers.'");
	elseif(e.message:findi("problem")) then
		e.self:Say("My problems are of no concern of yours, but if you must know it deals with Nolusia's brother. I can tell you no more. Leave me be.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18729})) then
		e.self:Say("Welcome to the Craft Keepers! You have much to learn, and I'm sure you are anxious to get started. Here's your training robe. Go see Nolusia, she'll give you your first lesson.");
		e.other:Faction(e.self,231,100,0); -- Craftkeepers
		e.other:Faction(e.self,266,10,0); -- High Council of Erudin
		e.other:Faction(e.self,265,-15,0); -- Heretics
		e.other:Faction(e.self,267,15,0); -- High Guard of Erudin
		e.other:QuestReward(e.self,0,0,0,0,13549,20); -- Item: Old Patched Robe*
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnint  ID:24032 -- Lanken_Rjarn
