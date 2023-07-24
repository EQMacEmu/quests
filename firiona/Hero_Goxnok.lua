--This version of Hero Goxnok will lead us to the drachnid spy and the traitor. When the spy is killed, a second version of Goxnok will spawn, and he will reveal that he is in fact the traitor. This is all part of Greenmist quest number five.
function event_say(e)
	if(e.message:findi("charasis tome")) then
		e.self:Say("The Charasis Tome has been scribed and now another copy exists. The traitor obviously wants to keep a copy for himself. I am told you will deliver both copies to Lord Qyzar along with your zealot khukri and you shall be awarded that of a crusader. Let us rest for a minute and then I shall show you the meeting place.");
		eq.move_to(-1856,589,146,36,true);
		e.self:SetAppearance(1);
		e.self:Say("Come along. If we get separated, look for the humanoid wolf camp and beyond the tunnel, you shall find the meeting place of the spider riders and the traitor.");
		eq.set_timer("Talk1",180000);
	end
end

function event_signal(e)
	if(e.signal == 1) then
		eq.spawn2(84401,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop();
	end
end

function event_timer(e)
	if(e.timer == "Talk1") then
		e.self:Emote("stops abruptly and shudders with fear. 'Look!! There, past the wolf people. Near an ancient tunnel can be found the meeting place. I fear we may be too late. I thought I saw a shadow dash from the tunnels, but I did not see any spider riders. We'll see when we reach it.'");
		eq.stop_timer("Talk1");
		eq.set_timer("Talk2",30000);
	end
	if(e.timer == "Talk2") then
		e.self:Emote("looks over at you and sizes you up before continuing on. He says, 'We should continue, follow me.'");
		eq.stop_timer("Talk2");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
