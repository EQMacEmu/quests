function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Maiden's Fancy. We aim to please. You just be careful how you handle the ladies or I will have Ratraz remove you and your hands.");
		e.self:DoAnim(48);
	end
end