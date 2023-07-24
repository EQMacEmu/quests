function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Say("Shalom friend. My mate Kalaaro is the primary blacksmith of our village. I mostly create his tools, do touch ups and refurbishes, and maintain the [kejek forge].");
		else
			e.self:Say("You have done much to anger the spirits thus you are not accepted by our people.");
		end
	elseif(e.message:findi("kejek forge")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Say("Our forge has received the blessings of the Titan Spirits to burn with a supernatural flame! This flame has many beneficial properties but most importantly it can aid in freeing the spirits that have been imprisoned in materials by evil sorcerers.");
		else
			e.self:Say("You have done much to anger the spirits thus you are not accepted by our people.");
		end
	elseif(e.message:findi("purification process")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Say("The crystalline shadow must be purified in the kejek forge using a special hammer blessed by the Titan Spirits. I will craft a hammer for you to take to the Titans for their blessings if you bring me a Large Brick of High Quality Ore and an Oak Shaft. Once the hammer is blessed you may use it in the kejek forge to purify the crystalline shadow and transfer the spirits contained within it to a Soul Orb that must be taken to our village seer.");
		else
			e.self:Say("You have done much to anger the spirits thus you are not accepted by our people.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= -200 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10469,item2 = 10456})) then -- Large Brick of High Quality Ore, Oak Shaft
		e.self:Emote("takes the supplies and begins to work on the hammer. She works swiftly and efficiently then cools the finished hammer and hands it to you.");
		e.other:Faction(e.self,5011,2); -- Faction: Kejek Village
		e.other:Faction(e.self,298,1); -- Faction: Peace Keepers
		e.other:QuestReward(e.self,0,0,0,0,6981,5000); -- Kejekan Smithy Hammer
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
