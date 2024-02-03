function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail and well met " .. e.other:GetCleanName() .. "! I give the second half of the test of songs. If you are ready, choose between the tests of brass, wind, and harmony.");
	elseif(e.message:findi("brass")) then	--Bard Test of Brass
		e.self:Say("Then bring back to me an efreeti war horn, a saffron spiroc feather, adamantium bands, and a glowing diamond.");
	elseif(e.message:findi("wind")) then	--Bard Test of Wind
		e.self:Say("Bring me an imp statuette, a dull stone, and an amulet of woven hair.  Then I will give you the amulet of the fae.");
	elseif(e.message:findi("harmony")) then	--Bard Test of Harmony
		e.self:Say("Working with the environment to enthrall those who listen to you is of the utmost importance to us.  Go out and retrieve an efreeti war spear, some manna nectar, and a nebulous emerald and diamond.  Return these items to me and receive the spear of harmony as your reward.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20830, item2 = 20961, item3 = 20828, item4 = 20829})) then --Bard test of Brass using Adamantium Bands, Effreeti War horn, glowing diamond, and saffron spiroc feather
		e.self:Say("The horn of Denon will aid you greatly, I believe.");
		e.other:QuestReward(e.self,0,0,0,0,27724,100000); --Denon's Horn of Disaster
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20953, item2 = 20826, item3 = 20827})) then	--Bard test of Wind using Amulet of woven hair, dull stone, and imp statuette
		e.self:Say("I hope you find this amulet useful, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,27723,100000); --Amulet of the Fae -- Original: Fae Amulet (14565)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20831, item2 = 20968, item3 = 20832, item4 = 20833})) then	--Bard test of harmony using Effreeti war spear, manna nectar, nebulous diamond, and nebulous emerald
		e.self:Say("The spear of harmony is a powerful weapon indeed. I hope you find it useful, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,27725,100000); --Spear of Harmony -- Original: Harmonic Spear (10852)
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
