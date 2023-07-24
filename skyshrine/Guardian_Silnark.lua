function event_waypoint_arrive(e)
	if(e.wp == 5) then
		e.self:Say("Greetings Xatyl, how goes the watch?");
		rand = math.random(2);
		if(rand == 1) then
			eq.get_entity_list():GetMobByNpcTypeID(114477):Say("Not very good, there are rumors that the giants are planning another invasion of the shrine.");
			e.self:Say("I'm sure Kin Erepon will agree that we are prepared for any attack that anyone may throw at us.");
			eq.get_entity_list():GetMobByNpcTypeID(114576):Say("Aye, the herald has prepared a very devastating welcome for any attackers.");
			e.self:Say("Well, I have many more rounds to do before I can end my watch. Farewell.");
			eq.get_entity_list():GetMobByNpcTypeID(114477):Say("Farewell");
		else
			eq.get_entity_list():GetMobByNpcTypeID(114477):Say("It goes well, tho there are rumors of new creatures in the shrine, we must be ever watchful.");
			e.self:Say("We have defended the shrine from many others, this one should be no more dangerous.");
			eq.get_entity_list():GetMobByNpcTypeID(114477):Say("Perhaps, but the herald says these new creatures may have even killed dragons!  This would be a most fearsome foe if that's true.");
			e.self:Say("Aye, well I must see to the other Kin, fairwell.");
		end
	elseif(e.wp == 13) then
		e.self:Say("Greetings Kin Sarot, How goes this day?");
		rand1 = math.random(3);
		if(rand1 == 1) then
			eq.get_entity_list():GetMobByNpcTypeID(114554):Say("I have a meeting with the herald later today about our new visitors");
			eq.get_entity_list():GetMobByNpcTypeID(114519):Say("Would you like me to accompany you to the meetIng Kin Sarot?");
			eq.get_entity_list():GetMobByNpcTypeID(114554):Say("I will be fine Synarus, after I leave just await my return.");
		elseif(rand1 == 2) then
			eq.get_entity_list():GetMobByNpcTypeID(114554):Say("We've been having trouble with the cubes again.  They seem to have a new taste for our Velium servants.");
		else
			eq.get_entity_list():GetMobByNpcTypeID(114554):Say("The day goes well. I have nothing going on for me today.");
			e.self:Say("This is Indeed great news.  I was hoping to hear that from someone this day.");
		end
	end
end
