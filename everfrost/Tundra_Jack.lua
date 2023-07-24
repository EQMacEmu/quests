function event_spawn(e)
	e.self:SetRunning(true);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good mining to you, kid! What are you doing way out here? You're gonna catch frostbite. The name's Tundra Jack, prospector supreme. Trained by the finest miners in Kaladim!! Me 'n [Iceberg] have been out here for three years now, searchin' fer fortune.");
	elseif(e.message:findi("iceberg")) then
		e.self:Say("Iceberg used to be a beast.  He terrorized Halas for some time, then he met me.  I tamed the beast and now he watches my back.  You never know when the ice giants may go for a stroll from [Permafrost].");
	elseif(e.message:findi("permafrost")) then
		e.self:Say("If I knew that, I would be swinging my picks inside it already!  The entrance is said to be somewhere out here in Everfrost Peaks.");
	elseif(e.message:findi("sweaty shirt")) then
		e.self:Say("Looking fer that blasted shirt, huh?  Well, as you can smell, I didn't get to washing it, but I wrapped it onto Iceberg's collar. I'd say you can have it, but Iceberg kind of likes it now.  The only way you're gonna be able to grab it from him is to feed him his [favorite meal].");
	elseif(e.message:findi("favorite meal")) then
		e.self:Say("Iceberg has some picky eating habits.  If he can't catch any goblins, he prefers [Lion Delight].  Lion Delight is his favorite.");
	elseif(e.message:findi("lion delight")) then
		e.self:Say("I usually get Lion Delight from Teria O'Danos in Halas.");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("On my way, Iceberg!!");
		local mobtypeID =  eq.get_entity_list():GetMobByNpcTypeID(30062);

		if(mobtypeID) then
			local follow_mob = mobtypeID:GetID();
			eq.follow(follow_mob);
			eq.stop_timer("follow");
		end
	elseif(e.signal == 2) then
		e.self:Say("Ha!!  Looks like old Iceberg likes you.  Either that or he's tasting you.");
	elseif(e.signal == 3) then
		eq.stop_follow();
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 14 or e.wp == 45) then
		e.self:Say("Come on, Iceberg! Time to do a little mining.");
	elseif(e.wp == 16 or e.wp == 17 or e.wp == 18 or e.wp == 47 or e.wp == 48) then
		e.self:Say("Silver and Gold!!.. Silver and Gold!!");
	elseif(e.wp == 19 or e.wp == 49) then
		e.self:Say("Nothin'!!");
	end
end





-- END of FILE Zone:everfrost  ID:30069 -- Tundra_Jack
