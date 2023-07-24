--Velter gives us the last shackle in the line, the Shackle of Tynonnium.
--Since players must turn in their Shackle of Steel to the tome keeper in Kaesora to complete Veltar's quest, there is no requirement to check for it here.
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("'s body has scars all about it, looking as though beaten with whips. One wrist bares a unique looking bracer, the other is bare. 'Leave me be! I did not come up here because I wanted company.'");
	elseif(e.message:findi("tynnonium shackle")) then
		e.self:Say("So it is the one that has freed me before! You seek the ways of Tynn I see. You must be on the true path of the monk to accomplish what is needed. The path will test the [three virtues] most important to becoming a true vessel for Cazic Thule's power.");
	elseif(e.message:findi("three virtues")) then
		e.self:Say("The three virtues are [patience], [agility], and [peace of mind]. Patience is important in knowing in when to strike your opponent, too soon and you may crushed, too late and your opportunity may pass. Agility is very important in showing your ability to avoid blows sent your way, and then returning what was sent to you. Without striking quickly you are no monk at all. Peace of mind will allow you to concentrate on the situation you are in. With it you can control your actions and make decisive strikes at critical times. Without peace of mind you may attack out of rage and will surely fall for your mind is clouded. You must complete these three trials to earn the shackle of the Grandmaster.");
	elseif(e.message:findi("patience")) then
		e.self:Say("Patience shall be tested by the one whom has the greatest patience. Seek Master Rinmark, and ask him of this trial.");
	elseif(e.message:findi("agility")) then
		e.self:Say("To show agility you must be tested by the most swift of us. Grandmaster Glox will provide your test for this. Ask him of the trial of agility.");
	elseif(e.message:findi("peace of mind")) then
		e.self:Say("To show peace of mind you must decipher a tome found in the library of Kaesora. An undead tome keeper will wait for you to come, ask him of the trial of peace of mind. The tome will tell you what you shall seek. Do with the tome the same as you would with the item you seek. Show you have clarity of mind in solving this.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7879, item2 = 7880, item3 = 7881})) then
		e.self:Say("So you are finally ready for the final rung. Here it is, you shall receive mine for I quest for the fists of Cazic Thule no longer.");
		e.other:QuestReward(e.self,0,0,0,0,4199,60000);
		e.other:Faction(e.self,444,100); -- Faction: Swift Tails
		e.other:Faction(e.self,441,25); -- Faction: Legion of Cabilis
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by: Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
