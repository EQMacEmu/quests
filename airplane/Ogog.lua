function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ogog not smart, but Ogog smarter than you.  You ready for Ogog or no?");
	elseif(e.message:findi("ready")) then
		e.self:Say("Ok, " .. e.other:GetCleanName() .. ".  Ogog got some hard things for you.  You do bash, smash, or think test?");
	elseif(e.message:findi("think")) then 
		e.self:Say("Ogog think you can do this one maybe. Ogog no know, though. You bring Ogog efreeti belt, pegasus statue, a spiroc wind totem, and a wind tablet. Ogog say good luck!");
	elseif(e.message:findi("smash")) then
		e.self:Say("Ogog smash good. . . Ogog no think you can smash good.  But Ogog let you try.  You get Ogog Djinni War Blade, some virulent wasp poison, and a mottled spiroc feather.  Ogog say you good warrior if you do this!");
	elseif(e.message:findi("bash")) then
		e.self:Say("This one hard, Ogog like it.  Ogog need efreeti battle axe, some honey nectar, bottled djinni, and ethereal emerald. Then Ogog make you best basher.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20983, item2 = 20963, item3 = 20981,item4 = 20982})) then -- warrior test of bash using efreeti battle axe, honeyed nectar, bottled djinni, ethereal emerald
		e.self:Say("Good job! Ogog give you Fangol for being good smasher!");
		e.other:QuestReward(e.self,0,0,0,0,11675,100000); --fangol
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20980,item2 = 20979, item3 = 20956})) then -- warrior test of smash using djinni war blade, virulent poison, mottled spiroc feather
		e.self:Say("This Dagas, blade of stinging wind. You bash good with this.");
		e.other:QuestReward(e.self,0,0,0,0,11674,100000); -- dagas
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20976, item2 = 20977, item3 = 20978,item4 = 20949})) then -- warrior test of think using efreeti belt, spiroc wind totem, wind tablet, pegasus statuette -- no dialogue, verified
		e.other:QuestReward(e.self,0,0,0,0,11673,100000); -- belt of the four winds
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