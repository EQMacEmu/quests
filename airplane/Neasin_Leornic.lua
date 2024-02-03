function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Great, let us waste no more time! Do you wish to begin your test of concentration, focus, or meditation?");
	elseif(e.message:findi("concentration")) then 	--wizard test of concentration
		e.self:Say("Concentration it is. Proceed upward through the sky and return to me an Azure Tessera, an Augmentor's Gem, and a Grey Damask Cloak. This will prove your ability to concentrate and I will reward you with an Augmentor's Mask.");
	elseif(e.message:findi("focus")) then 			--wizard test of focus
		e.self:Say("Focus is a must. Travel among the residents of the sky and bring to me an Iron Disc, an Ethereal Opal, and a Woven Skull Cap. This will prove your ability to focus and I will reward you with Al`Kabors Cap.");
	elseif(e.message:findi("meditation")) then 		--wizard test of meditation
		e.self:Say("Meditation, the fix for all. Fly to those above and return to me a Hyaline Globe, a Sky Topaz, and a High Quality Raiment. If you are successful, I will reward you with the Raiment of Thunder.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20930, item2 = 20741, item3 = 20742})) then 	--wizard test of concentration using azure tessera, augmentor's gem, grey damask cloak -- confirmed no reward dialogue
		e.other:QuestReward(e.self,0,0,0,0,1272,100000); --augmentor's mask
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20937, item2 = 20743, item3 = 20744})) then --wizard test of focus using iron disc, ethereal opal, woven skull cap -- confirmed no reward dialogue
		e.other:QuestReward(e.self,0,0,0,0,1271,100000); --Al`kabor's cap of binding
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20944, item2 = 20745, item3 = 20746})) then --wizard test of meditation using hyaline globe, sky topaz, high quality raiment
		e.self:Say("This mantle will sit well on your shoulders, " .. e.other:GetCleanName() .. ".  Take it as a reward for your troubles.");
		e.other:QuestReward(e.self,0,0,0,0,1273,100000); --raiment of thunder
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