--#############
--#Quest Name:The Fishslayers
--#Author:Shaznito
--#NPCs Involved:Fiddy Bobick, Marshall Lanena
--#Items Involved:Bag of Piranha Teeth, Piranha Bag, Piranha Tooth
--#################

function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("Hello. " .. e.other:GetCleanName() .. ".  I am Lanena Wickystick, marshal of all Vale concerns.  If there are any troubles brewing in our fine town which concern the Guardians of the Vale, please inform me.  You must be a [new deputy] or are you an [outsider]?");
	elseif(e.message:findi("new deputy")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- confirmed exact - Elroz
			e.self:Say("It is good to see such fine stock in the ranks of the Guardians.  Being new, there is much to learn, in battle and in life itself.  If you are not presently obligated, we have need of you here in the hollow.  There seems to be a [small problem].");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You are in good standing with the Guardians of the Vale. Continue with your good work and then we may speak.")
		else
			e.self:Say("How can you expect to just waltz into Guardian Stronghold and expect to gather information?! Consider yourself lucky I don't command the Guardian of the Vale deputies to show you the sharpness of their blades!");
		end
	elseif(e.message:findi("outsider")) then
		e.self:Say("Well, then!! You should not be in here.  This place is restricted to all outsiders.  You will leave at once!  Thank you and good day.");
	elseif(e.message:findi("small problem")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("For months, Fiddy Bobick has petitioned the marshals to assist him with a problem he has.  With the addition of new deputies such as yourself, we can now give him the assistance he requires.  Just go down to Bobick's shop near the lake.  Tell him I sent you.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You are in good standing with the Guardians of the Vale. Continue with your good work and then we may speak.")
		else
			e.self:Say("How can you expect to just waltz into Guardian Stronghold and expect to gather information?! Consider yourself lucky I don't command the Guardian of the Vale deputies to show you the sharpness of their blades!");
		end
	elseif(e.message:findi("rantho rapier")) then
		e.self:Say("The Rantho Rapier was crafted by the great blacksmith Rantho Goobler.  It was designed for use by the warriors of the wee folk.  With its light weight and special two-hand hilt, it becomes a formidable weapon in the hands of our younger deputies.  Only a [new deputy] has the right to earn one.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13929})) then
		e.self:Say("What was I thinking?!! Piranha are coming downstream and eating our supply of fish! We have never had a problem like this!!  Where are these little beasts coming from?  For now we must collect more. Take this bag. Collect enough teeth to fill the bag. Don't worry, if it takes a while I shall reward you with the [Rantho Rapier].  We will need to examine the teeth.");
		e.other:Faction(e.self,263,2); -- Faction: Guardians of the Vale
		e.other:Faction(e.self,286,1); -- Faction: Mayor Gubbin
		e.other:Faction(e.self,355,1); -- Faction: Storm Reapers
		e.other:Faction(e.self,292,1); -- Faction: Merchants of Rivervale
		e.other:Faction(e.self,334,-1); -- Faction: Dreadguard Outer
		e.other:QuestReward(e.self,0,math.random(5),0,0,17968,200); -- Item: Piranha Bag
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12155})) then
		e.self:Say("Fine work. We shall continue to study these and shall determine if we need to seek the source.");
		e.other:Faction(e.self,263,10); -- Faction: Guardians of the Vale
		e.other:Faction(e.self,286,1); -- Faction: Mayor Gubbin
		e.other:Faction(e.self,355,1); -- Faction: Storm Reapers
		e.other:Faction(e.self,292,1); -- Faction: Merchants of Rivervale
		e.other:Faction(e.self,334,-1); -- Faction: Dreadguard Outer
		e.other:QuestReward(e.self,0,math.random(5),0,0,5423,200); -- Item: Rantho Rapier
	elseif(e.other:GetFactionValue(e.self) >= 0) then
		e.self:Say("You are in good standing with the Guardians of the Vale. Continue with your good work and then we may speak.")
	else
		e.self:Say("How can you expect to just waltz into Guardian Stronghold and expect to gather information?! Consider yourself lucky I don't command the Guardian of the Vale deputies to show you the sharpness of their blades!");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:rivervale  ID:19061 -- Marshal_Lanena
