--BeginFile lakerathe\Kazen_Fecae.pl
--Quest for Lake Rathetear - Kazen Fecae: Necromancer Epics (1.0)

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("'s eyes seem to glow as he turns to you and says, 'Leave me be if you have no reason to be here, mortal!'");
	elseif(e.message:findi("dark arts")) then
			e.self:Emote("looks you up and down, his eyes glowing with a soft red light. After a moment he begins to speak though his lips do not move. 'You wish to study under me? Perhaps, if you prove yourself to follow the twisted path. If you prove to be as coldhearted as I then I will let you become my servant.'");
	elseif(e.message:findi("prove")) then
		e.self:Say("The wandering knight, Sir Edwin Motte, recently slew one of my lesser servants. This foolish knave travels from town to town pretending to be good. Separate his head from his body and return it to me so I may work my magics upon it. This fool will become another plaything for me, even in death.");
	elseif(e.message:findi("advance")) then
		e.self:Say("I share great secrets with my more powerful servants who show me they are willing to serve without question. Tell my servant the name of any symbol he gives you and he will instruct you. If I give you a symbol, speak its name to me so I may instruct you.");
	elseif(e.message:findi("apprentice")) then
		e.self:Say("You have a long way to go before I teach you the true secrets of life and death. Visit Venenzi Oberendi in the Nektulos Forest and show her the symbol. She is collecting reagents for one of my experiments and is taking far too long. I do not wish her dead, yet, I simply need the reagents soon. Retrieve the reagents and give them to my assistant Emkel Kabae. I do not wish to handle them myself.");
	elseif(e.message:findi("reagents")) then
		e.self:Say("'The reagents are the same types the great sorcerer Miragul used to cheat death and become a lich. I do not wish to become a lich as Miragul did, I have greater aspirations than to simply live forever as a hollow shell. I will rise up a being of pirit only, with a will off my own.' Kazen's eyes glow sickly red as he stared off toward the horizon.");
	elseif(e.message:findi("testing")) then
		e.self:Say("Show me that you can overcome larger obstacles and manipulate servants. Gather a force for of mercenaries if you like, or so-called friends, if you desire, and prepare for battle, my promising young student. Return to me with the symbol of testing when you are prepared for battle with my creations. Have no fear, I will not slay you myself. If you do live, tell me the name of the symbol you receive.");
	elseif(e.message:findi("insanity")) then
		e.self:Say("It is time for you to meet my partner, so to speak. Drendico Metalbones is his name and I assure you he is quite mad. His mind has been rended by fright, dread, and terror in his trips to the planes and his heart is full of hatred now. He has a tome which I wish you to use. Show him your symbol slowly and listen to his rantings well, they hide great knowledge.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20641})) then --Head of Sir Edwin Motte
		e.self:Say("'Excellent!' You watch Kazen hold the head by the hair and begin to cast a spell. A flash of darkness centers around the head, and the eyes of the dead knight open, a terrible scream emanating from its lips. 'This poor fool here - I think I will keep him in my bag from now on. You have done well, my new apprentice. Take this symbol and know that you can do other tasks to advance within my apprentice ranks.'");
		e.other:QuestReward(e.self,0,0,0,0,20642,5000); --Symbol of the Apprentice
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20647})) then --Symbol of Testing
		e.self:Say("As you hand Kazen the symbol, you hear him speak directly into your mind. 'Good luck, my student!' Kazen finishes an incantation and suddenly hands begin to reach up from the ground, as if they were pulling themselves from the grave all around you. A piercing scream fills the air as the creatures advance upon you!");
		eq.spawn2(51153,0,0,-1498.9,283.8,58.4,57.6):AddToHateList(e.other,1); --a bone golem
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20653})) then --Prepared Reagent Box
		e.self:Emote("stares through you at the horizon, pausing as he reaches into his robes. Kazen pulls out a scythe with a shimmering black blade that seems too large to have been hidden there. As quickly and gracefully as it was displayed to you, it is returned to the void inside Kazen's robes. 'It is a creation of Miragul which was looted from his lair under the ice. Take this tome, it will be your final task for me as an apprentice.'");
		e.other:QuestReward(e.self,0,0,0,0,18087,10000); --Tome of Instruction
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20652})) then --Gkzzallk in a Box
		e.self:Emote("grins wildly and his eyes flare a deep red. The scythe he promised you flies through the air and into your hand. 'Enjoy your toy, I have no more need of you as a servant.'");
		e.other:QuestReward(e.self,0,0,0,0,20544,10000); --Scythe of the Shadowed Soul
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
