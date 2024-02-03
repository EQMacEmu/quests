function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Do not waste my time, " .. e.other:GetCleanName() .. ".  Do you wish to take the test of blades or not? Or do you have one of my old trinkets you wish to trade in?");
	elseif(e.message:findi("trinkets")) then
		e.self:Say("Ahh, I've given out some lesser trinkets in the past that many have gotten bored with.  I'm willing to accept Aerated Pauldrons in trade for Pauldrons of the Blue Sky.");
	elseif(e.message:findi("blades")) then
		e.self:Say("The test of blades is not easy.  I hope you are as powerful as you are brave.  What do you wish to strive for? Strength, force, or skill?");
	elseif(e.message:findi("strength")) then 	--warrior test of strength
		e.self:Say("Remember, true strength lies not only in the body, but in the mind as well. Return to me a bronze disc, a small pick and a stone amulet. If you manage to do this my runed wind amulet will be yours.");
	elseif(e.message:findi("force")) then 		--warrior test of force
		e.self:Say("Foolishness or bravery Gendal?  We shall see. Return to me a pearlescent globe, a silver mesh and a spiroc air totem  In return, you will receive both my deepest respect and the aerated pauldrons.");
	elseif(e.message:findi("skill")) then 		--warrior test of skill
		e.self:Say("Test of skill it is. Go upward and retrieve these three items; an ivory tessera, a small ruby, and an azure ring. Return these to me and the azure ruby ring shall be yours.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20935, item2 = 20972, item3 = 20973})) then			--warrior test of strength using bronze disc, small pick, stone amulet
		e.self:Say("I am impressed, " .. e.other:GetCleanName() .. ". You are stronger than I thought.");
		e.other:QuestReward(e.self,0,0,0,0,14569,100000); 	--runed wind amulet
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20942, item2 = 20974, item3 = 20975})) then		--warrior test of force using pearlescent globe, silver mesh, spiroc air totem -- no reward text, confirmed
		e.other:QuestReward(e.self,0,0,0,0,27701,100000); 	--Pauldrons of the Blue Sky -- Original: Aerated Pauldrons (4321)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20928, item2 = 20970, item3 = 20971})) then		--warrior test of skill using ivory tessera, small ruby, azure ring
		e.other:QuestReward(e.self,0,0,0,0,14551,100000); 	--azure ruby ring
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
