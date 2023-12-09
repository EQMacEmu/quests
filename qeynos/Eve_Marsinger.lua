--Quest Name: Bard Mail Quest

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ". Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
	elseif(e.message:findi("deliver.* highpass")) then
		e.self:Say("Take this pouch to Lislia Goldtune in Highpass. You can find her at the entrance to HighKeep. I am sure she will compensate you for your troubles.");
		e.other:SummonCursorItem(18152); -- Item: A Pouch of Mail (Highpass)
	elseif(e.message:findi("deliver.* freeport")) then
		e.self:Say("Take this letter to Felisity Starbright in Freeport.  You can find her at the bard guild hall.  I am sure she will compensate you for your troubles.");
		e.other:SummonCursorItem(18158); -- Item: A Bardic Letter (Freeport)
	elseif(e.message:findi("interested")) then
		e.self:Say("I have messages that need to go to Highpass and to Freeport.  Will you [deliver] mail to [Highpass] or [Freeport] for me?");
	elseif(e.message:findi("agents")) then
		e.self:Say("Sivina Lutewhisper, Marton Stringsinger, Ticar Lorestring and Mistrana Two-Notes all report to my husband, Tralyn.");
	elseif(e.message:findi("mail")) then
		e.self:Say("The League of Antonican Bards has a courier system made up of travelers, adventurers and [agents]. We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices. Are you [interested]?");
	elseif(e.message:findi("marton stringsinger")) then
		e.self:Say("Marton Stringsinger lives with the barbarians in the city of Halas.");
	elseif(e.message:findi("sivina lutewhisper")) then
		e.self:Say("Sivina Lutewhisper lives with the rangers in Surefall Glade.");
	elseif(e.message:findi("ticar lorestring")) then
		e.self:Say("Ticar Lorestring sings for the people of the city of Erudin.");
	elseif(e.message:findi("mistrana.* note")) then
		e.self:Say("Mistrana Two-Notes is currently visiting with the McMannus tribe in the Karanas.");
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18165})) then
		e.self:Say("Incoming mail - very good! Please take this gold for your troubles.");
		e.other:Faction(e.self,284,5,0); -- Faction: League of Antonican Bards
		e.other:Faction(e.self,281,1,0); -- Faction: Knights of Truth
		e.other:Faction(e.self,262,1,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,304,-1,0); -- Faction: Ring of Scale
		e.other:Faction(e.self,285,-1,0); -- Faction: Mayong Mistmoore
		e.other:QuestReward(e.self,0,0,math.random(8,15),0,0,1550);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
