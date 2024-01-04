local closeby = 0;

function event_say(e)
	if(closeby == 0) then
		if(e.message:findi("Hail")) then			
			if(e.other:GetFaction(e.self) <= 5) then -- requires indifferent faction
				e.self:Say("Ahhhgggg.. Those mangy [dogs] put up a tough fight.. If I don't make it back to the Clan House soon, it'll all be over for me.");
				eq.stop_follow();
				eq.stop_timer("cooldown");
				eq.start(75);
			else
				e.self:Say("What? Knowing how we feel about you and your reputation, not to mention the grief you've caused Master Lu'Sun, you would try to act as my friend?!?  Leave me alone!");
			end
		elseif(e.message:findi("dogs") or e.message:findi("mutts")) then
			e.self:Say("It's those Darkpaws.. They've beat me pretty badly.. but they'll get theirs soon enough!");
		elseif(e.message:findi("clan")) then
			e.self:Say("I am a new member of the Silent Fist Clan.. I need someone from my guild to help me find my way back.");
		elseif(e.message:findi("seta.* find you")) then
			e.self:Say("Oh.. Thank goodness you found me.. I'm lost and weak, those [mutts] are a vicious lot.. an you carry my [backpack] for me?");
		elseif(e.message:findi("carry.* backpack")) then
			e.self:Say("Thank you, friend.. Now, can you lead me back to Master Seta of the [Silent Fist Clan]? ");
			e.other:SummonCursorItem(13769); -- Ruined Backpack
		elseif(e.other:GetFaction(e.self) <= 5 and e.message:findi("lead.* seta")) then
			e.self:Say("Lead the way, and I shall follow. When we make it back, please inform Seta that you have rescued me.");
			eq.stop();
			eq.follow(e.other:GetID());
			eq.set_timer("cooldown",1800000);
		end
	end
end

function event_signal(e)
	if(e.signal == 1 and closeby == 0 and (e.self:GetX() >= 300 and e.self:GetX() <= 340) and (e.self:GetY() >= 250 and e.self:GetY() <= 285)) then
		e.self:Say("I am now accepting quests.");
		eq.stop_follow();
		e.self:SaveGuardSpot();
		closeby = 1;
		e.self:Say("Yes, he saved my life...  I owe him much thanks.  Please return my pack to me now, good friend.");
		eq.set_timer("cooldown",1800000);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(closeby == 1 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13769})) then --Ruined Backpack
		e.self:Say("Oh, you have the makings of a true hero.. The Silent Fist Clan is proud to have you as ally. May your soul guide and protect you through these chaotic times.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,309,35); 	-- Silent Fist Clan faction
		e.other:Faction(e.self,262,5);		-- Guards of Qeynos
		e.other:Faction(e.self,361,1); 		-- Ashen Order faction
		e.other:QuestReward(e.self,0,0,0,0,0,100);
		closeby = 2;
		eq.set_timer("cooldown",1200000);
	end
end

function event_timer(e)
	closeby = 0;
	eq.stop_follow();
	e.self:SaveGuardSpot(true);
	eq.start(75);
	eq.stop_timer("cooldown");
end
