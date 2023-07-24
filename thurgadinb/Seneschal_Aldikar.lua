function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("And a good day to you, " .. e.other:Race() .. ". I must say that I'm impressed that your people were even able to make it to our continent, let alone survive the frigid temperatures of it. I am Seneschal Aldikar, Commander of the Armies of Thurgadin, known by some as the Sword of the Dain. My armies are currently undergoing intensive training and are ready for a full assault on Kael Drakkel as soon as his majesty gives the order.");
	elseif(e.message:findi("accept this task")) then
		e.self:Say("In this box, place the accursed dirk of the fallen Rodrick. With it combine the heads of every traitor you dispose of. When this is done give the box and the velium insignia ring to the Dain directly. On behalf of the crown and all good Coldain, I thank you ... May Brell be with you.");
		e.other:SummonCursorItem(17055); -- Item: Traitors Bane Box
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30164}, 0)) then
		if(e.self:GetX() == -3 and e.self:GetY() == 693) then
			e.self:Say("'Well done, " .. e.other:GetCleanName() .. ", I have heard of your victory over the Ry`Gorr. If you are willing to assist the crown further please follow me.");
			e.other:QuestReward(e.self,{itemid = 30164}); -- Item: Velium Coldain Insignia Ring
			e.self:CastToNPC():AssignWaypoints(14);
		else
			e.self:Say("" .. e.other:GetCleanName() .. " I must speak to the Dain before I instruct you further. Please speak to me while the royal court is in session.");
			e.other:QuestReward(e.self,{itemid = 30164}); -- Item: Velium Coldain Insignia Ring
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 15) then
		e.self:Say("Please, shut the door behind you. What I am about to share with you must not be overheard.");
	elseif(e.wp == 16) then
		e.self:Say("My army stands prepared to launch an assault on Kael itself, but one task must be completed before this can happen.");
	elseif(e.wp == 17) then
		e.self:Say("It seems Rodrick was not alone in his treachery. There is a faction of Coldain who believe that a treaty should be signed with the Kromrif, ending our hostilities with them. This, of course, is impossible. If there is one thing our history here has taught us, it is that the Kromrif simply cannot be trusted.");
	elseif(e.wp == 18) then
		e.self:Say("These traitors are poisoning the minds of our citizens, promising great rewards to those who will betray the Dain. It will take the unbiased eye of an outlander to flush out the masterminds behind this plan. Once again we turn to you.");
	elseif(e.wp == 19) then
		e.self:Say("Will you accept this task, outlander?");
	elseif(e.wp == 20) then
		e.self:Say("Farewell.");
	elseif(e.wp == 31) then
		e.self:CastToNPC():StopWandering();
	end
end
