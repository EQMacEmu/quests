function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Church of Underfoot. Please open your soul to the greatness of Brell Serilis. May he guide you in all your future eavors. And may your soles long for the [Soil of Underfoot].");
	elseif(e.message:findi("soil")) then
		if(e.other:GetFactionValue(e.self) >= 450) then -- high amiable, allakhazam comments show 400 not high enough but 453 worked
			e.self:Say("I can trust you with the soil of Underfoot, but first you must obtain four portions of fairy dust. Return them to me and I shall mix it and pray over it. Then I shall give you a pouch of soil of Underfoot.");		
		else
			e.self:Say("The Clerics of Underfoot have yet to see your faith directed towards our wills. Perhaps you should assist Master Gunlok Jure in the crusade against the undead.");
		end
	elseif(e.message:findi("candle")) then
		e.self:Say("The Candle of Bravery is used for temple ceremonies here in Kaladim. When the candle burns out, I must venture to the frigid village of Halas far to the north of the continent of Antonica. There I will take the candlestick and the [soil of Underfoot] to Dok. He must create the candle in the very ornate candlestick.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I will need four portions of fairy dust to create the soil of Underfoot.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18765})) then
		e.self:Say("Welcome to the Underfoot Cathedral. I am High Priestess Ghalea. Here is your guild tunic. Now. let's get you started helping us spread the will of Brell.");
		e.other:Faction(e.self,227,100); -- Clerics of Underfoot
		e.other:Faction(e.self,274,100); -- Kazon Stormhammer
		e.other:Faction(e.self,293,75); -- Miners Guild 249
		e.other:QuestReward(e.self,0,0,0,0,13514,20); -- Item: Dusty Tunic*
	elseif(e.other:GetFactionValue(e.self) >= 450 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12106, item2 = 12106, item3 = 12106, item4 = 12106},1,text)) then  -- Fairy Dust need kindly as verified from live
		e.self:Say("May the mighty power of Brell saturate this soil with his divinity.  Here you are, my noble friend.  You may have a pouch of the soil of Underfoot.");
		-- verified live faction
		e.other:Faction(e.self,227,5); -- Clerics of Underfoot
		e.other:Faction(e.self,274,5); --Kazon Stormhammer
		e.other:Faction(e.self,293,3); --Miner's guild 249
		e.other:QuestReward(e.self,0,0,0,0,12282,1000); -- Soil of Underfoot
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
