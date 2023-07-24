function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:Race() .. ". You are welcome in [Kejek] so long as you do not offend the [spirits] of these lands.");
	elseif(e.message:findi("kejek")) then
		e.self:Say("This is Kejek, our village on the peak of Mt. Klaw. It is here that we continue to cherish the customs and beliefs of our ancestors, the Vah'Shir. Our location here in the Stonebrunt Mountains and the protection of the spirits allows us to escape the persecution and war that is waged between our yellow furred cousins and the Erudites.");
	elseif(e.message:findi("spirit")) then
		e.self:Say("There are spirits around us always, the spirits of our ancestors, and the spirits of the beasts that have past on beyond the mortal realms. It is through our devotions to these spirits that we shaman are granted our mystical powers. A few of the more powerful spirits are capable of becoming flesh once again and wander the wild serving as protectors and guides.");
	elseif(e.message:findi("jali sent me")) then
		e.self:Say("Ah yes Jali, whose wife is ill. I have been looking for a cure for many moons. I do believe I can make one now if I had the proper ingredients. Unfortunately it will require the deaths of some of our lands creatures but the spirits will not be angered as it is for a noble cause. Perhaps you could [fetch them] for me?");
	elseif(e.message:findi("fetch them")) then
		e.self:Say("Take this satchel and please listen closely. I need the following and they need to be relatively fresh. So dont waste time with frivolous strolls through the jungle. I require two Panda Claws, two Tiger Skins, two Asp Poison Sacs, a Bamboo Shoot, and a Kejekan Palm Fruit, which you will need to find somewhere in the jungle. Once you have these items, combine them in the bag and return to me.");
		e.other:SummonCursorItem(17884); -- Item: Burlap Satchel
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6975}, 0)) then
		e.self:Say("I thought the kobolds would have you for dinner, but you made it back.' Ayssla takes the satchel and begins to pour different vials of foul smelling liquid into it. She then takes the entire contents of the bag and dumps it into a large kettle and begins to chant in an unknown language. After a few minutes, she takes a small amount of the now boiling liquid and puts it in a vial. 'Take this vial back to Jali. I pray to the Titan Spirits that it works.");
		e.other:Faction(e.self,5011,5); -- Faction: Kejek Village
		e.other:Faction(e.self,298,1); -- Faction: Peace Keepers
		e.other:QuestReward(e.self,0,0,0,0,6976,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
