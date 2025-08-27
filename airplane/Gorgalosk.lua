function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". This is my domain and I hope you have a peaceful stay. That is, unless the [lunatic sent you].");
	elseif(e.message:findi("lunatic sent me")) then
		e.self:Say("Oh, I see. I suppose you [want these cursed markers] that lunatic made me hold?");
	elseif(e.message:findi("cursed markers")) then
		e.self:Say("I am afraid that I can not just give them away. The lunatic had them cursed. They make me do [strange things]");
	elseif(e.message:findi("strange things")) then
		e.self:Say("Like ATTACK you!");
		eq.attack(e.other:GetName());
	end
end
