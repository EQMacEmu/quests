function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Arrr.  Swab me ports and shiver me starboards!  Another mainlander, eh?  Come closer, laddy, I can't sees ya too well.  Arr, that's better.  If ya came fer frostbite, frozen pants, and an empty stomach then ya came to the right place.  Plenty o' sights ta see here.");
	elseif(e.message:findi("sight")) then
		e.self:Say("Sights?  Yar.  Lots of 'em.  Snow, ice, snow, water, snow, trees, snow, and then more snow.  Har!  This be the pumas' island but they're bein' 'friendly' enough ta let us live on it, provided we stay out of their line of sight, smell, hearing, and [stick to the coast].  Har har.");
	elseif(e.message:findi("coast")) then
		e.self:Say("Yar.  Just keep yer left shoulder ta the ocean, walk along the coast, and you'll be findin' our cozy home away from ship.  Just remember, we may be pirates but we're on the up an' up if yer not tryin' anythin' funny.  G'luck ta ye, laddy.");
	end
end