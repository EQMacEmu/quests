function event_say(e)
	if(eq.is_the_ruins_of_kunark_enabled()) then
		if(e.message:findi("hail")) then
			e.self:Say("Welcome. Please stock up on provisions, especially if you are headed toward the lair of the vile gnolls. If so, I wish you much luck and many gnoll pelts!! I also have knowledge of a [powerful dog]. I pray you do not encounter him.");
		elseif(e.message:findi("powerful dog")) then
			e.self:Say("I have encountered a gnoll who spoke the common tongue. He dared to call himself Lord Elgnub. He swore that some day we would cross paths and he would snatch my infant son Joseph from our home. He would stand no chance against me and the mighty [Gnoll Slayer].");
		elseif(e.message:findi("gnoll slayer")) then
			e.self:Say("Gnoll Slayer is the mighty longsword which was passed down unto me through generations of Sayers. My days of battle are over, but I can still wield her with ferocity. The only thing more precious would be my son, Joseph Sayer. I would trade Gnoll Slayer only for him to be safe and sound at home.");
		elseif(e.message:findi("potential")) then
			e.self:Say("The true potential of Gnoll Slayer is an enchantment which was once imbedded into a gnoll's eye which was placed into the hilt of the blade. The spell would help you fight off disease and call forth a wolf to fight beside you. Alas, the gnoll eye was stolen from the blade by a great, one-eyed, white gnoll. Alone with the eye, the only book which explained how to return the enchantment was also stolen. I know not where this gnoll might be. If you can find the journal and the eye, return them with the Gnoll Slayer to me for I have been searching for decades.");
		elseif(e.message:findi("joseph") or e.message:findi("son")) then
			e.self:Say("You speak of my son, Joseph Sayer. He is but an infant and is safe here with Mira and me... At least, I believe he is.");
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("Welcome. Please stock up on provisions, especially if you are headed toward the lair of the vile gnolls. If so, I wish you much luck and many gnoll pelts!!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12204})) then
		e.self:Say("Baby Joseph!! Look, Momma!! Baby Joseph has been rescued by this good adventurer!! That evil Lord Elgnub made good on his word and snatched my son from under our noses. You saved the day!! For this you shall wield 'Gnoll Slayer'!! Be aware of its [true potential].");
		e.other:Faction(e.self,291,20); -- Faction: Merchants of Qeynos
		e.other:Faction(e.self,223,-4); -- Faction: Circle of Unseen Hands
		e.other:Faction(e.self,219,3); -- Faction: Antonius Bayle
		e.other:Faction(e.self,229,2); -- Faction: Coalition of Tradefolk
		e.other:Faction(e.self,262,4); -- Faction: Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,5416,500); -- Item: Gnoll Slayer
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8357,item2 = 8356,item3 = 5416})) then
		e.self:Say("The eye and the journal! What a great day! The Gnoll Slayer shall be returned to full strength because of you. Your service to Qeynos will not soon be forgotten.");
		e.other:Faction(e.self,291,200,0); -- Faction: Merchants of Qeynos
		e.other:Faction(e.self,223,-40,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(e.self,219,30,0); -- Faction: Antonius Bayle
		e.other:Faction(e.self,229,20,0); -- Faction: Coalition of Tradefolk
		e.other:Faction(e.self,262,40,0); -- Faction: Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,5417,1500); -- Item: Gnoll Slayer
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
