function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Great, let us waste no more time! Do you wish to begin your test of Deception, Stealth, or Cunning?");
	elseif(e.message:findi("deception")) then 	--rogue test of deception
		e.self:Say("Deception it is.  Proceed upward through the sky and return to me the honied nectar, a bixie stinger from this plane, a lightning rod, and a bloodsky sapphire for the test of deception and earn Thornstinger, dirk of rampage.");
	elseif(e.message:findi("stealth")) then 	--rogue test of stealth
		e.self:Say("Stealth is a must.  Travel among the residents of the sky and bring to me a pegasus statuette, a prismatic sphere, and a fine wool cloak.  In return, the shimmering bracer of protection shall be yours.");
	elseif(e.message:findi("cunning")) then 	--rogue test of cunning
		e.self:Say("Cunning, the true source of all rogue power.  Plan and succeed above us and return to me a bronze disc, a Jester's Mask, and some red face paint to complete the test of cunning.  The crystal mask shall be yours if you do so.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20963, item2 = 20994, item3 = 20995, item4 = 20996})) then  	--rogue test of deception using honeyed nectar, bixie stinger, lightning rod, bloodsky sapphire
		e.self:Say("They call this blade 'Rampage Bringer'. Use it wisely and it will serve you well.");
		e.other:QuestReward(e.self,0,0,0,0,27704,100000); -- Thornstinger -- Original: Ebonsting (11677)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20949, item2 = 20990, item3 = 20991})) then 	--rogue test of stealth using pegasus statuette, prismatic sphere, fine wool cloak
		e.self:Say("I hope you find this bracelet of many colors useful in your journeys. Use its abilities wisely, " .. e.other:GetCleanName() .. ".'");
		e.other:QuestReward(e.self,0,0,0,0,27703,100000); -- Shimmering Bracer of Protection -- Original: Scintillating Bracer of Protection (2701)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20935, item2 = 20987, item3 = 20986})) then 	--rogue test of cunning using bronze disc, jester's mask, red face paint
		e.self:Say("Take this mask, " .. e.other:GetCleanName() .. ". It will aid you in the art of stealth.");
		e.other:QuestReward(e.self,0,0,0,0,27702,100000); -- Crystal Mask -- Original: Transparent Mask (2702)
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
