-- Spirit Wracked Cord
function event_say(e)
	if(e.other:GetFaction(e.self) <= 1) then -- Only if you are ally with Sarnaks
		if(e.message:findi("hail")) then
			e.self:Say("Hail, minion! It is good to see a member of a lesser race striving to improve themself through service to the Dizok. We are feeling especially generous as of late, and if you would do us a [service], we shall reward you handsomely.");
		elseif(e.message:findi("service")) then
			e.self:Say("We are not sure you are worthy, but shall assign you this task in hopes you prove mighty enough to resolve it. Gather your broodlings about you, and journey to Charasis. There you shall find a Urn of spirits. We require this, as well as [additional components].");
		elseif(e.message:findi("additional components")) then
			e.self:Say("Very well, if you feel you are up to it, lead your broodlings to fallen Sebilis and return to us with a portion of undead dragon sinew. Bring us the Sinew, the Urn, and your Regal Band of Bathezid as proof of service, and a worthy reward shall be yours.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- 6477 spirit wracked urn
	-- 6478 undead dragon sinew
	-- 5727 regal band of bathezid
	if(e.other:GetFaction(e.self) <= 1 and item_lib.check_turn_in(e.self, e.trade, {item1 = 6477, item2 = 6478, item3 = 5727})) then
		e.self:Say("Amazing! You have returned the trophies I asked for, against impossible odds. Here is your reward, worthy minion, may it serve you well.");
		e.other:Faction(e.self,451,3); -- Faction: Brood of Di`Zok
		e.other:Faction(e.self,307,3)
		e.other:Faction(e.self,259,-1); -- Faction: Goblins of Mountain Death
		e.other:QuestReward(e.self,{items = {5723,5727}, exp = 100000}); -- 5723  Spirit Wracked Cord, final reward, 5727 We get Regal Band of Bathezid back
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
