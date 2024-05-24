function event_waypoint_arrive(e)
	if(e.wp == 2) then
		e.self:SetRunning(true);
	elseif(e.wp == 3) then
		e.self:SetRunning(false);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, traveler! Have you need of provisions or perhaps other wares? I sell what I find upon the battlegrounds of the Commonlands.");
	elseif(e.message:findi("Where is your house")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Follow me.");
			eq.move_to(4791.06,-83.55,-51.47);
			eq.unique_spawn(22196, 0, 0, 4707.63, -105.49, -51.47); -- NPC: Squire_Narl
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer, but there is more work to do.");
		else
			e.self:Say("Leave my presence at once. Your ways of life are not acceptable to one who follows the Truthbringer.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18896})) then
		e.self:Say("You are the one they have sent? A squire?!! I hope you can help me. I gather items strewn upon the grounds of the Commonlands. I sell them at good prices. Lately, I have been terrorized by a human rogue named Narl. He will no doubt appear at my [house] soon. Bring his head to me.");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13867})) then
		e.self:Say("You have performed a great service to me, but I fear others will attack me while I stroll the countryside. It would be very noble of you to fetch me a cloth shirt for protection from wicked creatures. It is not much, but it will help.");
		e.other:Faction(e.self,281,5); -- Faction: Knights of Truth
		e.other:Faction(e.self,271,-1); -- Faction: Dismal Rage
		e.other:Faction(e.self,330,-1); -- Faction: The Freeport Militia
		e.other:Faction(e.self,362,1); -- Faction: Priests of Marr
		e.other:Faction(e.self,311,1); -- Faction: Steel Warriors
		e.other:QuestReward(e.self,math.random(10),0,0,0,0,500);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1004})) then
		e.self:Say("Thank you. You are very noble for a squire. I can see you becoming a very valuable asset to the Hall of Truth. Take this token. Tell Merko that you have [earned the Token of Generosity].");
		e.other:Faction(e.self,281,5); -- Faction: Knights of Truth
		e.other:Faction(e.self,271,-1); -- Faction: Dismal Rage
		e.other:Faction(e.self,330,-1); -- Faction: The Freeport Militia
		e.other:Faction(e.self,362,1); -- Faction: Priests of Marr
		e.other:Faction(e.self,311,1); -- Faction: Steel Warriors
		e.other:QuestReward(e.self,0,0,0,0,13865,500); -- Item: Token of Generosity
	end
end

-- END of FILE Zone:ecommons  ID:22058 -- Altunic_Jartin 
