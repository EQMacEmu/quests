function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Great, let us waste no more time! I offer to you four challenges. Disempowement, Envenoming, Raising of the Dead, or Necropotence. Choose one to be tested on.");
	elseif(e.message:findi("disempowerment")) then 		--shadowknight test of disempowerment
		e.self:Say("Disempowerment, destroying good magic. Proceed upward through the sky and return to me a Griffon Statuette, a Blood Sky Emerald, and Rusted Pauldrons. This will prove your abilities to me and I will reward you with Blood Sky Face plate.");
	elseif(e.message:findi("envenoming")) then 			--shadowknight test of envenoming
		e.self:Say("Venom and hate permeate us more than our dumber, larger brothers.  Return to me an efreeti war shield, a dark spiroc feather, and a shard of obsidian and prove that your soul is envenomed with hatred. If you do so, the obtenebrate mithril guard shall be yours.");
	elseif(e.message:findi("raising of the dead")) then --shadowknight test of raising of the dead
		e.self:Say("The dead are our allies against those that would oppose us. Proceed upward through the sky and return to me a Large Sky Pearl, a Jar of Honey, a Sphinxian Ring, and Fae Pauldrons. This will prove your abilities to me and I will reward you with an Pearlescent Pauldrons.");
	elseif(e.message:findi("necropotence")) then 		--shadowknight test of necropotence
		e.self:Say("Only the most powerful and vile of shadow knights manage to complete this test. Return to me an Efreeti War Axe, some Dulcet Nectar, a Bloodstained Hilt, and a Blood Sky Ruby. Doing so will earn you the right to wield the Drinker of Blood.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20950, item2 = 20703, item3 = 20704})) then 					--shadowknight test of disempowerment using griffon statuette, blood sky emerald, rusted pauldrons -- no reward dialogue, confirmed
		e.other:QuestReward(e.self,0,0,0,0,4322,100000); 	--blood sky face plate
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20705, item2 = 20957, item3 = 20706})) then 				--shadowknight test of envenoming using efreeti war shield, dark spiroc feather, obsidian shard
		e.self:Say("This shield of evil shall guard you well, dark one.");
		e.other:QuestReward(e.self,0,0,0,0,11678,100000); 	--obtenebrate mithril guard
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20707, item2 = 20708, item3 = 20709, item4 = 20710})) then 	--shadowknight test of raising of the dead using large sky pearl, jar of honey, sphinxian ring, fae pauldrons
		e.self:Say("Be fooled not by their appearance. They are as evil as you, and will protect you well.");
		e.other:QuestReward(e.self,0,0,0,0,11699,100000); 	--pearlescent pauldrons
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20711, item2 = 20964, item3 = 20713, item4 = 20712})) then 				--shadowknight test of necropotence using efreeti war axe, dulcet nectar, bloodstained hilt, blood sky ruby
		e.self:Say("The blade I have given you is called Khyldorn, Drinker of Blood.  It was forged a millennium ago and tempered in the blood of Veeshan herself.  Wield it well, " .. e.other:GetCleanName() .. ".  For if you do, it will never fail you.");
		e.other:QuestReward(e.self,0,0,0,0,27707,100000); 	--Khyldorn the Blood Drinker -- Original: Rheumguls (11679)
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
