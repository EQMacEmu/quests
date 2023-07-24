function event_trade(e)
local item_lib = require("items");
	if (item_lib.check_turn_in(e.self, e.trade, {item1 =  19661, item2 = 19612})) then
		e.self:Emote("fashions a grip out of the thorn drakeling scales then tests and polishes the blade of the machete. 'Yer another one of Megosh's trainees I suppose. This here's a fine weapon for a young Ranger of the Storm Reapers like yerself.'");
		e.other:Faction(e.self,292,5); -- Faction: Merchants of Rivervale
		e.other:Faction(e.self,241,1); -- Faction: DeepPockets
		e.other:Faction(e.self,263,1); -- Faction: Guardians of the Vale
		e.other:Faction(e.self,286,1); -- Faction: Mayor Gubbin
		e.other:Faction(e.self,336,-1); -- Faction: Coalition of Tradefolk Underground
		e.other:QuestReward(e.self,0,0,0,0,19687,10); -- Item: Storm Reaper Thorn Machete 
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 19663, item2 = 19616})) then
		e.self:Emote("fashions a grip out of the large fruit bat wing then tests and polishes the blade of the scimitar. 'Yer another one of Hibbs' trainees I suppose. This here's a fine weapon for a young Druid of the Storm Reapers like yerself.'");
		e.other:Faction(e.self,292,5); -- Faction: Merchants of Rivervale
		e.other:Faction(e.self,241,1); -- Faction: DeepPockets
		e.other:Faction(e.self,263,1); -- Faction: Guardians of the Vale
		e.other:Faction(e.self,286,1); -- Faction: Mayor Gubbin
		e.other:Faction(e.self,336,-1); -- Faction: Coalition of Tradefolk Underground
		e.other:QuestReward(e.self,0,0,0,0,19686,10); -- Item: Storm Reaper Initiate Scimitar
	elseif (item_lib.check_turn_in(e.self, e.trade,  {item1 = 19662, item2 = 13060})) then
		e.self:Emote("fashions a grip out of the large snake skin then tests and polishes the blade of the short sword. 'Yer another one of Kayas trainees I suppose. This here's a fine weapon for a young Paladin of the Storm Reapers like yerself.'");
		e.other:Faction(e.self,292,5); -- Faction: Merchants of Rivervale
		e.other:Faction(e.self,241,1); -- Faction: DeepPockets
		e.other:Faction(e.self,263,1); -- Faction: Guardians of the Vale
		e.other:Faction(e.self,286,1); -- Faction: Mayor Gubbin
		e.other:Faction(e.self,336,-1); -- Faction: Coalition of Tradefolk Underground
		e.other:QuestReward(e.self,0,0,0,0,19685,10); -- Item: Bravefoot Short Sword 
	else
		item_lib.return_items(e.self, e.other, e.trade);
	end
end


--Scripted By: Fatty Beerbelly and Krich11
