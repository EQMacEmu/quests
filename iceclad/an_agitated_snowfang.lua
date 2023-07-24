function event_spawn(e)
	eq.set_timer("depop",90000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("shivers and growls to itself.  'Much thanks must I give " .. e.other:GetCleanName() .. ".  Furless one still wants magic thing, after all the troubles?  Say quickly.  Much pain from attack.  Must go, shaman help.'");
	elseif(e.message:findi("magic thing")) then
		e.other:QuestReward(e.self,0,0,0,0,30042);
		eq.stop_timer("depop");
		eq.depop();
	end
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end
