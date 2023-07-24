-- Tanik Greskil dialogue - hand him a vial of velium vapors to complete quest

function event_spawn(e)
	eq.set_timer("faint",1000);
	eq.set_timer("moveloc",120000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Outlander! Thank Brell you've found me! I am the last surviving member of my unit. Our mission was somehow compromised, the bloody Kromrif knew just where to find us... I can't imagine how they knew. I was barely able to escape with my life and wandered into a trap here. I am badly hurt and need your help.");
	elseif(e.message:findi("help")) then
		e.self:Say("Quickly, give me a vial of Velium Vapors so I can return home, I am in desperate need of some attention from our clerics.");
	elseif(e.message:findi("velium vapor")) then
		e.self:Say("Drat! Are you telling me you don't have one with you? Run back to Thurgadin at once and speak with Frundle, she can make you one. I will do what I can to stay alive. I may need to move about a bit to keep from being discovered. Hurry now outlander, you're my only hope.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1553}, 0)) then
		e.self:Say("Thank you, " .. e.other:GetCleanName() .. ". I shall be eternally grateful to you. Should you ever require my assistance I pledge to you my aid. Please deliver this to Borannin, it is imperative that he deliver this to the Dain at once. Farewell for now outlander....");
		e.other:QuestReward(e.self,0,0,0,0,1560);
		eq.stop_timer("moveloc");
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if(e.timer == "faint") then
		eq.stop_timer("faint");
		e.self:SetAppearance(3);
	elseif(e.timer == "moveloc") then
		eq.stop_timer("moveloc");
		eq.depop();
	end
end

function event_death_complete(e)
	eq.stop_timer("moveloc");
end
