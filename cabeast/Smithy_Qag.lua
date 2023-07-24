function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ".  We are exceptionally busy today - I trust that your business is of suitable import.'  Smithy Qag flicks his tail, covered with the scars of the forge.  'Or have you come to assist in our [new project]?");
	elseif(e.message:findi("new project")) then
		e.self:Say("It is quite remarkable.  We have come across a new material that allows  us to forge Skyiron to a new level of strength and flexibility.  Are you [interested] in such things?  I am known as a teacher among my peers.");
	elseif(e.message:findi("interested")) then
		e.self:Say("Excellent.'  Smithy Qag chuckles.  'With forging hammer, a little blessed amber, scale temper, an appropriate sectional mold, and several [infused scales] and [infused sheets] of Skyiron, we are working to outfit our troops.");
	elseif(e.message:findi("infused scale")) then
		e.self:Say("A small brick of skyiron, a small block of clay and celestial essence can be worked on the potter's wheel to produce the scales used to cover our armor.  They are lightweight, and incredibly strong.");
	elseif(e.message:findi("infused sheet")) then
		e.self:Say("Like the armor itself, these are a product of the Cabilis Forge.  Take a folded sheet of velium, and work in a large brick of skyiron using your smithy hammer.  You'll also need some mysterious [temper].");
	elseif(e.message:findi("temper")) then
		e.self:Say("Quite.'  Smithy Qag laughs to himself, and looks at you with interest, as if evaluating you.  'A traveler to the city presented a small quantity to me and suggested using it as I have told you.  Our elders have tried to identify the contents of the temper, with [limited success].");
	elseif(e.message:findi("limited success")) then
		e.self:Say("The base used is purified water, created by mixing two quantities of water to one quantity of celestial essence.  With the purified water is a [second ingredient], but we cannot ascertain what it is, precisely.");
	elseif(e.message:findi("second ingredient")) then
		e.self:Say("It appears to be a blue powder of some kind, and glimmers as if it were a melted gemstone.  Guesses are all we have.  When the supply we have runs out, we shall have to find the dark stranger again, I imagine, or attempt to make our own.");
	end
end

