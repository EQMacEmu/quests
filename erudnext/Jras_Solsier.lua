function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Temple of Divine Light.  We are the Peacekeepers. followers of Quellious.  If you are a paladin of this temple. you can assist us by showing a desire to [protect the peace].");
	elseif(e.message:findi("protect the peace") or e.message:findi("catch the poachers")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
			if(e.message:findi("protect the peace")) then
				e.self:Say("It was a fine decision. We are in need of your services.  It seems there is a disturbance in Toxxulia Forest.  There are poachers from other nations who have sought to cause turbulence among the creatures there.  Will you help us [catch the poachers] or are you skeptical about this mission?");
			elseif(e.message:findi("catch the poachers")) then		
				e.self:Say("The infidels are in Toxxulia Forest. They have begun hunting the kobolds. We have no love of the kobolds. but cannot allow the lands of Odus to be overrun by outsiders. The ways of tranquility are balanced with harmony. We will not allow chaos to take hold of our land.  Go and find these poachers. Bring me their heads!!");
			end
		elseif(e.other:GetFactionValue(e.self) >= 0) then
				e.self:Say("You have not done much to upset the Peacekeepers of this temple, but we must ask you to prove yourself to us before we may discuss things such as this.")
		else
				e.self:Say("Leave my sight at once! You are no friend to the Peacekeepers of the Temple of Divine Light.")
		end	
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13825})) then -- requires amiably, Poachers Head
		e.self:Say("You have served us well. The harmony of the forest shall be preserved. I have word that theses infidels were all working for one man. Find me evidence pertaining to this man. Surely one of these poachers has something which could aid in finding this man. We must stop him to stop the poachers. Go in peace.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,298,5,0); -- Faction: Peace Keepers
		e.other:Faction(e.self,266,1,0); -- Faction: High Council of Erudin
		e.other:Faction(e.self,265,-1,0); -- Faction: Heretics
		e.other:QuestReward(e.self,0,math.random(10),math.random(5),0,eq.ChooseRandom(10004,13003,10015,7009),3000); -- Item: Copper Band , Small Lantern, Malachite, Rusty Spear
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13913})) then -- requires amiably, Barbarian Head (Talym's Head) 
		e.self:Say("It is done! Quellious will look favorably upon our church and we will look favorably upon you. Go in peace.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,298,10,0); -- Faction: Peace Keepers
		e.other:Faction(e.self,266,2,0); -- Faction: High Council of Erudin
		e.other:Faction(e.self,265,-2,0); -- Faction: Heretics
		e.other:QuestReward(e.self,0,math.random(10),math.random(5),0,eq.ChooseRandom(15202,15011),5000); -- Item: Spell: Courage, Spell: Holy Armor
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98041 -- Jras_Solsier
