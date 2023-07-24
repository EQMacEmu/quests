function event_spawn(e)
	tellpause = 0;
	already_tell = 0;
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hmm? What do you want?");
	elseif(e.message:findi("diseased bear liver")) then
		e.self:Emote("clenches his teeth and speaks in a quiet but deadly tone, 'Keep your voice down you fool, mention of such a thing around here is dangerous! I'm always willing to help someone who shares the same... philosophy... as myself though. Are you [truly serious] about this?'");
	elseif(e.message:findi("truly serious")) then
		e.self:Say("Very well, follow me and we'll have a little chat then.");
		if(e.self:GetX() == 1830 and e.self:GetY() == 1316) then
			eq.move_to(1390,1360,19,0,true);
		elseif(e.self:GetX() == 1390 and e.self:GetY() == 1360 and already_tell == 0) then
			already_tell = 1;
			eq.set_timer("Secrets",2000);
		end
	end
end

function event_timer(e)
	if(e.timer == "Secrets") then
		eq.set_timer("Secrets",7000);
		tellpause = tellpause + 1;
		if(tellpause == 1) then
			e.self:Say("I had not pegged you as one allied with the Plaguebringer, may his blessing once again spread across the land.");
		elseif(tellpause == 2) then
			e.self:Say("So you wish for me to defile one of these so-called 'sacred' bears for you? I'm not sure what vile ritual you would need this liver for but I'd be delighted to assist you.");
		elseif(tellpause == 3) then
			e.self:Say("However, before I do this thing for you there's something I need for you to do for me to show your loyalty. And to help me to settle an outstanding score of course.");
		elseif(tellpause == 4) then
			e.self:Say("I want you to assassinate a Qeynos guard by the name of Nash. He has been a thorn in our side for some time. Bring me his head and I shall defile one of these bears for you.");
		elseif(tellpause == 5) then
			eq.move_to(1830,1316,-12,220,true);
			eq.stop_timer("Secrets");
			already_tell = 0;
			tellpause = 0;
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8276}, 0)) then -- head of nash
		e.self:Say("You've done well, I see we are of a like mind. I'll lure the bear outside so you can do your work.");
		eq.start(41);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 3) then
		e.self:Emote("holds a bit of food out to the bear cub, 'Want it?'");
		eq.signal(181102,1);
	elseif(e.wp == 4) then
		e.self:Say("Follow me then little bear");
	elseif(e.wp == 5) then
		e.self:Emote("gives the bear the tainted food.");
	elseif(e.wp == 6) then
		e.self:Say("The diseased within this food acts very quickly.  The bear should be maddened by the illness shortly and his liver suitable for harvest.");
		eq.signal(181102,2);
	end
end
