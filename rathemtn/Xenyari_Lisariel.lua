function event_spawn(e)
	eq.set_timer("wish",800000);
end

function event_timer(e)
	if(e.timer == "wish" and not e.self:IsEngaged())then
		e.self:Say("Oh, I wish I had a prickly pear.  I just have this insatiable craving for a prickly pear.  But Permafrost is just so far! <Sigh.>");
		eq.stop_timer(e.timer);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ".");
	elseif(e.message:findi("prickly pear")) then
		e.self:Say("Yes, yes! Prickly pears! Do you have any? I just love prickly pears but Permafrost is just so far away even for us druids.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10195})) then
		e.self:Say("Prickly pears! I just love prickly pears!! Thank you so much for getting these for me. I really, really appreciate your gift and I shall not.. OWW!! I hate it when I stick myself with the needles! Oh look, I am bleeding now! <Sigh.> Can you hold this note for a moment, please? My hands are full and I must clean up.");
		e.other:QuestReward(e.self,0,0,0,0,10196,1000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10193})) then
		e.self:Emote("bounces around with glee at the sight of your gift, smiles at you, and dons the telesm. As she clasps the telesm around her neck, she begins to writhe in agony, and slowly fades from sight leaving just the telesm, which is now pulsating with vibrant energy.");
		e.other:QuestReward(e.self,0,0,0,0,10194,1000);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:rathemtn  ID:50271 -- Xenyari_Lisariel
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------