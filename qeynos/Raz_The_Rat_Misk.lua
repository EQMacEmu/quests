function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -500) then -- requires dubious
			e.self:Say("Spare 3 gold so I can get a decent meal for once, master?");
		else
			e.self:Say("Beat it. You ain't part of the Circle.");
		end	
	elseif(e.message:findi("favor")) then
		if(e.other:GetFactionValue(e.self) >= -100) then -- requires apprehensive faction
			e.self:Say("I found this pouch and do not know whose it is. I would be more than willing to part with it for 5 gold, since the owner would probably reward you more.");
		else
			e.self:Say("Beat it. You ain't part of the Circle.");
		end			
	end
	
end

function event_trade(e)
	local item_lib =require("items");
	
	-- Confirmed Live Experience
	if(e.other:GetFactionValue(e.self) >= -100) then -- requires apprehensive faction
		if(item_lib.check_turn_in(e.self, e.trade, {gold = 5})) then
			e.self:Say("Very good, master! Best of luck in locating the proper owner. Maybe try giving it to ol' Crow in North Qeynos. Everyone knows if you need to fence.. er.. find something in Qeynos, Crow is your man. He always seems to know who's missing what. I am off to get some food.");
			-- Confirmed Live Faction		
			e.other:Faction(e.self,223,2,0); -- Faction: Circle of Unseen Hands
			e.other:Faction(e.self,291,-1,0); -- Faction: Merchants of Qeynos
			e.other:Faction(e.self,230,1,0); -- Faction: Corrupt Qeynos Guards
			e.other:Faction(e.self,262,-1,0); -- Faction: Guards of Qeynos
			e.other:Faction(e.self,273,1,0); -- Faction: Kane Bayle
			e.other:QuestReward(e.self,0,0,0,0,17600);
		elseif(item_lib.check_turn_in(e.self, e.trade, {gold = 3})) then
			e.self:Say("Thank you, kind master. I don't wish to trouble you further but I do have another [favor] to ask..");
			-- Confirmed Live Faction
			e.other:Faction(e.self,223,1,0); -- Faction: Circle of Unseen Hands
			e.other:Faction(e.self,291,-1,0); -- Faction: Merchants of Qeynos
			e.other:Faction(e.self,230,1,0); -- Faction: Corrupt Qeynos Guards
			e.other:Faction(e.self,262,-1,0); -- Faction: Guards of Qeynos
			e.other:Faction(e.self,273,1,0); -- Faction: Kane Bayle
			e.other:QuestReward(e.self,0,0,0,0,0,1);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
