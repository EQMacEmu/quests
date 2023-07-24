function event_spawn(e)
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if ( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Say("I'm sure I have a few contacts who would be very pleased with this find.");
		end
	end	
end

function event_waypoint_arrive(e)
	if(e.wp == 16 or e.wp == 43 or e.wp == 70) then
		e.self:Say("Psst.. Hey, you there.. Yeah, you.. You need some [blank scroll sheets].. I just got a special shipment of things in.. Come on, it's just what you're looking for.. I know you.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("Do I know you? Don't stick your nose where it don't belong. It might just get cut off.");
		else
			e.self:Say("To a wanderer of the Karanas such as myself, you are as insignificant as the dirt I walk on.");
		end
	elseif(e.message:findi("blank") or e.message:findi("scroll") or e.message:findi("sheet")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("Blank scroll sheets, huh? You know, there seems to be a shortage of these around here lately. But, hey friend, ol' Denny-boy here would never steer you wrong. I'll sell you some for 2 gold. I know, I'm too kind.");
		else
			e.self:Say("To a wanderer of the Karanas such as myself, you are as insignificant as the dirt I walk on.");
		end
	elseif(e.message:findi("bandit") or e.message:findi("associate")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("My associates? Let's just say they run a small trading operation between here and [Highpass].");
		else
			e.self:Say("To a wanderer of the Karanas such as myself, you are as insignificant as the dirt I walk on.");
		end
	elseif(e.message:findi("highpass") or e.message:findi("highkeep")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("Highpass Hold... it's a good day's journey from here... And if I were you, I wouldn't travel it alone or at night.");
		else
			e.self:Say("To a wanderer of the Karanas such as myself, you are as insignificant as the dirt I walk on.");
		end
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {gold = 2})) then
		e.self:Say("Yeah, well, these are pretty hard to come by. In fact, these came all the way from Odus. Enjoy, and tell your buddies.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,223,1,0);		-- Circle of Unseen Hands
		e.other:Faction(e.self,291,-1,0); 	-- Merchants of Qeynos
		e.other:Faction(e.self,230,1,0); 		-- Corrupt Qeynos Guards
		e.other:Faction(e.self,262,-1,0); 	-- Guards of Qeynos
		e.other:Faction(e.self,273,1,0);		-- Kane Bayle
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,0,0,0,18006,100); -- Item: Blank Scroll Sheets
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18793})) then -- Should drop 13716 - Kerran Doll on death
		e.self:Say("What the heck is this?!? No money at all? You'll pay for this, you back-stabbing knave!");
		eq.attack(e.other:GetName());
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
