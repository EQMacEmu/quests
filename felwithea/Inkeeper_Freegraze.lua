function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Traveler's Home, owned and operated by the House of Freegaze... err, I mean Freegraze, established in the year 2855. We gladly open our doors to any weary traveler. What can I do for you?");
	elseif(e.message:findi("tolon nurbyte")) then
		e.self:Say("So you are inquiring about Mister Tolon Nurbyte, eh? He is on the second floor, last door on the right. You two had best not be up to any mischief. The pair of you look a little shifty for the kingdom of Felwithe.");
		eq.unique_spawn(61095,0,0,-343,155,17,8); -- NPC: Tolon_Nurbyte
	end
end
