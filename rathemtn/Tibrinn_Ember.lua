function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am Tibrinn Ember, forest friend and Unkempt Druid. Aid us in our [conflict] against the polluters of nature and I will reward you.");
	elseif(e.message:findi("conflict")) then
		e.self:Say("Grazhak the Berzerker is a powerful orc who roams these mountains. Slay him and bring me his Mithril Plated Girth. The gorge tyrant himself, King Xorbb, has plagued my halfling brothers for ages. Dispatch this beast and bring me his Slime Crystal Staff as proof of your deed. After you have brought me these items I will give you a weapon as reward for your feats.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "Impressive, do you have the rest?";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4310, item2 = 6335},1,text1)) then
		e.self:Say("You are now a respected ally of the Unkempt. Wield this with pride.");
		e.other:Faction(e.self,324,20,0); -- Unkempt Druids
		e.other:Faction(e.self,262,-5,0); -- Guards of Qeynos	
		e.other:Faction(e.self,272,-15,0); -- Jaggedpine Treefolk
		e.other:Faction(e.self,343,10,0); -- QRG Protected Animals	
		e.other:QuestReward(e.self,0,0,0,0,6364,0); -- confirmed no xp on live
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:rathemtn  ID:50197 -- Tibrinn Ember
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------