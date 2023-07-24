function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! Please look through my fine wares. I have spent most of my life practicing my skills in tailoring. I do my best to compete with the other local merchants, but I have yet to make a profit. I pray to Tunare that my [banded orc vests] will finally bring me a few extra coins.");
	elseif(e.message:findi("banded orc vest")) then -- Requires Indifferent faction
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Glad you are interested. I can create a leather vest I call a banded orc vest. It will aid you in repelling any disease and offers quite a bit of protection in battle. I will need some materials. For a Deathfist banded orc vest, I require two legionnaire pads worn by the clan Deathfist, one Deathfist slashed belt, and ten gold coins. For a Crushbone banded orc vest, I require two legionnaire pads worn by the Clan Crushbone, one Crushbone belt, and one silk swatch.'");
		else
			e.self:Say("Your ways are considered vile to Faydark's Champions. Leave before my rage overcomes my restraint.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13319,item2 = 13319,item3 = 13318,item4 = 16482})) then
		e.self:Say("Grand doing business with you. Hold your nose. I can never get rid of the orc stench of the vests. That is why the other merchants do not pay me much for them."); 
		e.other:Faction(e.self,276,5); -- Kelethin Merchants
		e.other:Faction(e.self,246,1); -- Faydark champions
		e.other:Faction(e.self,326,1); -- Emerald Warriors
		e.other:Faction(e.self,5002,1); -- Anti-mage
		e.other:QuestReward(e.self,0,0,0,0,12187,100);
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13917,item2 = 13917,item3 = 13916,gold = 10})) then
		e.self:Say("Grand doing business with you. Hold your nose. I can never get rid of the orc stench of the vests. That is why the other merchants do not pay me much for them."); 
		e.other:Faction(e.self,276,5); -- Kelethin Merchants
		e.other:Faction(e.self,246,1); -- Faydark champions
		e.other:Faction(e.self,326,1); -- Emerald Warriors
		e.other:Faction(e.self,5002,1); -- Anti-mage
		e.other:QuestReward(e.self,0,0,0,0,12187,100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
