function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("Greetings, stranger! Are you the [bounty hunter I requested]?");
	elseif(e.message:findi("bounty hunter you requested")) then
		e.self:Say("It is about time.  I have been waiting for you for ages!  Your [reputation] precedes you.");
	elseif(e.message:findi("reputation")) then
		e.self:Say("You humor me, " .. e.other:GetCleanName() .. "!  I would have guessed someone like yourself would have little time for humor.  Nevertheless, would you [like to hear about the job] I have for you?");
	elseif((e.message:findi("about the job") or e.message:findi("like to know more")) and fac > 5) then
		e.self:Say("Your name is as respected as the name of the Karana bandits.  Leave my presence while you still have legs to run with.");
	elseif((e.message:findi("about the job") or e.message:findi("like to know more")) and fac == 5) then
		e.self:Say("You must be new to Highhold. We will trust you when we hear your blade has cut down many Karana bandits or assisted our gatehouse guards with their tasks.");
	elseif(e.message:findi("about the job") and fac < 5) then
		e.self:Say("A prisoner named Bronin Higginsbot, a halfling, recently escaped.  He was a small time thief and I would care less if it were not for the fact that in the process of obtaining the cell key, he disemboweled my finest guard.  We found the bloodied shank still stuck in my guard's gutted corpse.  Would you [like to know more]?");
	elseif(e.message:findi("like to know more") and fac < 5) then
		e.self:Say("That little man has now made it to Rivervale.  He has ties with the halfling rogues, obviously. I want you to find him.  When you find him, take this shank he used to kill my guard and hand it to him.  I want him to know why he is about to die.  No one escapes my prison!!  Bring me his head and I shall pay the bounty.");
		e.other:SummonCursorItem(13110); -- Item: Bloody Shank
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13111})) then
		e.self:Say("Good work, bounty hunter! You have served your legend well. I hope a few plat is good enough and, please, take this item we confiscated from one of our guests now serving time in our dungeon.");
		e.other:Faction(e.self,332, 20); -- Faction: Highpass Guards
		e.other:Faction(e.self,329, 3); -- Faction: Carson McCabe
		e.other:Faction(e.self,331, 3); -- Faction: Merchants of Highpass			
		e.other:Faction(e.self,230, 1); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(e.self,330, 1); -- Faction: The Freeport Militia
		e.other:QuestReward(e.self,math.random(0,5),math.random(0,5),math.random(0,5),math.random(0,5),eq.ChooseRandom(2314,5026,5027,5028,6019,6302,7321,5300),250);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
