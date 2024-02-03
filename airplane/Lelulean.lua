function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Great, let us waste no more time! I have three tests from which you can choose from. They are Illusion, Metamorphism, and Deception.");
	elseif(e.message:findi("illusion")) then --enchanter test of illusion
		e.self:Say("Illusion it is.  Proceed upward through the sky and return to me a crimson tessera, a darkstone emerald, and a finely woven cloth cord.  This will prove your abilities to me and I will reward you with a cord of sphinx hair.");
	elseif(e.message:findi("metamorphism")) then --enchanter test of metamorphism
		e.self:Say("Metamorphism it is.  Proceed upward through the sky and return to me a silver disk, a bluish stone, and a light cloth mantle.  This will prove your abilities to me and I will reward you with the Wind Walker's Mantle.");
	elseif(e.message:findi("deception")) then --enchanter test of deception
		e.self:Say("Deception it is.  Proceed upward through the sky and return to me a rugous globe, a sky pearl, and a silken mask.  This will prove your abilities to me and I will reward you with an ivory mask.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20931, item2 = 20767, item3 = 20768})) then --enchanter test of illusion using crimson tessera, darkstone emerald, finely woven cloth cord
		e.self:Say("Good work, " .. e.other:GetCleanName() .. ", I hope you find this as useful as I find the items you retrieved for me.");
		e.other:QuestReward(e.self,0,0,0,0,1277,100000); --sphinx hair cord
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20769, item2 = 20770, item3 = 20938})) then --enchanter test of metamorphism using bluish stone, light cloth mantle, silver disc
		e.self:Say("The Wind Walker's Mantle will sit well upon your shoulders, " .. e.other:GetCleanName() .. ".  Be well this day.");
		e.other:QuestReward(e.self,0,0,0,0,1276,100000); --wind walker's mantle
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20945, item2 = 20772, item3 = 20771})) then --enchanter test of deception using rugous globe, silken mask, sky pearl
		e.self:Say("My thanks to you, " .. e.other:GetCleanName() .. ".  Take this mask as a token of my gratitude.");
		e.other:QuestReward(e.self,0,0,0,0,1275,100000); --ivory mask
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
