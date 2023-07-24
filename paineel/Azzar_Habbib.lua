function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I'm not in any mood for conversation. My favorite hat was torn right from my head by a gigantic bat the other night and I am quite upset.");
	elseif(e.message:findi("other tasks")) then
		e.self:Say("I will sew you your own personal dreadful cap if you bring me the necessary components. I will need the pelt of a feared beast, some gold thread, and an imbued amber.");
	elseif(e.message:findi("hat")) then
		e.self:Say("It is a marvelous cap sewn from the finest textiles and imbued with the divine power of our lord of fear. Cazic Thule!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I must have all the necessary components to sew you a cap!";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1528})) then
		e.self:Emote("gasps in astonishment 'You...you..found my hat!! This is the most I can repay you but perhaps I can reward you further for some [other tasks]?'");
		e.other:Faction(e.self,265,5); -- Faction: Heretics
		e.other:Faction(e.self,231,-5); -- Faction: Craftkeepers
		e.other:Faction(e.self,233,-5); -- Faction: Crimson Hands
		e.other:Faction(e.self,242,-5); -- Faction: Deepwater Knights
		e.other:Faction(e.self,254,-5); -- Faction: Gate Callers
		e.other:QuestReward(e.self,0,0,0,0,1530,500); --black lace sash
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 19076, item2 = 12096, item3 = 22502},1,text)) then --Mighty Bear Paw's Belt Gold Thread and Imbued Amber
		e.self:Say("Here is your dreadful cap as I have promised."); 
		e.other:Faction(e.self,265,5); -- Faction: Heretics
		e.other:Faction(e.self,231,-5); -- Faction: Craftkeepers
		e.other:Faction(e.self,233,-5); -- Faction: Crimson Hands
		e.other:Faction(e.self,242,-5); -- Faction: Deepwater Knights
		e.other:Faction(e.self,254,-5); -- Faction: Gate Callers
		e.other:QuestReward(e.self,0,0,0,0,1529,500); --Dreadful Cap
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:paineel  ID:75009 -- Azzar_Habbib
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
