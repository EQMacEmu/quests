function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to Gord's Smithy!! What brings you to our shop this good day? Is it our lavish assortment of weapons? Or perhaps it is to learn the art of the [seafarers' buckler] and [seafarers' weapons]?");
		e.self:DoAnim(49);
	elseif(e.message:findi("buckler")) then
		e.self:Say("Seafarers' bucklers are light shields, perfect for sailors, pirates, and anyone who frequently spends time on the seas. The bucklers can only be crafted in the unique forge here in Freeport. If you're interested in attempting a seafarers' buckler, you will need a buckler mold, a flask of water, a smithy hammer, and a high quality sheet of metal.");
	elseif(e.message:findi("weapon")) then
		e.self:Say("Seafarers' dirks, cutlasses, and harpoons are specially designed for the corrosive salt air and unsteady footing of life at sea. They can only be crafted at the unique forge here in Freeport. If you're interested in attempting to craft seafarers' weapons you will need a flask of water, the appropriate molds for the blade, hilt, and pommel, or a spear head mold and oak shaft for the harpoon, and the appropriate metals. Daggers and harpoons require medium quality sheets of metal, and cutlasses require a medium quality folded sheet of metal. There are also ways to craft magical types!");
	end
end
