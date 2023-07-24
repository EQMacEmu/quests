function event_say(e)
	if(e.message:findi("supplies")) then
		e.self:Say("The local guild houses should sell a few items, but the best place to visit would be the Commons Quarter.  It is filled with shops.");
	elseif(e.message:findi("wizard guild") or e.message:findi("enchanter guild") or e.message:findi("magician guild")) then
		e.self:Say("The three circles of arcane science known as magic, enchantment and wizardry are studied in the Commons Quarter by the Spurned at the Tower of the Spurned.");
	elseif(e.message:findi("weapons") or e.message:findi("forge")) then
		e.self:Say("You might want to venture over to the Commons Quarter.  They have quite a few forges as well as the weapons sold at the Cauldron of Hate.");
	elseif(e.message:findi("bank")) then
		e.self:Say("Go to the Commons Quarter and you shall find a place called Neriak Down Under.  Within this tunnel you shall find the Burnished Coin.");
	elseif(e.message:findi("inn") or e.message:findi("rest")) then
		e.self:Say("The Smuggler's Inn is nearby.");
	elseif(e.message:findi("warrior guild")) then
		e.self:Say("Within the Commons Quarter can be found the Indigo Brotherhood, Teir'Dal warriors.  They train in the Cauldron of Hate.");
	elseif(e.message:findi("indigo brotherhood")) then
		e.self:Say("In the Commons Quarter can be found the Indigo Brotherhood, Teir'Dal warriors.  They are the armies of King Naythox Thex and serve as the trainers of the Dreadguard and dragoons.  Why the masters chose to build the Cauldron of Hate in that area and not the Third Gate is an amazement to me.");
	elseif(e.message:findi("king") or e.message:findi("leader")) then
		e.self:Say("The dark elf kingdom of Neriak is ruled by the mighty fist of King Naythox Thex.");
	elseif(e.message:findi("queen")) then
		e.self:Say("Queen Cristanos is the queen of Neriak, of course!  She was the one who formed the necromancers and shadowknights into the guild called the Dead.");
	elseif(e.message:findi("rogue guild")) then
		e.self:Say("The Ebon Mask are the rogues of Neriak.  Their Hall of the Ebon Mask lies within the Third Gate.");
	elseif(e.message:findi("cleric guild") or e.message:findi("healer")) then
		e.self:Say("When you enter the Third Gate you shall see the Spires of Innoruuk.  This is the temple of the Priests of Innoruuk.");
	elseif(e.message:findi("the dead")) then
		e.self:Say("The Dead are the shadowknights and necromancers of Neriak.  They were formed by Queen Cristanos herself.  Even among the Teir'Dal they are feared and they keep to themselves within the Lodge of the Dead in the Third Gate.  I have heard they take orders only from the queen.");
	elseif(e.message:findi("tavern")) then
		e.self:Say("There are quite a few taverns in the Commons Quarter.  I recommend either Toadstool's or the Blind Fish.");
	elseif(e.message:findi("necromancer guild") or e.message:findi("shadowknight guild")) then
		e.self:Say("The shadowknights and necromancers share the same guild.  They are called the Dead.  They reside within the Lodge of the Dead in the Third Gate.");
	elseif(e.message:findi("kiln") or e.message:findi("barrel") or e.message:findi("oven") or e.message:findi("pottery")) then
		e.self:Say("Within this quarter can be found the public oven, kiln, pottery wheel and brew barrel.  All are near the Market View.");
	elseif(e.message:findi("bard guild") or e.message:findi("monk guild")) then
		e.self:Say("A class of people lost in their mythical art.  They are nothing more than dust under the feet of the empire of the Teir'Dal.");
	elseif(e.message:findi("paladin guild")) then
		e.self:Say("Speak not of those vile paladins within Neriak!");
	end
end