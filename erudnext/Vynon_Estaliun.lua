function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I welcome you to the temple of the Peacekeepers. The ways of peace and tranquility are ours to uphold. May you find a place among us. We have much work to do. If you are a paladin of this temple. you must [desire to face fear].");
	elseif(e.message:findi("desire to face fear")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
			e.self:Say("Very well. You shall face it. In Toxxulia Forest. you shall seek out Kerra Ridge. Once found. you will bring me the tail of a catfisher. Somehow. you shall find a way. They are weak. but they only work near the opposite side of the bridge. along the water's edge.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You have not done much to upset the Peacekeepers of this temple, but we must ask you to prove yourself to us before we may discuss things such as this.");
		else
			e.self:Say("Leave my sight at once! You are no friend to the Peacekeepers of the Temple of Divine Light.");
		end 
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13884})) then -- requires amiably
		e.self:Say("Good work. I knew you could do it. Take this as reward.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,298,5,0); -- Faction: Peace Keepers
		e.other:Faction(e.self,266,1,0); -- Faction: High Council of Erudin
		e.other:Faction(e.self,265,-1,0); -- Faction: Heretics
		e.other:QuestReward(e.self,math.random(10),0,0,0,eq.ChooseRandom(13002,13053),2000); -- Item: Torch, Brass Ring
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98043 -- Vynon_Estaliun
