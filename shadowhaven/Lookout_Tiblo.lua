function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetins to ye, " .. e.other:GetCleanName() .. ". If ye can, avoid the two crazy gnomes on the other side of this pass we guard. All they do is bicker at each other, herts me ears sometimes. Ah well, have a great stay! Har!");
	end
end
