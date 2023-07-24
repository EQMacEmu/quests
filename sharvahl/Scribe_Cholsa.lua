--  Rakshasa Skulls

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Things slip my mind easily these days. Are you here for something specific or are you a one of our new recruits?");
	elseif(e.message:findi("components")) then
		e.self:Say("The legends instruct that the ritual requires an Amulet of Golden Rays crafted by a worshiper of the sun, Charcoal that burns with a Black Flame, and the Brain of a creature that can Leech the Thoughts of others. If you manage to procure these items please take them with the instructions I have provided to Spiritualist Roleko at the Grimling Forest Outpost. The Rakshasa shall be summoned and slain there away from the citizens of Shar Vahl.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31849}, 0)) then  -- Rolekos Report of Occurrences
		e.self:Say("So it seems there is more truth to the legends of the Rakshasa than is commonly believed. I recall much of the tales of the wicked shaman who sold their souls and bodies to the dark spirits.  There is a ritual that must be performed to force the Rakshasa to fully materialize in our realm so that it may be slain. I will write down the instructions for the ritual but the [components] I'm afraid may be difficult to obtain.");
		e.other:Faction(e.self,1533,4); -- Dar Khura
		e.other:QuestReward(e.self,0,0,0,0,10915,500); -- Rakshasa Materialization Ritual
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
