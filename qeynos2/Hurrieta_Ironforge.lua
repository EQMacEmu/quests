function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What are you doing back here?! I cannot stand it when the [children] allow their friends to run rampant on our estate. Please leave!");
	elseif(e.message:findi("children")) then
		e.self:Say("My dear sweet children are working in the storefronts. Well, all of them except for [Tayla].");
	elseif(e.message:findi("tayla")) then
		e.self:Say("Tayla! She is no Ironforge.");
	elseif(e.message:findi("weleana")) then
		e.self:Say("Waleana is a stain on Brohan's life. A horrid elf. She is gone now and Brohan has moved onto better things and more sanity.");
	elseif(e.message:findi("brohan")) then
		e.self:Say("Oh! You are here to see Brohan. My husband is upstairs. Feel free to pay him a visit, considering you have already set foot on our estate.");	
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 22) then
		e.self:Say("My roses are growing quite well.");
	end
end
