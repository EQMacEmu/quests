function event_say(e)

	if(e.message:findi("hail")) then
		e.self:Say("Greetings!  Allow me to introduce myself.  I am Marshal Ghobber Truppack.  Marshal of the Great Wall Patrol.  Are you [new to the squad]?");
	elseif(e.message:findi("new to the squad")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- confirmed exact - Elroz
			e.self:Say("Great!!! We require more deputies in this squad. We are suffering great losses to the [new threat]. Welcome to the Great Wall Patrol where our motto is, 'United we shall defend.' It will be some time before you can earn your squad ring - first you must prove your strength in battle. Report to the squad leader. He is Deputy Budo. You can find him at the Great Wall of Serilis in the Misty Thicket. Go to him at once and tell him you are reporting for duty.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("You are in good standing with the Guardians of the Vale. Continue with your good work and then we may speak.");		
		else
			e.self:Say("How can you expect to just waltz into Guardian Stronghold and expect to gather information?! Consider yourself lucky I don't command the Guardian of the Vale deputies to show you the sharpness of their blades!");
		end
	elseif(e.message:findi("one with the wall")) then
		if(e.other:GetFactionValue(e.self) >= 1200) then
			e.other:Faction(e.self,263,-1000); -- Confirmed Live Faction Hit
			e.self:Say("Yes!! Welcome, Deputy " .. e.other:GetCleanName() .. "! You are now an elite member of the Great Wall Division. Wear this ring with pride. You may take it to Hendi Mrubble of the Clerics of Mischief for healing at any time. Wear it with pride.");
			e.other:SummonCursorItem(13936); -- Item: Squad Ring
		elseif(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("You are in good standing with the Guardians of the Vale. Continue with your good work and then we may speak.");		
		else
			e.self:Say("How can you expect to just waltz into Guardian Stronghold and expect to gather information?! Consider yourself lucky I don't command the Guardian of the Vale deputies to show you the sharpness of their blades!");
		end
	elseif(e.message:findi("new threat")) then
		e.self:Say("The new threat I refer to is the community of goblins which was found beyond the Great Wall of Serilis. They are called Clan Runnyeye. They have begun to sneak over the wall. The deputies have reported seeing them launch themselves up the wall in a matter of seconds using ornate grappling hooks. We have attempted to obtain one of these devices for further inspection, but we have yet to find one on any of the dead goblins. If you should ever find one, be sure to bring it to me immediately.");
	elseif(e.message:findi("freeport")) then
		e.self:Say("You can find Freeport beyond Kithicor Forest on the other side of the Commonlands.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:rivervale  ID:19060 -- Marshal_Ghobber 
