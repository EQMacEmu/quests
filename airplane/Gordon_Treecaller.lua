function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello " .. e.other:GetCleanName() .. ", I can only hope that my disturbance was necessary. Ahh, you seem to be decently adept with a blade. Would you like to be tested in the element of thunder, the blade, or the art of ranged attack?");
	elseif(e.message:findi("element of thunder")) then	--ranger test of the element of thunder
		e.self:Say("One of my greatest allies indeed. Thunder can be very powerful if used properly. Bring me a djinni statuette, a spiroc thunder totem, and a white gold earring. Then you will know the true power of nature.");
	elseif(e.message:findi("blade")) then --ranger test of the blade
		e.self:Say("Very good choice, my blade is my best friend and yours will be as well if you can complete this task. Retrieve an efreeti long sword, an emerald spiroc feather, some bitter honey, and a circlet of thorns. Be careful with the honey, if it is tainted the blade will not come to life.");
	elseif(e.message:findi("art of ranged attack")) then --ranger test of the art of ranged attack
		e.self:Say("Many of the fools on Norrath don�t realize how powerful a good bow can be. Many dread wolves have met their fate from my bow and you can have the same power if you can bring me back these items. Efreeti war bow, thickened nectar, a sphinx tallow, and a shimmering pearl.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20955, item2 = 20856, item3 = 20857})) then 					--ranger test of the element of thunder using djinni statuette, spiroc thunder totem, white gold earring
		e.self:Say("Great work, " .. e.other:GetCleanName() .. ", take this earring as a token of my admiration.");
		e.other:QuestReward(e.self,0,0,0,0,14568,100000); --thunderforged earring
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20859, item2 = 20860, item3 = 20858, item4 = 20962})) then 	--ranger test of the blade using bitter honey, circlet of brambles, efreeti long sword, emerald spiroc feather
		e.self:Say("You are indeed a ranger of noble bearing. The sword Arydryidriyorn will do well at your side.");
		e.other:QuestReward(e.self,0,0,0,0,27732,100000); --arydryidriyorn -- Original: Yannikil (11697)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20861, item2 = 20969, item3 = 20862, item4 = 20863})) then 	--ranger test of the art of ranged attack using efreeti war bow, thickened nectar, sphinx tallow, shimmering pearl
		e.self:Say("You are a walking legend, " .. e.other:GetCleanName() .. ". Please take Windstriker. It needs one such as yourself to wield it.");
		e.other:QuestReward(e.self,0,0,0,0,11696,100000); --windstriker
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