--Quest Name: Bard Mail Quest

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. " - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
	elseif(e.message:findi("interested")) then
		e.self:Say("I have messages that need to go to - well, right now I have one that needs to go to Freeport. Will you [deliver] mail to [Freeport] for me?");
	elseif(e.message:findi("mail") and not e.message:findi("deliver") and not e.message:findi("freeport")) then
		e.self:Say("The League of Antonican Bards has a courier system made up of travelers and adventurers.  We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices.  Are you [interested]?");
	elseif(e.message:findi("deliver") or e.message:findi("Freeport")) then
		e.self:Say("Take this letter to Felisity Starbright in Freeport.  You can find her at the bard guild hall.  I am sure she will compensate you for your trouble.");
		e.other:SummonCursorItem(18159); -- Item: A Bardic Letter (Freeport)
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
