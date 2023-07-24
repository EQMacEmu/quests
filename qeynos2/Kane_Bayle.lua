function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, citizen! I am afraid you are not allowed in this building. You will have to leave. Good day to you.");
	elseif(e.message:findi("donation.* temple.* thunder") or e.message:findi("donate.* temple.* thunder")) then		
		e.self:Say("Why, of course! I would love to contibute to your esteemed organiztion. I would just hate to see the Knights of Thunder crumble. What would ever happen to Qeynos if their noble order were gone?! Perish the thought!");
		e.other:SummonCursorItem(13293); -- Item: A Donation
	elseif(e.message:findi("shrine of bertoxxulous")) then
		e.self:Say("All information about that accursed place is confidential. If you find any information pertaining to the Shrine of Bertoxxulous you must bring it to me immediately.");
	elseif(e.message:findi("milea")) then
		e.self:Say("Milea Clothspinner is an old flame of mine.  She would have made a fine wife.  Unfortunately for me, she chose to become a fine warrior.");
	elseif(e.message:findi("nerissa")) then
		e.self:Say("You keep your eyes off that sweet, innocent girl! She is under my care.");		
	elseif(e.message:findi("bloodsaber")) then
		e.self:Say("Bloodsabers!?  What nonsense are you spouting?  I have never heard of such a thing!  Begone!");	
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
