function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ". If you are interested in helping the League of Antonican Bards by delivering some mail then you should talk to my wife, Eve.");
	elseif(e.message:findi("mail")) then
		e.self:Say("The League of Antonican Bards has a courier system made up of travelers, adventurers and [agents].  We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices.  Are you [interested]?");
	elseif(e.message:findi("agent")) then
		e.self:Say("Sivina Lutewhisper, Marton Stringsinger, Ticar Lorestring and Mistrana Two-Notes all report to me.");
	elseif(e.message:findi("marton stringsinger")) then
		e.self:Say("Marton Stringsinger lives with the barbarians in the city of Halas.");
	elseif(e.message:findi("sivina lutewhisper")) then
		e.self:Say("Sivina Lutewhisper lives with the rangers in Surefall Glade.");
	elseif(e.message:findi("ticar lorestring")) then
		e.self:Say("Ticar Lorestring sings for the people of the city of Erudin.");
	elseif(e.message:findi("mistrana.* note")) then
		e.self:Say("Mistrana Two-Notes is currently visiting with the McMannus tribe in the Karanas.");
	elseif(e.message:findi("felisity starbright")) then
		e.self:Say("Postmistress Felisity Stabright lives in the city of Freeport.");
	elseif(e.message:findi("lislia goldtune")) then
		e.self:Say("Postmistress Lislia Goldtune lives in the fortress of High Keep.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18150}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 18151}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 18153}) or item_lib.check_turn_in(e.self, e.trade, {item1 = 18154})) then
		e.self:Say("Incoming mail - very good! Please take this gold for your troubles.");
		-- Confirmed Live Faction
		e.other:Faction(e.self,284,5,0); -- Faction: League of Antonican Bards
		e.other:Faction(e.self,281,1,0); -- Faction: Knights of Truth
		e.other:Faction(e.self,262,1,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,304,-1,0); -- Faction: Ring of Scale
		e.other:Faction(e.self,285,-1,0); -- Faction: Mayong Mistmoore
		e.other:QuestReward(e.self,0,0,math.random(8,12),0,0,1550);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
