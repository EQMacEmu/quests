function event_waypoint_arrive(e)
	if (e.wp == 5) then
		e.self:Say("Hey there Ronlotar! Mighty fine selection of footwear ya got here. How goes the business?");
		eq.signal(150269,1); -- NPC: Ronlotar_Stumpshade
	elseif (e.wp == 6) then
		e.self:Say("Ah of course I can see what ya mean, well im sure it will get better keep up the good work! I have been saving up some money im hoping to pick up a new pair of boots soon, keep me in mind for a discount!");
		eq.signal(150269,2); -- NPC: Ronlotar_Stumpshade
	elseif (e.wp == 10) then
		e.self:Say("Afternoon Lookout Gereol, everything is going good on this post as far as I can see.");
		eq.signal(150049,5); -- NPC: Lookout_Gereol
	elseif (e.wp == 17) then
		e.self:Say("Fall in Lookout! Whats that yer squintin at son, I can see ya strainin to see what lies right in front of you. Is this true?");
		eq.signal(150036, 5); -- NPC: Lookout_Valobolo
	elseif (e.wp == 18) then
		e.self:Say("All right then Lookout, wipe that blank look of yer face and back to your watch.");
	elseif (e.wp == 22) then
		e.self:Say("Afternoon Lookouts. I hope everything is in order here and the two of you arent yelpin at each other like usual. Here in the Short and Stout quarter we need to be focused on our task as Lookouts and not spendin time gripin at each other!");
		eq.signal(150034,5); -- NPC: Lookout_Falatalix
		eq.signal(150040,5); -- NPC: Lookout_Reloen
	elseif (e.wp == 31) then
		e.self:Say("Hail Lookouts! Great job youre both doing here, nobody else id rather have at the front line then my two finest Uhingil and Yereil. You both make me proud and make my mob a whole lot easier, Keep it up!");
		eq.signal(150021,5); -- NPC: Lookout_Yereil
		eq.signal(150043,5); -- NPC: Lookout_Uhingil
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oi there " .. e.other:GetCleanName() .. "! Not causing any trouble are ya? Well that's good to hear. Allow me to introduce myself. I am Head Guardsman Dalinastalarix the VI . I take pride in my position and care for my guardsmen the best I can. Well enough out me, enjoy your stay will ya? Perhaps we will share an ale or two over stories of battle.");
	end
end
