function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	
	if(e.message:findi("hail")) then -- Part of Shaman Epic 1.0
		e.self:Emote("burps loudly in your face and says, 'Bah! Leave me be, fool! You have nothin' I want and I certainly have nothin' you want.");
	elseif(e.message:findi("you can buy booze") and qglobals["shamanbondl"] ~= nil) then -- Part of Shaman Epic 1.0
		e.self:Emote("suddenly becomes completely sober and says, 'Very well, shaman, please come with me.'");
		eq.unique_spawn(8117,0,0,62,66,32.1,254); -- NPC: a_greater_spirit
		if(e.self:GetX() == 407 and e.self:GetY() == 235) then
			eq.stop();
			eq.start(14);
		elseif(e.self:GetX() == 589 and e.self:GetY() == 472) then
			eq.stop();
			eq.start(15);
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1665})) then -- Part of Shaman Epic 1.0
		e.self:Say("WOW, thanks! This must be worth a fortune! I could drink for a month after sellin' this to one of them fool merchants. I'm going to see how much I can get for it right now!");
		e.other:Faction(e.self,404,100,0); -- Faction: True Spirit
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
		eq.set_global("shamanbondl","1",1,"F");
		eq.start(13);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_waypoint_arrive(e)
	if(e.wp == 6 and e.self:GetX() == 407 and e.self:GetY() == 235) then
		e.self:Say("What!? You don't approve of me buyin' some drinks with this gem? Who the heck are you to offer me a gift and order me what to do with it? Is this some kinda conditional kindness? Well? Are you gonna let me buy some booze with this or not?");
	elseif(e.wp == 12 and e.self:GetX() == 589 and e.self:GetY() == 472) then
		eq.stop();
	end	
end

-- EOF Bondl_Felligan
