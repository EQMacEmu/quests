--This iksar master is actually Master Rinmark, for the monk shackle quest line that eventually culminates in the Whistling Fists
function event_say(e)
	if(eq.is_the_scars_of_velious_enabled()) then
		if(e.message:findi("student")) then
			e.self:Emote("hands you what appears to be the base of a key. 'This was delivered to me by a dying student. He collapsed just after handing it to me. He was accompanying a student of mine named Veltar. They were questing for the legendary Whistling Fists. The key is made of a metal I have never felt or heard of. Find him.'");
			e.other:SummonCursorItem(17040); -- Item: Part of a Large Key
		end
	elseif(eq.is_the_shadows_of_luclin_enabled()) then
		if(e.message:findi("test of patience") or e.message:findi("trial of patience")) then
			e.self:Say("So your time has finally come to be tested for the final rung. To show your patience you shall spar with me. When you have gained the insight and strategy to strike you will know when. Strike me too soon and you will perish, too late and I will be gone. Come at me when the time is right. Let us begin.");
			eq.unique_spawn(96318,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.depop_with_timer();
		end
	else
		if(e.message:findi("hail")) then
			e.self:Emote("is humming and chanting softly. He seems oblivious to your presence.");
		elseif(e.message:findi("master rinmark")) then
			e.self:Emote("squints one eye open, then returns to his meditation.");
		elseif(e.message:findi("talon southpaw")) then
			e.self:Emote("waves his arms in the air. 'The great master. His soul is the wind. He speaks to us in words of thunder. He strikes Norrath with bolts of lightning. I seek to be as he is. I have traveled the globe in search of his fists. I have found only one. Another is said to be with [Gomoz]. I shall return it when I am finished with my seasons-long meditation or perhaps I shall find a monk to [return the hand to Cabilis].'");
		elseif(e.message:findi("Gomoz")) then
			e.self:Say("Disciple Gomoz was once Talon Southpaw's pupil. It is rumored that he has only one hand. Unfortunately, a horde of ogre raiders swiped his bones, along with others, from their place in Kurn's Tower. What those simple oafs plan to do with them is a mystery. Only one who has studied the arcane sciences could use them. They most likely used them as soup bones.");
		elseif(e.message:findi("return the hand to Cabilis")) then
			e.self:Emote("hands you an old tattered sack. 'This shall be your proof of allegiance. Prove that you are strong with an intact mandible of a skulking brutling and the claws of a burynai excavator. Prove that you are a monk of fist and tail with a sash of an exiled human monk and the sparring gloves of a goblin pit fighter. Combined, these items make the sack full. This will earn my trust and the hand.'");
			e.other:SummonCursorItem(17036); -- Item: Tattered Sack from Rinmark
		elseif(e.message:findi("assist old Rinmark in completing his rock garden")) then
			e.self:Emote("pours the pebbles into his pocket and hands the box to you. 'Take my box. Fill and combine within my box the following; a radiant meteorite, frontier fool's gold, petrified redwood, Rile's sand coin, sulfur stone, fragment of tektite, plains pebble, jade magma, heart of ice and an unholy coldstone. Return the full tin box to me and I shall reward you with a shackle of bronze.'");
			e.other:SummonCursorItem(17039); -- Item: Empty Tin Box
		elseif(e.message:findi("whistling fists")) then
			e.self:Say("The Whistling Fists are rumored to be magical instruments of destruction which can only be wielded by monks. The founder, Supreme Master Tynn, was the only lizard to ever gaze upon the weapon. He only spoke of it to his student Marthor. Marthor rarely spoke of it and when he did it was usually after a few flagons of Trog Brew. That is why many consider it to be babble.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12815})) then
		e.self:Emote("bows before you and takes a wrinkled, mummified hand from a pouch at his side. 'Take the hand. Let it rest within Cabilis and be reunited with the left.'");
		e.other:Faction(e.self,444,20); -- Faction: Swift Tails
		e.other:Faction(e.self,441,10); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,{itemid = 12797,exp = 20000}); -- Item: Iksar Right Hand =|-
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12829})) then
		e.self:Emote("opens the box to reveal a variety of pebbles. 'How grand!! My pebbles!! Now I can continue with my rock garden!! Hmmm. You look familiar. Hey!! I bet you can help me complete my garden!! Would you please [assist old Rinmark in completing his rock garden]?'");
		e.other:Faction(e.self,444,20); -- Faction: Swift Tails
		e.other:Faction(e.self,441,10); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,0,30000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12836})) then
		e.self:Emote("graciously accepts the tin box filled with precious rocks and gems. 'Thank you greatly, young " .. e.other:GetCleanName() .. ". For your deed, I bestow upon you the shackle of bronze!! You have completed the third rung. Alas, there is no time for celebration. I need your help in rescuing a [student] of mine.'");
		e.other:Faction(e.self,444,20); -- Faction: Swift Tails
		e.other:Faction(e.self,441,10); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,4195,30000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by: Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
