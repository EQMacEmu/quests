function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. " .. e.other:GetCleanName() .. "! I patrol Halas to insure the safety of the travelers and the resident clans. Just ask if you need help in finding your destination.");
	elseif(e.message:findi("bank")) then
		e.self:Say("Follow me! I will lead you there.");
		eq.move_to(122, 193, 6, 213,false);
	elseif(e.message:findi("shaman guild")) then
		e.self:Say("Follow me! I will lead you there.");
		eq.move_to(332, 330, 4, 59,false);
	elseif(e.message:findi("warrior guild")) then
		e.self:Say("Follow me! I will lead you there.");
		eq.move_to(-422, 483, 4, 0,false);
	elseif(e.message:findi("rogue guild")) then
		e.self:Say("Follow me! I will lead you there.");
		eq.move_to(153, 273, 9, 64,false);
	elseif(e.message:findi("dock")) then
		e.self:Say("Follow me! I will lead you there.");
		eq.move_to(8, -17, 4, 128,false);
	elseif(e.message:findi("who.* shaman")) then
		e.self:Say("The Shamans of Justice serve the will of the Tribunal. They search out those who defy the laws set by the Tribunal.");
	elseif(e.message:findi("who.* rogue")) then
		e.self:Say("The Rogues of the White Rose are loyal to the city of Halas. For that, they are viewed with the same respect as all other residents.");
	elseif(e.message:findi("wolves")) then
		e.self:Say("The Wolves of the North comprise of warriors. It is their sole purpose to defend the city and its visitors from all those that would harm it. Becoming a warrior and thus a Wolve of the North holds the highest form of honor among the clans.");
	elseif(e.message:findi("gnoll")) then
		e.self:Say("The vermin you speak of come from the den of Blackburrow. It is your duty to remove them from the Peaks of Everfrost.");
	end
end