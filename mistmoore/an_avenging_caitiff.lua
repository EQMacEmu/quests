function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("glares at you with fangs bared as he draws an electrum-bladed wakizashi.");
	elseif(e.message:findi("electrum-bladed wakizashi")) then
		e.self:Say("HA! As if a mortal such as yourself is worthy of such a weapon. Leave me to my mission - my purpose in life - the slaying of those who brought me into this existence, then exiled me from this place.");
	elseif(e.message:findi("mother")) then
		e.self:Say("My mother was named Issis.  She is, to my knowledge, employed as Lord Mistmoore's maid.");
	elseif(e.message:findi("father")) then
		e.self:Say("Syncall is my father's name.  He serves as Lord Mistmoore's butler.");
	elseif(e.message:findi("purpose")) then
		e.self:Say("My mission is to free those who made me what I am, avenge my exile and take revenge upon all vampires.");
	elseif(e.message:findi("made you")) then
		e.self:Say("Both of my parents are vampires.  My mother was fourth generation of the Mistmoore lineage.  On the night my soul returned to this realm, my mother bestowed the curse of immortality upon my father.  Nine moons later, I glimpsed my first vision of this world with these tainted eyes.  It was not until some time later that they discovered I was different.");
	elseif(e.message:findi("different")) then
		e.self:Say("Since my mother was a vampire, my blood, too, was of the accursed lineage.  However, the Mistmoore blood ran thin in my veins.  My body was imbued with many of the attributes of a vampire but my soul was not corrupted and my will prevailed over the curse.  For this, I was cast out and banished.  And so, I hunt vampires.  There is no more.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10179,item2 = 10178})) then
		e.self:Say("Mother? Father? May you find peace at last. I shall avenge your suffering! I will grow stronger and set free the souls of the others.");
		e.other:QuestReward(e.self,0,0,0,0,5408,50000); -- Item: Electrum-Bladed Wakizashi
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
