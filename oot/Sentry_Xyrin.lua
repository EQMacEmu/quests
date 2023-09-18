function event_spawn(e)
	eq.set_timer("depop",3600000);
	-- eq.set_anim(69132,1);
end

function event_spawn(e)
	eq.set_timer("overwhelming",1200000);
end

function event_timer(e)
	e.self:Say("Heeelp!  The evil undead on this isle are overwhelming!");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Shhhh!! Keep quiet! Can you not tell this island is inhabited by undead? I wish to take the fight to them, but I am weak from the [boat disaster].");
	elseif(e.message:findi("boat disaster")) then
		e.self:Say("I was returning to my temple in Freeport in a small boat when the storm hit. I soon found myself shipwrecked on this evil island of undead. The words of Marr tell me to destroy these beings, but I am far too weak. If I only had a sip of the [Potion of Marr].");
	elseif(e.message:findi("potion of marr")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Potion of Marr was created for the Sentries of Passion. It makes us alert and energetic. It will work only on sentries such as myself. It is distributed by Serna Tasknon of the Temple of Marr in Freeport.");
			eq.start(62);
			e.self:SetRunning(true);
		else
			e.self:Say("The passion of the Queen of Love does not favor you. Begone from my sight!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12134})) then
		e.self:Say("I thank you. I cannot do battle at this moment. I am summoned elsewhere. May Marr guide you from this isle.");
		e.other:Faction(e.self,362,20,0); -- Faction: Priests of Marr
		e.other:Faction(e.self,330,-3,0); -- Faction: The Freeport Militia
		e.other:Faction(e.self,281,3,0); -- Faction: Knights of Truth
		e.other:QuestReward(e.self,0,0,0,0,12135); -- Item: Empty Potion of Marr
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 4) then
		e.self:Shout("Long live Marr !!");
	elseif(e.wp == 5) then
		e.self:Say("Many thanks to all who aided in this battle. I offer you this, a weapon I found on a slain Erudite paladin. May Marr watch over his soul and may Marr guide yours. Now I must go.");
		eq.create_ground_object(5414,-6963,-886,139,0,1800000); -- deepwater harpoon
		eq.depop();
	end
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end
