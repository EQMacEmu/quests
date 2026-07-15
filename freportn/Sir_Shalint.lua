function event_say(e)
	if(e.message:findi("where.* bank") or e.message:findi("where.* vault")) then
		e.self:Say("You're in the correct part of town for that. It is next to Tassel's Tavern and the Jade Tiger Inn.");
	elseif(e.message:findi("who.* leader")) then
		e.self:Say("Sir Valeron Dushire is the most enlightened Knight of Truth. He trained the fallen knight, Sir Lucan.");
	elseif(e.message:findi("where.* arena")) then
		e.self:Say("The arena of Freeport is located in the west side of the city.");
	elseif(e.message:findi("where.* weapon")) then
		e.self:Say("Close by here, in this district, you will find Groflah's Forge. He is a good man as well as a fine weaponsmith. I would also advise you not to purchase weapons from Hallard's in the port district. They only deal in inferior merchandise.");
	elseif(e.message:findi("where.* warrior guild") or e.message:findi("where.* bunker") or e.message:findi("what.* bunker")) then
		e.self:Say("The bunker can be found just to the side of the arena in west Freeport. It is home to the Steel Warriors, a fine group of fighters, though they could mend their souls better with a little less revelry and spirits.");
	elseif(e.message:findi("who.* lucan")) then
		e.self:Say("Sir Lucan D'Lere would be the so called ruler of this city. He used to be one of us. Now he is our sworn enemy.");
	elseif(e.message:findi("where.* rogue guild")) then
		e.self:Say("Do not ask me such a ridiculous question. If the Knights of Truth knew of such a place in Freeport, it would be destroyed.");
	elseif(e.message:findi("where.* tavern") or e.message:findi("where.* bar")) then
		e.self:Say("You may find good food and spirits in Tassel's Tavern. It is here in this district.");
	elseif(e.message:findi("where.* paladin guild") or e.message:findi("where.* temple.* marr")) then
		e.self:Say("The Hall of Truth is located right here in North Freeport. That is where we Knights of Truth hone our skills and strengthen our faith in the Truthbringer.");
	elseif(e.message:findi("who.* truthbringer") or e.message:findi("who.* mithaniel")) then
		e.self:Say("Mithaniel Marr is known as the Truthbringer. Those who follow his word live lives of valor and nobility.");
	elseif(e.message:findi("who.* marr")) then
		e.self:Say("You must be more precise. There are two Marrs. Erollisi and Mithaniel Marr. The twin deities.");
	elseif(e.message:findi("where.* bard guild") or e.message:findi("where.* marsheart")) then
		e.self:Say("The bards of the Choir of Lore hang their lutes right here in the north side of the city, at a place called Marsheart's Chords.");
	elseif(e.message:findi("what.* knight.* truth")) then
		e.self:Say("I am a proud member of the order of the Knights of Truth just as are all of the guards who patrol the northern territory of Freeport. We do not allow the Freeport Militia into our side of town and they know better than to try and enter.");
	elseif(e.message:findi("where.* monk guild") or e.message:findi("where.* ashen house")) then
		e.self:Say("The Ashen House would be home to the monks of the Ashen Order and you can find it in West Freeport.");
	elseif(e.message:findi("who.* coalition")) then
		e.self:Say("All the merchants of Freeport are required to join the Coalition of Tradesfolk. If you are a merchant, I suggest you go and find the Coalition House and register. It would be best to request space in this part of Freeport, unless you like to share a percentage of your profits with the Freeport Militia.");
	end
end
