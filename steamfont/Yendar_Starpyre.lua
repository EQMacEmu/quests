-- Rogue Epic NPC -- Yendar_Starpyre


function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, traveler! I sense you did not simply chance upon my isolation here, but are instead seeking me for something.");
	elseif(e.message:findi("translate")) then
		e.self:Say("Oh, if it is written in Eder Teir'Dal, most likely I can translate it. I will be happy to try, in any case. Let me see it, please.");
	elseif(e.message:findi("key")) then
		e.self:Say("In the Plane of Hate, where dwell Innoruuk and his minions, there is a tome. This tome is called the Book of Souls.");
	elseif(e.message:findi("book of souls")) then
		e.self:Say("The Book of Souls chronicles all the lives Innoruuk has tainted over the years. It is in the care of the Maestro of Rancor. I can use this tome as a basis for my translation, if you return it and the note to me. An experienced practitioner in the art of non-detection should be able to snatch it from its resting place, don't you think, " .. e.other:Race() .. "?'");
	elseif(e.message:findi("Eldreth sent me")) then
		e.self:Say("Eldreth, Eldreth, hmm, was that a rather shabby Erudite? I have dealt with him in the past, I am sure. What does he want of me?");
	end
end
	
function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28053})) then
		e.self:Say("I say, this is indeed a challenge. This is written in what I'm sure is the language of the High Priesthood of Innoruuk. I've often wished I could read this, but I have never had the key to unlock the language. Take this for now.");
		e.other:QuestReward(e.self,0,0,0,0,28055,500);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 28055, item2 = 28016})) then
		e.self:Say("My, this is quite a large list! Yes, I can use the names and dates recorded here to help me understand the script. It should be a simple matter now. A moment, please. Aha, yes, there we go. Translated as best I can! I do hope you're not involved in what is described here, as it is quite fiendish. Oi! You, woman! Give that back! " .. e.other:GetCleanName() .. ", that woman there took your letter! I think I should leave you to discuss it with her. Best of luck!.");
		eq.unique_spawn(56172,0,0,e.self:GetX()-10,e.self:GetY()+10,e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
	
--END of FILE  Quest by: Solid11  Zone:steamfont  ID:56012 -- Yendar_Starpyre
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
