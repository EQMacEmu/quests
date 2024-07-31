function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Can't an elven woman get a drink without some adventurer hitting on her? Really!");
	elseif(e.message:findi("soldiers")) then
		e.self:Say("On one of the highest platforms, you can find the Soldiers of Tunare.  They are the druids of the Faydarks and even a few Koada'Dal are respected members.");
	elseif(e.message:findi("warrior guild")) then
		e.self:Say("The warriors of Kelethin are called the Emerald Warriors.  Their platform is near one of the lifts.");
	elseif(e.message:findi("forge")) then
		e.self:Say("I believe there is a public forge near one of the elevators.");
	elseif(e.message:findi("bank")) then
		e.self:Say("The Bank of Kelethin is a safe place to store your belongings. I believe it is near the ranger guild.");
	elseif(e.message:findi("inn") or e.message:findi("rest") or e.message:findi("sleep")) then
		e.self:Say("There are a few inns in Kelethin.  I recommend the Sleepy Willow Inn near the Emerald Warriors.");
	elseif(e.message:findi("tavern") or e.message:findi("bar")) then
		e.self:Say("In the trees of Kelethin you can find a tavern on just about every platform.");
	elseif(e.message:findi("emerald warrior")) then
		e.self:Say("The Emerald Warriors are the warriors of Kelethin.  It is from among their ranks that we draw the guards.  They have a guild house near one of the lifts.");
	elseif(e.message:findi("felwithe")) then
		e.self:Say("Within the Greater Faydarks one can find the entrance to the Koada'Dal city of Felwithe.  Just head east.");
	elseif(e.message:findi("healer")) then
		e.self:Say("If you require the talents of a healer, might I suggest visiting the Soldiers of Tunare? Or, you can visit the Clerics of Tunare in Felwithe.");
	elseif(e.message:findi("akanon")) then
		e.self:Say("You must venture through the Lesser Faydarks to get to the Steamfont Mountain Range and Ak'Anon");
	elseif(e.message:findi("butcher")) then
		e.self:Say("Find the road upon the floor of Greater Faydark and follow it to the Butcherblock Mountains and to the docks.");
	elseif(e.message:findi("kaladim")) then
		e.self:Say("Venture to the Butcherblock Mountains and you shall find Kaladim.  It will be impossible to miss from the road.");
	elseif(e.message:findi("leader") or e.message:findi("king") or e.message:findi("mayor")) then
		e.self:Say("The great city of Kelethin is ruled over by the Mayor of Kelethin.");
	elseif(e.message:findi("mayong") or e.message:findi("mistmoore")) then
		e.self:Say("Mayong Mistmoore is a reclusive person.  None have seen him.  He stays within Castle Mistmoore.  His supplies are picked up at the docks of Butcherblock by his servants.  Every so often they stop at Kelethin or Felwithe.  It is best they do not come at all.  They reek of evil.");
	elseif(e.message:findi("armor")) then
		e.self:Say("Armor is not easily found amongst our merchants.  I would suggest visiting the Koada'Dal city of Felwithe.");
	end
end