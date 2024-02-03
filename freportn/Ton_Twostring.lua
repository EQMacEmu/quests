--Quest Name: Bard Mail Quest

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail. " .. e.other:GetCleanName() .. " - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
	elseif(e.message:findi("mail") and not e.message:findi("deliver") and not e.message:findi("kelethin") and not e.message:findi("highpass")) then
		e.self:Say("The League of Antonican Bards has a courier system made up of travelers and adventurers.  We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices.  Are you [interested]?");
	elseif(e.message:findi("interested")) then
		e.self:Say("I have messages that need to go to Highpass and Kelethin.  Will you [deliver] mail to [Kelethin] or [Highpass] for me?");
	elseif(e.message:findi("deliver") and e.message:findi("kelethin")) then
		e.self:Say("Take this pouch to Idia in Kelethin.  You can find her at the bard guild hall.  I am sure she will compensate you for your troubles.");
		e.other:SummonCursorItem(18167); -- Item: A Pouch of Mail (Kelethin)
	elseif(e.message:findi("deliver") and e.message:findi("highpass")) then
		e.self:Say("Take this pouch to Lislia Goldtune in Highpass.  You can find her at the entrance to HighKeep.  I am sure she will compensate you for your troubles.");
		e.other:SummonCursorItem(18156); -- Item: A Pouch of Mail (Highpass)
	elseif(e.message:findi("silna songsmith")) then
		e.self:Say("Silna Songsmith lives with the small folk in the city of Rivervale.");
	elseif(e.message:findi("travis.* tone")) then
		e.self:Say("Travis Two-Tone scouts the forest of Nektulos, near the dark elf city of Neriak.");
	elseif(e.message:findi("drizda tunesinger")) then
		e.self:Say("Drizda Tunesinger scouts the Feerrott, near the ogre city of Oggok.");
	elseif(e.message:findi("dark deathsinger")) then
		e.self:Say("Dark Deathsinger scouts the Innothule Swamp, near the troll city of Grobb.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18164})) then
		e.self:Say("More mail - you have done us a noteworthy service!  Please take this gold for your troubles.  If you are interested in more work, just ask me.");
		e.other:Faction(e.self,284,5); -- league of antonican bards
		e.other:Faction(e.self,281,1); -- knights of truth
		e.other:Faction(e.self,262,1); -- guards of qeynos
		e.other:Faction(e.self,304,-1); -- ring of scale
		e.other:Faction(e.self,285,-1); -- mayong mistmoore
		e.other:QuestReward(e.self,0,0,math.random(9),0,0,100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
