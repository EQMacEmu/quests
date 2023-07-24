-- soulbound hammer - ranger epic

function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 20, e.self:GetX() + 20, e.self:GetY() - 20, e.self:GetY() + 20);
end

function event_enter(e)
	eq.set_timer("chatter",10000);
end

function event_exit(e)
	eq.stop_timer("chatter");
end

function event_timer(e)
	if(e.timer == "chatter") then
		e.self:Emote("whimpers pathetically as his reflection catches his eye. He turns and stares pitifully at the ceiling.");
		e.self:Emote("shields his eyes from his reflection in the water, occasionally gibbering as he scratches at a flapping, rotted patch of skin on his sunken face. In his arms he cradles something. He seems to emanate an aura of power.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 17860})) then
		e.self:Emote("howls in anger, his body seeming to suck energy from the walls around him as he sees his reflection. He pulls a hammer from the bundle in his arms and swings fiercely at your head.");
		eq.spawn2(39154,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.depop_with_timer();
		eq.stop_timer("chatter");
		eq.clear_proximity();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
	eq.stop_timer("chatter");
	eq.clear_proximity();
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
