function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What do you want?  Can't you see that I wish to be alone?!  I have no need nor desire to speak with anyone.  I have a minor dilemma to ponder and the only person I wish to speak with is the [captain].");
	elseif(e.message:findi("captain")) then
		e.self:Say("If you have to ask that, you should not be in this fine establishment.");
	elseif(e.message:findi("danaria sent me")) then
		e.self:Say("If you are working for Danaria, you have been misguided. You will go back to her empty handed. Now leave. The [captain] and I have some business to discuss.");
	elseif(e.message:findi("portrait")) then
		e.self:Say("You have the portrait! Give it to me... <Hic!> Danaria will not get it...");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Mmmm...  more...  must... drown... sorrow...";

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13817,item2 = 13817,item3 = 13817,item4 = 13817},1,text)) then -- 4x Capt. Orlin's Spiced Ale
		e.self:Say("Ahh... I... <Hic!> Need help... <Hic!>  You... take this... Go build... boat beacon. <Hic!>  Ask gnomes about... <Hic!> boat beacon. They know how... Then bring back... <Hic!> Unnnhh! Prexus help me! I will never drink again.");		
		-- Confirmed live Faction
		e.other:Faction(e.self,231,2,0); -- Craftkeepers
		e.other:Faction(e.self,266,1,0); -- High Council of Erudin
		e.other:Faction(e.self,265,-1,0); -- Heretics
		e.other:Faction(e.self,267,1,0); -- High Guard of Erudin		
		e.other:QuestReward(e.self,0,0,0,0,12145,100); -- Beacon Mount	
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13818})) then
		e.self:Say("Thanks.. That saved me a lot of money. Now I can spend more time with the captain before I give this back to Lenka Stoutheart. Here is a little so...mething.");
		-- Confirmed live Faction
		e.other:Faction(e.self,231,10,0); -- Craftkeepers
		e.other:Faction(e.self,266,1,0); -- High Council of Erudin
		e.other:Faction(e.self,267,1,0); -- High Guard of Erudin
		e.other:Faction(e.self,265,-1,0); -- Heretics
		e.other:QuestReward(e.self,0,0,0,1,0,20000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12146})) then
		e.self:Say("Wise decision!! Little reward for a large deed. Bye.");
		-- Confirmed live Faction
		e.other:Faction(e.self,231,5,0); -- Craftkeepers
		e.other:Faction(e.self,266,1,0); -- High Council of Erudin
		e.other:Faction(e.self,267,1,0); -- High Guard of Erudin
		e.other:Faction(e.self,265,-1,0); -- Heretics
		e.other:QuestReward(e.self,0,0,0,1,0,200);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freporte  ID:10112 -- Palatos_Kynarn



