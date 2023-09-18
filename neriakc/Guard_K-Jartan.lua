function event_say(e)
	if(e.message:findi("supplies")) then
		e.self:Say("The local guild houses should sell a few items, but the best place to visit would be the Commons Quarter.  It is filled with shops.");
	elseif(e.message:findi("wizard guild") or e.message:findi("enchanter guild") or e.message:findi("magician guild")) then
		e.self:Say("The three circles of arcane science known as magic, enchantment and wizardry are studied in the Commons Quarter by the Spurned at the Tower of the Spurned.");
	elseif(e.message:findi("weapons")) then
		e.self:Say("You might want to venture over to the Commons Quarter.  They have quite a few forges as well as the weapons sold at the Cauldron of Hate.");
	elseif(e.message:findi("bank")) then
		e.self:Say("Go to the Commons Quarter and you shall find a place called Neriak Down Under.  Within this tunnel you shall find the Burnished Coin.");
	elseif(e.message:findi("inn") or e.message:findi("rest")) then
		e.self:Say("This is no place for outsiders.  That is why the Smuggler's Inn is located in the Foreign Quarter.");
	elseif(e.message:findi("forge")) then
		e.self:Say("Look in the Commons Quarter for a public forge.");
	elseif(e.message:findi("warrior guild")) then
		e.self:Say("The Cauldron of Hate in the Commons Quarter houses the masters of the Teir'Dal warriors, the Indigo Brotherhood.");
	elseif(e.message:findi("indigo brotherhood")) then
		e.self:Say("In the Commons Quarter can be found the Indigo Brotherhood, Teir'Dal warriors.  They are the armies of King Naythox Thex and serve as the trainers of the Dreadguard and dragoons.  Why the masters chose to build the Cauldron of Hate in that area and not the Third Gate is an amazement to me.");
	elseif(e.message:findi("king") or e.message:findi("leader")) then
		e.self:Say("The empire of the Teir'Dal is controlled by King Naythox Thex.  Some say Queen Cristanos is a much more fitting ruler.");
	elseif(e.message:findi("queen")) then
		e.self:Say("Queen Cristanos is the queen of Neriak, of course!  She was the one who formed the necromancers and shadowknights into the guild called the Dead.");
	elseif(e.message:findi("rogue guild")) then
		e.self:Say("Within this quarter is the Hall of the Ebon Mask.  The Ebon Mask are Neriak's rogues.");
	elseif(e.message:findi("healer")) then
		e.self:Say("How can you be allowed in Neriak's Third Gate and not know of the Priests of Innoruuk?  Theirs is the first temple you see when entering the Third Gate.");
	elseif(e.message:findi("the dead")) then
		e.self:Say("The Dead are the shadowknights and necromancers of Neriak.  They were formed by Queen Cristanos herself.  Even among the Teir'Dal they are feared and they keep to themselves within the Lodge of the Dead in the Third Gate.  I have heard they take orders only from the queen.");
	elseif(e.message:findi("kiln") or e.message:findi("barrel") or e.message:findi("oven") or e.message:findi("pottery")) then
		e.self:Say("You will find none of that here.  The public oven, kiln, pottery wheel and brew barrel are all within the Foreign Quarter.");
	elseif(e.message:findi("bard guild") or e.message:findi("monk guild")) then
		e.self:Say("A class of people lost in their mythical art.  They are nothing more than dust under the feet of the empire of the Teir'Dal.");
	elseif(e.message:findi("paladin guild")) then
		e.self:Say("Hold your tongue, whelp!  You are on the grounds of the shadowknights.  If they were to hear you talking of such things they would skin you alive!");
	elseif(e.message:findi("loom") or e.message:findi("sewing")) then
		e.self:Say("A sewing kit may be purchased at the Furrier Royale in Neriaks Third Quarter or at the Silk Underground in Neriaks Foreign Quarter. A community loom may be found at the Silk Underground in Neriaks Foreign Quarter.");
	end
end

