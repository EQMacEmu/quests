-- refined ancient sword - ranger epic
function event_spawn(e)
	eq.set_timer("depop",1800000);
end

function event_timer(e)
	eq.depop();
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Took ya long enough! Ye'd think ya had an Orc head on them shoulders there. I'm owin' ya for yer help though. Else I'd have been on that darn hammer for ages. Ye said ya had an ancient blade or somethin ta be smithin. If so lemme see it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20477},0)) then
		e.self:Emote("admires the blade and then starts to bang the edge with a hammer. 'Hah, that was a good blade, no doubt. Ain't seen one I couldn't make better though. I'm knowin' yer cause and all I know is ye should take that ancient blade ta yer friend in the woods, he'll know what to do now. With that I'm gonna be takin muh leave. Debt paid and all. If'n yer wantin' another blade, which ye do, ye got enough ore left that Kinlo can do it for ye'");
		e.other:QuestReward(e.self,0,0,0,0,20481); --refined ancient sword
		eq.depop();
	end
end
