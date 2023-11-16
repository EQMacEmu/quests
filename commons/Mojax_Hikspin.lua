function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi. How are you? The fish are biting pretty good. That is what Skipynn tells me. I sure wish I had a different [job]. If I did, I could fish all day long.");
	elseif(e.message:findi("job")) then
		e.self:Say("I am a messenger for [Antonius Bayle], ruler of the great city of [Qeynos].");
	elseif(e.message:findi("qeynos")) then
		e.self:Say("Huh?! Have you been living in a cave? The great city of Qeynos is the mightiest nation in Antonica! You'd best journey toward the west and visit the city whose influence stretches beyond the horizons.");
	elseif(e.message:findi("hall of truth")) then
		e.self:Say("I have been expecting you. I am very parched. Could you please get me a bottle of milk? Once you do that will show you where I hid the note.");
	elseif(e.message:findi("antonius bayle")) then
		e.self:Say("How can it be that you do not know of Antonius Bayle? Was it not he who named this great continent of Antonica? Is it not he who rules over the most powerful city on Norrath? Surely you jest!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local milk = item_lib.count_handed_item(e.self, e.trade, {13087});
	
	if(not e.self:IsMoving() and milk > 0) then
		repeat
			e.self:Say("Aaahhhh. Now that is refreshing. Just let me rest for a bit. The note is safe and sound in my bedroll inside the inn.");
			e.other:Faction(e.self,281,1); -- Faction: Knights of Truth
			e.other:Faction(e.self,271,-1); -- Faction: Dismal Rage
			e.other:Faction(e.self,330,-1); -- Faction: The Freeport Militia
			e.other:Faction(e.self,311,1); -- Faction: Steel Warriors
			e.other:Faction(e.self,362,1); -- Faction: Priests of Marr
			e.other:QuestReward(e.self,0,0,0,0,0,50);
			milk = milk - 1;
		until milk == 0;

		eq.unique_spawn(21136,8,0,2720,-520,-51,0); -- NPC: Duggin_Scumber
		if (e.self:GetGrid() == 0) then
			eq.start(eq.ChooseRandom(9,10));
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if((e.self:GetGrid() == 9 and e.wp == 22) or (e.self:GetGrid() == 10 and e.wp == 46)) then
		e.self:Say("Here you are.  I hid it in this box behind the marker.  Take it to Eastyana of the Temple of Marr. Goodbye.");
		eq.create_ground_object(18822,3641,-520,-51,0,300000);
	end
end
