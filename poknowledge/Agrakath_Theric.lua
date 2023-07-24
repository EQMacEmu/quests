--Willamina's Needles
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("regards you indifferently.  'You appear to be new around here, as I have not seen your face walking these streets before.  If you have come seeking knowledge, the library of Myrist will be a most excellent resource for you.  If you have come for any other reason, I'm afraid your quest will not go very far with me, as I do not have much time to hear of your escapades.  Good day.'");
	elseif(e.message:findi("erase the debt")) then
		e.self:Emote("grins and says, 'So, that weasel Caden has sent you to settle his debt? And you actually agreed to this endeavor? Ha ha, very well! I shall transfer the responsibility of what Caden owes me to your shoulders. I have a simple job for you. Somewhere in the library there lies a book I have been searching for, but it has eluded me for quite some time. I believe it can be found somewhere in the upper levels. You are to venture into Myrist and seek out a tome titled History of Evils: The Age of Scale, and bring it to me. Do this one task for me and your debt shall be relinquished.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28188})) then--History of Evils: The Age of Scale
		e.self:Emote("eyes go wide with surprise as you hand over the book. 'Very impressive for one of your abilities. Here, take this note to Caden. He is absolved of his debt to me at this time.'");
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,0,0,0,28084,100);--Note to Caden
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
