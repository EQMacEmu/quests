function event_say(e)
	if(e.message:findi("supplies")) then
		e.self:Say("The local guild houses should sell a few items, but the best place to visit would be the Commons Quarter.  It is filled with shops.");
	elseif(e.message:findi("wizard guild") or e.message:findi("enchanter guild") or e.message:findi("magician guild")) then
		e.self:Say("Here in the Commons Quarter is the Tower of the Spurned.  It is the home of the Spurned, Teir'Dal who choose to study enchanting, wizardry and magic.");
	elseif(e.message:findi("weapons") or e.message:findi("forge")) then
		e.self:Say("I recommend the Blue Flame forge near Adamant Armor or you might try the Cauldron of Hate.");
	elseif(e.message:findi("bank")) then
		e.self:Say("You are in the correct quarter.  You can find the Burnished Coin within Neriak Down Under.");
	elseif(e.message:findi("inn") or e.message:findi("rest")) then
		e.self:Say("This is no place for outsiders.  That is why the Smuggler's Inn is located in the Foreign Quarter.");
	elseif(e.message:findi("warrior guild")) then
		e.self:Say("Within this area you will find the Cauldron of Hate which is home to the Teir'Dal warriors.");
	elseif(e.message:findi("indigo brotherhood")) then
		e.self:Say("In the Commons Quarter can be found the Indigo Brotherhood, Teir'Dal warriors.  They are the armies of King Naythox Thex and serve as the trainers of the Dreadguard and dragoons.  Why the masters chose to build the Cauldron of Hate in that area and not the Third Gate is an amazement to me.");
	elseif(e.message:findi("king") or e.message:findi("leader")) then
		e.self:Say("The mighty empire of the Teir'Dal is ruled by King Naythox Thex.  All hail Thex!");
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
	elseif(e.message:findi("bard guild") or e.message:findi("monk guild")) then
		e.self:Say("A class of people lost in their mythical art.  They are nothing more than dust under the feet of the empire of the Teir'Dal.");
	elseif(e.message:findi("paladin guild")) then
		e.self:Say("Speak not of those vile paladins within Neriak!");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		eq.stop();
		eq.move_to(-630,-71,-24,162,true);
	elseif(e.signal == 2) then
		eq.start(36);
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 7) then
		eq.get_entity_list():GetDoorsByDoorID(1):ForceOpen(e.self);
		eq.get_entity_list():GetDoorsByDoorID(2):ForceOpen(e.self);
		eq.get_entity_list():GetDoorsByDoorID(49):ForceOpen(e.self);
	end
end