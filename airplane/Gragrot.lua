function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail! So you think you are a mighty Knight of Shadows? We must test these skills. Are you ready to begin the test?");
	elseif(e.message:findi("ready")) then
		e.self:Say("Great, let us waste no more time! I offer to you three challenges: Bash, smash, or slash. What do you wish to be tested in?");
	elseif(e.message:findi("bash")) then	--shadowknight test of bash
		e.self:Say("Gragrot like bashin.  Gragrot say you like bashin too!  Give Gragrot an ebon tessera, a sphinx eye opal, and a finely crafted amulet.  Gragrot then give you amulet of the sphinx eye.");
	elseif(e.message:findi("smash")) then 	--shadowknight test of smash
		e.self:Say("Gragrot wants you smashin.  Smash, smash, and return a copper disk, a small sapphire, and a silvery ring.  Then Gragrot give you crimson ring of the djinni.");
	elseif(e.message:findi("slash")) then 	--shadowknight test of slash
		e.self:Say("Gragrot see you is powerful, but Gragrot wonders if you is good at Slashin. Gragrot says return with a Diaphanous Globe, a piece of dried leather, and a Finely Woven Cloth Belt. Gragrot then give you pegasus hide belt.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20929, item2 = 20997, item3 = 20998})) then 	--shadowknight test of bash using ebon tessera, sphinx eye opal, finely crafted amulet
		e.self:Say("Gragrot see uuz strong barsher so Gragrot give uuz amulet!");
		e.other:QuestReward(e.self,0,0,0,0,27705,100000); -- Amulet of the Sphinx Eye -- Original: Sphinx Eye Amulet (14554)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20936, item2 = 20999, item3 = 20700})) then --shadowknight test of smash using copper disc, small sapphire, silvery ring
		e.self:Say("Gragrot give uuz ring, now uuz use it!");
		e.other:QuestReward(e.self,0,0,0,0,27706,100000); --Crimson Ring of the Djinni -- Original: Djinni Finger Ring (14553)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20943, item2 = 20701, item3 = 20702})) then --shadowknight test of slash using diaphanous globe, dried leather, finely woven cloth belt
		e.self:Say("Take this belt with the blessing of Veeshan, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,2704,100000); --pegasus-hide belt
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