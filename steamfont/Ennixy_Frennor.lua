--Ennixy_Frennor.pl
--Part of Innoruuk Regent
local wait = 0;

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Unless you have something to tell me about yourself that I could possibly be interested in, be gone!");
	elseif(e.message:findi("hate be my guide")) then
		e.self:Say("So you work for Szorn eh? It's about time he sent someone to check up on me! The Koada'Dal in possession of the crate is on his way here right now to cut a deal with me. I have been trying to send word to Szorn for several days to send support as I do not plan on allowing the elf to leave these mountains alive. You have arrived just in time. Kill the elf and the crate is yours!");
		if( wait == 0) then
			eq.set_timer("Swiftmoon", math.random(30000, 600000));
			wait = 1;
		end
	elseif(e.message:findi("wormwood")) then
		e.self:Say("Wormwood? Why do you want that? OH nevermind. Here! Take it and leave me alone! You're wasting my valuable time!");
		e.other:SummonCursorItem(10265); --Sprig of Wormwood
	end
end

function event_timer(e)
	if(e.timer == "Swiftmoon") then
		eq.stop_timer("Swiftmoon");
		eq.unique_spawn(56150,0,0,-836,1385,-110,128); --Crusader Swiftmoon
		wait = 0;
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
