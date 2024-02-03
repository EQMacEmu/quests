function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello..  Welcome to the Wind Spirit's Song.  I'm Sansa, and I help out the local bards here.");
	elseif(e.message:findi("lute")) then
		e.self:Say("We carry many types of lutes and strings.  The bard guild here keeps us very busy.  And our customers, like [Fabian], keep us even busier.");
	elseif(e.message:findi("fabian")) then
		e.self:Say("Ahh - jolly Fabian. He is one of our best customers! That is, of course, due to the fact that he has the heaviest fingers of any bard I know. Anyhow, down to business. I assume he sent you for a new set of strings. Unfortunately, I have not been able to procure any of the special - uhh - things needed to make his strings lately.");
	elseif(e.message:findi("special things")) then
		e.self:Say("Uhh - ummm - uhhh - Fabian does not know this, but his strings are - uh - made of - uh - troll guts.");
	elseif(e.message:findi("troll guts")) then
		e.self:Say("Well, Fabian likes the thick resonance that only troll gut strings can provide. Trouble is, trolls are scarce around these parts, thank the gods, but Fabian breaks his strings as fast as I find suppliers. Trolls sometimes wander the Karanas in search of food but that is so rare, to see one there. Anyhow, if you find one out in the Karanas, bring me his gut along with 10 gold for materials and I can make the strings to take to Fabian.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "Good work! Now have you the rest of what I require?";	
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13703,platinum = 1},1,text1)) then
		e.self:Say("I am not even going to bother asking where you got that. Just take this set I already made and hurry them back to Fabian.");
		e.other:Faction(e.self,284,2,0); -- Faction: League of Antonican Bards
		e.other:Faction(e.self,281,1,0); -- Faction: Knights of Truth
		e.other:Faction(e.self,262,1,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,304,-1,0); -- Faction: Ring of Scale
		e.other:Faction(e.self,285,-1,0); -- Faction: Mayong Mistmoore
		e.other:QuestReward(e.self,0,0,0,0,13709,100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

