function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met, " .. e.other:GetCleanName() .. ". My name is Lashun Novashine and I am a humble priest of [Rodcet Nife], the Prime Healer. I wish to spread His word to every corner of Norrath. My job gets more difficult each day with so many so willing to take lives rather than preserve them.");
	elseif(e.message:findi("rodcet nife") or e.message:findi("prime healer")) then
		e.self:Say("Rodcet Nife is the Prime Healer. It is He who protects the health and well-being of the people of Norrath. The Temple of Life in North Qeynos is dedicated to His glory. I am but one of His loyal clerics who seek to cure all disease and heal all wounds.");
	elseif(e.message:findi("heal") or e.message:findi("cure")) then
		e.self:Say("Rodcet wills us to cure and heal all who seek it. But He asks that you pay a price in return. I can cure diseases with a small donation of 2 gold pieces. I can also heal your wounds, but as proof of your desire to rid Norrath of the evil of Bertoxxulous and as an offering to the Prime Healer, you must bring me 2 bone chips from the undead that roam these hills.");
	elseif(e.message:findi("bertoxxulous") or e.message:findi("bloodsabers")) then
		e.self:Say("Bertoxxulous is the fiend who rules the Plane of Disease. His followers are the Temple of Life's greatest foes. We believe a sect of his disciples known as the Bloodsabers are at this moment planning to make Qeynos a breeding ground for all sorts of terrible plagues.");
	elseif(e.message:findi("temple") or e.message:findi("life")) then
		e.self:Say("The lost shall find salvation in the Temple of Life! Follow me if you wish. I was just on my way back there.");	-- TODO Travel to Ironforge House
		eq.move_to(0,0,4,0,false);
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 13 or e.wp == 14 or e.wp == 15) then
		e.self:Shout("Cease this endless conflict and seek salvation in the Temple of Life! The glory of Rodcet Nife awaits you!");
	elseif(e.wp == 57) then
		e.self:Say("Greetings, people of Qeynos! Are you lost? Has the chaotic life of an adventurer left you empty and alone? Seek redemption in the glorious light of the Prime Healer. Only through Rodcet Nife and the Temple of Life will you find true health and salvation.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- experience reward verified through live data
	
	if(item_lib.check_turn_in(e.self, e.trade, {gold = 2}, 0)) then
		e.self:Say("Thank you for the donation to the Temple of Life. May Rodcet Nife cleanse your body of all ills.");
		e.self:CastSpell(213,e.other:GetID()); -- Cure Disease
		-- Confirmed Live Factions
		e.other:Faction(e.self,341,1,0); -- Priests of Life
		e.other:Faction(e.self,280,1,0); -- Knights of Thunder
		e.other:Faction(e.self,262,1,0); -- Guards of Qeynos
		e.other:Faction(e.self,221,-1,0); -- Bloodsabers
		e.other:Faction(e.self,219,1,0);		-- Antonius Bayle
		e.other:QuestReward(e.self,0,0,0,0,0,1);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13073,item2 = 13073,item3 = 13073,item4 = 13073}, 0)) then -- 4 Bone Chips
		local times = 2
		repeat
			e.self:Say("Very well, young one. May the light of the Prime Healer wash away your scars.");
			e.self:CastSpell(200,e.other:GetID()); -- Minor Healing
			-- Confirmed Live Factions
			e.other:Faction(e.self,341,1,0); -- Priests of Life
			e.other:Faction(e.self,280,1,0); -- Knights of Thunder
			e.other:Faction(e.self,262,1,0); -- Guards of Qeynos
			e.other:Faction(e.self,221,-1,0); -- Bloodsabers
			e.other:Faction(e.self,219,1,0);		-- Antonius Bayle
			e.other:QuestReward(e.self,0,0,0,0,0,100);
			times = times - 1
		until times <= 0			
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13073,item2 = 13073}, 0)) then
		e.self:Say("Very well, young one. May the light of the Prime Healer wash away your scars."); -- 2 Bone Chips
		e.self:CastSpell(200,e.other:GetID()); -- Minor Healing
		-- Confirmed Live Factions
		e.other:Faction(e.self,341,1,0); -- Priests of Life
		e.other:Faction(e.self,280,1,0); -- Knights of Thunder
		e.other:Faction(e.self,262,1,0); -- Guards of Qeynos
		e.other:Faction(e.self,221,-1,0); -- Bloodsabers
		e.other:Faction(e.self,219,1,0);		-- Antonius Bayle
		e.other:QuestReward(e.self,0,0,0,0,0,100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
