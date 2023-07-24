
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetin's! Justice speaks through us. We're the followers o' the Tribunal. We act as judge. jury and executioner fer all misled Northmen. Sometimes we must also execute our swift justice upon evil races. such as th' [ice goblins].");
	elseif(e.message:findi("ice goblins")) then
		e.self:Say("The ice goblins are a weak race. They pose no threat to our community. but lately we've heard rumors of ice goblins that can cast spells. They're said to be as weak as the goblin warriors. so I seek to employ the talents of our young shamans to [hunt the goblin casters].");
	elseif(e.message:findi("hunt the goblin casters")) then
		if(e.other:GetFaction(e.self) < 5) then -- need amiably
			e.self:Say("Aye. ye'll serve justice. I must find the source o' their recent spellcasting ability. I hear reports o' glowing necklaces upon these wicked beasts' necks. Get me one o' these casters' necklaces. Return them in any condition at all. Go! Justice awaits yer return.");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("Ye're no criminal to the Shamans o' Justice, but ye've yet to prrove yer devotion to justice.")
		elseif(e.other:GetFaction(e.self) > 5) then		
			e.self:Say("The scales o' the Shamans o' Justice dinnae tip in yer favor. Ye'd best flee while ye still have the chance.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13968})) then -- requires amiably, Shattered Caster Beads
		e.self:Say("Shattered! This has happened frequently! These beads are very delicate. They're useless to me now, however, I'll reward ye fer the execution of yet more goblin casters. Continue yer work. The Tribunal watches ye!");
		-- Confirmed Live Factions
		e.other:Faction(e.self,327,10); 															--Shamen of Justice
		e.other:Faction(e.self,328,1); 															--Merchants of Halas
		e.other:Faction(e.self,223,-1); 															--Circle of Unseen Hands
		e.other:Faction(e.self,336,-1); 															--Coalition of Tradefolk Underground
		e.other:Faction(e.self,244,-2); 															--Ebon Mask		
		e.other:QuestReward(e.self,0,math.random(10),math.random(10),1,eq.ChooseRandom(15270,15275,15075,15271,15279,15212,15079,15050,15224,15036),1600); -- Spells: Drowsy, Frost Rift, Sicken, Fleting Fury, Spirit of Bear, Cure Blindness, Spirit Sight, Gate, Endure Fire, Summon Food
	elseif(e.other:GetFaction(e.self) < 5 and  item_lib.check_turn_in(e.self, e.trade, {item1 = 13969})) then	-- requires amiably, Caster Beads
		e.self:Say("Finally! Intact! This IS good news! I can continue me investigation now. As fer yer loyal deed, I'll offer ye this, the Gavel of Justice. May ye employ it well in the service o' justice.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,327,25); 															--Shamen of Justice
		e.other:Faction(e.self,328,3); 															--Merchants of Halas
		e.other:Faction(e.self,223,-3); 															--Circle of Unseen Hands
		e.other:Faction(e.self,336,-3); 															--Coalition of Tradefolk Underground
		e.other:Faction(e.self,244,-5); 															--Ebon Mask		
		e.other:QuestReward(e.self,0,math.random(10),math.random(10),math.random(0,2),6028,6400); --Gavel of Justice	
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
