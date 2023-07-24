--Willamina's Needles
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:DoAnim(60);
		e.self:Say("And good day to you, " .. e.other:GetCleanName() .. ". This great, wondrous city holds a seemingly endless supply of knowledge and power, attainable by all who walk our streets and seek it. In an effort to accommodate the travelers, scholars, and heroes alike that have ventured into our midst in this recent era. the citizens of New Tanaan have individually offered their own unique knowledge in almost every area significant to travelers of all professions. As a former chemist and knowing that not all of Norrath's great minds have the time or the patience to brew arcane potions. I have taken the liberty to craft some from my memory. Those that you will find in my inventory are the ones I felt would best suit our visitors.");
	elseif(e.message:findi("have come for the elixir")) then
		e.self:Say("That poor lad, he's always catching ill this time of year. Unfortunately I am out of the medicine he needs right now. Perhaps if you could obtain the key ingredient I am missing, I could brew up a batch for you to take to him. I have heard Cador recently came into possession of some black lava powder. If you can convince him to give you some, bring it to me right away!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28090})) then--Black Lava Powder
		e.self:Emote("takes the powder and quickly dashes it into a boiling cauldron. He then stirs it and pours the concoction into a small bottle. 'Here you go, this should make poor Bolcen feel much better. Hurry now, he's waiting.");
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,0,0,0,28091,100);--Curative Potion
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
