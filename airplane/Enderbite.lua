function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Great, let us waste no more time! I have three tests from which you can choose from. They are Disillusion, Memorization, and Incapacitation.");
	elseif(e.message:findi("disillusion")) then --enchanter test of disillusion
		e.self:Say("Disillusion it is.  Proceed upward through the sky and return to me a harpy statuette, a black nebulous sapphire, and an adamantium earring.  This will prove your abilities to me and I will reward you with an Earring of Displacement.");
	elseif(e.message:findi("memorization")) then --enchanter test of memorization
		e.self:Say("Memorization it is.  Proceed upward through the sky and return to me a carmine spiroc feather, some ganoric poison, and a glowing necklace.  This will prove your abilities to me and I will reward you with a Necklace of Whispering Winds.");
	elseif(e.message:findi("incapacitation")) then --enchanter test of incapacitation
		e.self:Say("Incapacitation it is.  Proceed upward through the sky and return to me an efreeti wind staff, some sweet nectar, a black sky diamond, and a large sky sapphire.  This will prove your abilities to me and I will reward you with the Rod of the Protecting Winds.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20774, item2 = 20952, item3 = 20773})) then --enchanter test of disillusion using adamantium earring, harpy statuette, black nebulous sapphire
		e.self:Say("Good. Take this as your reward.");
		e.other:QuestReward(e.self,0,0,0,0,14559,100000); --earring of displacement
		eq.depop();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20959, item2 = 20775, item3 = 20776})) then --enchanter test of memorization using carmine spiroc feather, ganoric poison, glowing necklace
		e.self:Say("Good. Take this as your reward.");
		e.other:QuestReward(e.self,0,0,0,0,14558,100000); --necklace of whispering winds
		eq.depop();
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20777, item2 = 20779, item3 = 20778, item4 = 20966})) then --enchanter test of incapacitation using black sky diamond, efreeti wind staff, large sky sapphire, sweet nectar
		e.self:Say("Good. Take this as your reward.");
		e.other:QuestReward(e.self,0,0,0,0,27711,100000); --rod of protecting winds
		eq.depop();
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