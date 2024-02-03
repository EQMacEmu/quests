function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi there " .. e.other:GetCleanName() .. "! I give three sections of the test of songs, Denise does the rest. Do you wish to take the test of pitch, voice, or tone?");
	elseif(e.message:findi("pitch")) then 	--Bard test of pitch
		e.self:Say("The pitch that we sing and play has a great effect on those who listen.  Keep this in mind, " .. e.other:GetCleanName() .. ", and you shall always be welcome in taverns and inns.  Now, I need you to return to me a phosphoric globe, a shimmering diamond, and a crude wooden flute.");
	elseif(e.message:findi("voice")) then 	--bard test of voice
		e.self:Say("The sweet sounds rising forth from our throats are what make us truly great.  Go forth and give voice to your songs, and return to me a platinum disc, a music box, and a light woolen mantle.  If you do this, I shall give you the mantle of the songweaver.  Good luck!");
	elseif(e.message:findi("tone")) then 	--bard test of tone
		e.self:Say("Tone is important to all singers.  Prove to me that you can keep your tone even and pure by bringing me an ochre tessera, a songbird statuette, and a light woolen mask.  If you do this, I will give you the mask of song.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20947, item2 = 20824, item3 = 20825})) then 	--bard test of pitch using crude wooden flute, phosphoric globe, and shimmering diamond
		e.self:Say("The songsmith Ervaj crafted this flute. It is now yours, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,27722,100000); --Ervaj's flute of flight -- Original: Agilmentes Flute of Flight (14564)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20940, item2 = 20822, item3 = 20823})) then --bard test of voice using light woolen mantle, music box, platinum disc
		e.self:Say("You are truly a master of songs, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,27721,100000); --mantle of the songweaver -- Original: Songweaver's Mantle (2710)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20933, item2 = 20821, item3 = 20820})) then --bard test of tone using ochre tessera, songbird statuette, light woolen mask
		e.self:Say("Take this mask. You have earned it.");
		e.other:QuestReward(e.self,0,0,0,0,27720,100000); --mask of song -- Original: Mask of the Songbird (2711)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
