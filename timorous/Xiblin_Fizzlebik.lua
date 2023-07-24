-- Part of quest for Veeshan's Peak key
function event_spawn(e)
	eq.set_timer("sit",10000);
end

function event_timer(e)
	if(e.timer == "sit") then
		e.self:SetAppearance(1);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. "! I am Xiblin Fizzlebik, renowned archeologist and historian of Ak'Anon. I'm currently in search of artifacts and relics on the Iksar [Jarsath tribe]. If you stumble upon anything, please bring it to me.");
	elseif(e.message:findi("Jarsath tribe")) then
		e.self:Say("About two thousand years ago, there were five different tribes of Iksar who dwelled on the continent of Kunark. One of these tribes was the Jarsath. They were a very primitive sort, proud and tribal, but also cannibalistic. Often, they went to war with the other tribes that co-existed with them back then. The ruins found on this island were of structures created by the Jarsath. I've been excavating for quite some time now, but haven't been able to find anything of significance.");
	elseif(e.message:findi("looking for")) then
		e.self:Say("In my studies, I have learned that the Jarsath believed they could draw power from a holy symbol... specifically a medallion that represented their tribe. When Salthir became king of the Iksar empire Sebilis, he had the medallion broken into three pieces and hid them on the Kunark continent so that they would never be found. I'm searching for the pieces so that I can put it back together and learn more about this tribe. Perhaps you wish to help?");
	elseif(e.message:findi("help")) then
		e.self:Say("All I know is that the pieces were most likely hidden in water regions. If you manage to find them, bring them to me and I will be able to put the medallion of the Jarsath back together. I am sure there is much to be learned from it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Yes yes, now where is the rest of the medallion?";	
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19959, item2 = 19960, item3 = 19961},1,text)) then
		e.self:Emote("tinkers with the three pieces and snaps the pieces together. 'Wow.. You've done it.. but I suddenly feel very.. strange.. This medallion is cursed! Here, you take it!'");
		e.other:QuestReward(e.self,0,0,0,0,19954,100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Emote("sighs to himself in resignation and continues to dig with obvious annoyance.");
	end
	if(e.signal == 2) then
		e.self:Emote("mutters to himself. 'Yeah, not because you're a goblin headed moron or anything.'");
		eq.signal(96032,30); -- NPC: Alrik_Farsight
	end
	if(e.signal == 3) then
		e.self:Say("I didn't say anything! Now get back on your side of the island, you're getting dirt and junk all over mine!");
	end
end

-- Quest by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
