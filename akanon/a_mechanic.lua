function event_say(e)
	if(e.message:findi("clockwork")) then
		e.self:Say("The clockworks of Ak'Anon are automata created by the Eldritch Collective.  They come in many models from combat to service.  All are formidable opponents.");
	elseif(e.message:findi("necromancer guild") or e.message:findi("shadowknight guild")) then
		e.self:Say("Hold thy tongue!  Only a follower of Meldrath the Mad would ponder such things!  King Ak'Anon has forbidden the black arts.");
	elseif(e.message:findi("oven")) then
		e.self:Say("I have not seen an oven within Ak'Anon.  All our food is created by clockworks and you cannot possibly use one of those.");
	elseif(e.message:findi("wizard guild") or e.message:findi("enchanter guild") or e.message:findi("magician guild")) then
		e.self:Say("All three true circles of magic are studied within the walls of the Library of Mechanimagica.  It sits high in the central cavern near the zoo.");
	elseif(e.message:findi("armor")) then
		e.self:Say("The finest armor is forged and sold at the Forge of Defiance which is near Ak'Anon Zoo.");
	elseif(e.message:findi("forge")) then
		e.self:Say("I don't believe I have seen one open to the public.  I may be wrong.  If you are referring to the Forge of Defiance, it is near the zoo.");
	elseif(e.message:findi("gemchopper")) then
		e.self:Say("In Gemchopper Hall you will find our warriors, the Gemchoppers. It is from among their ranks that we recruit our Watchmen.");
	elseif(e.message:findi("food")) then
		e.self:Say("If you are hungry, you can find food sold by many clockwork merchants.  If you need rations for adventuring, you should visit The Works on the lake's edge.");
	elseif(e.message:findi("inn") or e.message:findi("rest") or e.message:findi("sleep")) then
		e.self:Say("Rest is what you seek.  Venture over to Ak'Anon's Zoo.  Within its structure you shall find this city's only inn.");
	elseif(e.message:findi("weapon")) then
		e.self:Say("Weapons are forged and sold at the Tools of Battle near Ak'Anon Zoo.  You can also find weapons at the warrior guild, Gemchopper Hall.");
	elseif(e.message:findi("monk guild") or e.message:findi("bard guild") or e.message:findi("shaman guild") or e.message:findi("druid guild") or e.message:findi("ranger guild")) then
		e.self:Say("We have no need for such a guild within Ak'Anon.");
	elseif(e.message:findi("dark reflection")) then
		e.self:Say("The Dark Reflection is said to be all that is left of Meldrath's followers.  Unlike the Asylum, these were not insane gnomes, but rather evil twisted and intelligent gnome warriors, rogues, necromancers and such.  Some say they exist within Ak'Anon itself.  I say that is madness.");
	end
end