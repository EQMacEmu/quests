function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("" .. e.other:GetCleanName() .. "!  Well met!  Come away from Sir Ranlon's forge one moment so that we may talk.'  Issilyn steps away from the forge with a smile.  'We live in interesting times!  Have you heard of Sir Ranlon's [armor]?");
	elseif(e.message:findi("armor")) then
		e.self:Say("Ah, it is impressive indeed.  Already, he has several dozen orders from the naval merchant crews, and several from... less honourable individuals.  He has pioneered a [method] of creating unrusting, light and very durable armor - perfect for the sea!");
	elseif(e.message:findi("method")) then
		e.self:Say("With a smithy hammer, using the Freeport Traditional Forge, he uses a leather piece of armor as the base.  With a little sea temper, a chainmail pattern, and some [infused rings], the armor is constructed.  Isn't it a lovely colour?");
	elseif(e.message:findi("infused ring")) then
		e.self:Say("Velium rings are the basis of this armor, and with a smithy hammer, one strengthens them with a large brick of medium quality ore.  However, the secret to this strengthening technique lies in the power of a [strange temper].");
	elseif(e.message:findi("strange temper")) then
		e.self:Say("Well may you ask.  I wish that I could answer your question, Downz, it baffles us too.'  Issilyn looks around to ensure that there is no one within earshot.  'We buy it on the Freeport black market, there is very little that cannot be bought in such a bustling city as this.  I do not know from where you could acquire it.");
	end
end