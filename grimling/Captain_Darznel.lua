function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met, friend. May I be of assistance?");
	end
end

function FieldPackTurnIn(e)
	e.self:Say("This documentation is a great start.  Judging by the amount of material here, we'll be able to formulate a new battle within the week.  It shouldn't take our linguists too long to decipher this scribble.");
	e.self:Say("I cannot help but think that your presence and leadership are what made those missions such wonderful successes.  I have been authorized to give you a field promotion for your valor and bravery in combat.  You're ability to lead was the keystone in the success of those engagements.  Welcome to the rank of Garrison Officer, "..e.other:GetCleanName().."!");
	e.self:Say("We can celebrate your promotion when we make it back to the rear.  Right now, I need you to lead another set of missions into the grunt occupied territory.  Speak to Captain Necin and show him the Soldier's chest that you've filled with the medals that you earned from the first set of raids.  He will direct you through the next several mission.  Once you have completed the missions, combine the Medallion of the Hero of Shar Vahl and your Officer's cloak in this Satchel.  Take the Locked Satchel to Sergeant Cursah.  He will assist you from that point forward.");
	e.other:QuestReward(e.self, 0, 0, 0, 0, 17132); -- Security Satchel
end

function event_trade(e)
	local item_lib = require("items");

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 8471}, 0)) then -- Garrison Enlistment Forms
		e.self:Say("Let's see, yes... yes...  It looks like you signed everything in the correct spot.  That can only mean that you're not only brave, but you have some wits as well.  If you have all of your teeth and can stand on one leg until the count of five, I think we can make use of you.");
		e.self:Say("Take this Polished Acrylia Sphere and give it to Scout Husman.  He's been leading raiding parties against the grunt camps.  Adventurers are great, but we need a real soldier to assist him this time.  Perhaps we will get better results with your help.");
		e.self:Say("After you complete that raid, please go with Scouts Danarin and Derrin.  Once you secure those camps, bring me any grimling intelligence reports or documents that you may have found.  Place the documents and your Garrison cloak in this bag and bring them back to me.  Complete this task and you may even get a promotion.");
		e.other:QuestReward(e.self,{items = {17130, 3681} } ); -- Garrison Field Pack, Polished Acrylia Sphere
		
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 8480}, 0)) then -- Sealed Field Pack
		FieldPackTurnIn(e);
		e.other:QuestReward(e.self, 0, 0, 0, 0, 8414); -- Jharin Officers Cloak
		
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 8483}, 0)) then -- Sealed Field Pack
		FieldPackTurnIn(e);
		e.other:QuestReward(e.self, 0, 0, 0, 0, 8415); -- Khati Sha Officers Cloak
		
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 8481}, 0)) then -- Sealed Field Pack
		FieldPackTurnIn(e);
		e.other:QuestReward(e.self, 0, 0, 0, 0, 8416); -- Khala Dun Officers Cloak
		
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 8472}, 0)) then -- Sealed Field Pack
		FieldPackTurnIn(e);
		e.other:QuestReward(e.self, 0, 0, 0, 0, 8417); -- Dar Khura Officers Cloak
		
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 8482}, 0)) then -- Sealed Field Pack
		FieldPackTurnIn(e);
		e.other:QuestReward(e.self, 0, 0, 0, 0, 8418); -- Taruun Officers Cloak
	end

	item_lib.return_items(e.self, e.other, e.trade);
end
