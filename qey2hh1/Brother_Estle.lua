-- npc - Brother Estle
-- class - all
-- zone - West Karana
-- reward - Spell: Inspire Fear

function event_waypoint_arrive(e)
	if(e.wp == 1) then
		e.self:Say("I believe here is where I am to wait for the [blessed oil].");
	elseif(e.wp == 2 or e.wp == 5) then
		e.self:Say("Cleanse your souls, sinners! The way of life is found through the [Prime Healer]. Repent and join us!");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, child of life. The way of the [Prime Healer] shall set you free and cleanse your soul. I hope to see you at [mass].");
	elseif(e.message:findi("prime healer")) then
		e.self:Say("Rodcet Nife is the Prime Healer. His way is the path of healing and life. There can be no true life until your soul is healed by healing others. This will take you into the eternal when your time comes.");
	elseif(e.message:findi("mass")) then
		e.self:Say("Mass is not being held out here as yet. I am waiting for the [blessed oil] from the Temple of Life. You may attend services there.");
	elseif(e.message:findi("blessed oil")) then
		e.self:Say("The blessed oil is necessary during services. It is blessed by High Priestess Jahnda at the [Temple of Life]. If you are going in that direction, please stop at the temple and remind High Priestess Jahnda that brother Estle is waiting for his blessed oil.");
	elseif(e.message:findi("temple of life")) then
		e.self:Say("The Temple of Life is the center of worship for the followers of Rodcet Nife. It is located in North Qeynos and is one of the greatest temples ever created. Be sure to visit and attend services.");
	elseif(e.message:findi("hayle")) then
		e.self:Say("Brother Hayle is a great man.  He is known for never losing a convert.  He has been trying to convert the local gnolls in the Plains of Karana to the ways of the Prime Healer.  I fear he has not been successful.");		
	elseif(e.message:findi("chintle")) then
		e.self:Say("Brother Chintle is my fellow cleric from the Temple of Life. A few of us were sent to the plains to help out the residents.");		
	elseif(e.message:findi("trintle")) then
		e.self:Say("Brother Trintle is my fellow disciple. He is best known for his mission to aid the beggars living in the sewers of Qeynos. He spent a month down there. He came back a new man. He is quite an extraordinary young cleric.");		
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13910})) then
		e.self:Say("Thank you. Now I may cleanse the bodies of the new converts and help them enter into a new life. I also have this. It was given to me by a dying gnoll of all things. They belong to Brother Hayle. The gnoll's last words were 'Free him.' Make sure High Priestess Jahnda gets this. Be swift!");
		--confirmed live factions and Experience
		e.other:Faction(e.self,341,15,0); -- Faction: Priests of Life
		e.other:Faction(e.self,280,4,0); -- Faction: Knights of Thunder
		e.other:Faction(e.self,262,7,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,221,-3,0); -- Faction: Bloodsabers
		e.other:Faction(e.self,219,2,0); -- Faction: Antonius Bayle
		e.other:QuestReward(e.self,{copper = math.random(10),silver = math.random(0,5),itemid = 13911,exp = 800}); -- Item: PrayerBeads
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
