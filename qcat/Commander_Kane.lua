function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Do you know who I am?!  I am the Commander of the Qeynos Guard!  Do you think I trod through these sewers to speak with you?  If so, then you are quite sadly mistaken.");
	elseif(e.message:findi("bloodsabers")) then
		e.self:Say("Bloodsabers!?  You must be new.  Your shrine serves me well.  You shall all be rewarded once I rule.  No doubt you have not come to waste the time of the future emperor.  Are you seeking [new information]");
	elseif(e.message:findi("new information")) then
		e.self:Say("I have gotten word from Guard McCluskey that the young knights of the Temple of Life and the Hall of Thunder have been holding contests to see who is the fleetest.  Every so often, they send a young knight to run the paths of the Plains of Karana and back.  Lone young knights are easy targets for experienced Bloodsabers.");
	elseif(e.message:findi("shrine of bertoxxulous")) then
		e.self:Say("All information about that accursed place is confidential. If you find any information pertaining to the Shrine of Bertoxxulous you must bring it to me immediately.");
	elseif(e.message:findi("antonius")) then
		e.self:Say("How dare you speak the name of Antonius Bayle around me!  Brother he may be, but ruler he is not!  We could not possibly have been sired by the same person.  The empire of Qeynos would stretch as far as Freeport if I were in control.  Emperor Kane...  I like the sound of that!");		
	elseif(e.message:findi("milea")) then
		e.self:Say("Milea Clothspinner is an old flame of mine.  She would have made a fine wife.  Unfortunately for me, she chose to become a fine warrior.");
	elseif(e.message:findi("nerissa")) then
		e.self:Say("You keep your eyes off that sweet, innocent girl! She is under my care.");		
	elseif(e.message:findi("the disease is spreading")) then
		e.self:Say("Good to see you, my friend. S'ragg said he would be sending his finest. I pray he is right. Do you feel like [going to Highpass] or [going home]?");
	elseif(e.message:findi("going home")) then
		e.self:Say("Just as well.  Get the shrine to send me someone of strength.  No more cowards!");
	elseif(e.message:findi("going to Highpass")) then
		e.self:Say("You will be taking this with you. Give this marked bottle to a man called Barn Bloodstone. He is known to hang around a place called the Golden Rooster. He has a package for me. He will then give you instructions to your next destination. Now, be off! Time is of the essence!");
		e.other:SummonCursorItem(13130); -- Item: Blackburrow Stout
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18808})) then
		e.self:Say("Good Work, friend. I still need the other parts. You'd best hope no other gets to them first and returns them to me first. If they do you get no payment.");
		e.other:Faction(e.self,273,100,0); -- Faction: Kane Bayle
		e.other:Faction(e.self,230,50,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(e.self,262,-15,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,219,-10,0); -- Faction: Antonius Bayle
		e.other:Faction(e.self,221,15,0); -- Faction: Bloodsabers
		e.other:QuestReward(e.self,0,3,3,0,0,500);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18809})) then
		e.self:Say("Thank you for your help. Soon Antonius' agents will be exterminated like roaches. May the virus of the Plaguebringer run through your veins.");
		e.other:Faction(e.self,273,100,0); -- Faction: Kane Bayle
		e.other:Faction(e.self,230,50,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(e.self,262,-15,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,219,-10,0); -- Faction: Antonius Bayle
		e.other:Faction(e.self,221,15,0); -- Faction: Bloodsabers
		e.other:QuestReward(e.self,0,3,3,0,0,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

