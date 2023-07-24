-- part of seventh coldain prayer shawl

function event_say(e)
	if(e.message:findi("burin")) then
		e.self:Say("You'll need a fletching kit and a fair bit of skill for this one, " .. e.other:GetCleanName() .. ". Round up a tooth from a swordfish and attatch it to an Ulthork tusk wrapped in a Molkor hide.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1852}, 0)) then -- Item: Blank rune
		e.self:Say("Fine piece of work there, " .. e.other:GetCleanName() .. ", especially fer an outlander. Now yer gunna need to make a burin to etch the rune with. Once that's done ye need to kneel in front of the Grand Historian in the chapel and recite this prayer to him with total sincerity in yer heart. If yer plea be heard by our Father Brell he'll bless ya with the knowledge necessary to carry on. With that knowledge you'll take the blank rune, the burin and a fletching kit to etch the rune. Show Grimthor the etched rune and he'll guide you from there.");
		e.other:QuestReward(e.self,{items = {1852,18281}});
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
