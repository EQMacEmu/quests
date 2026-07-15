function event_say(e)
	if(e.message:findi("where.* bank") or e.message:findi("where.* vault")) then
		e.self:Say("Journey to the north side of Freeport. It is near the Jade Tiger Inn.");
	elseif(e.message:findi("where.* inn") or e.message:findi("where.* sleep")) then
		e.self:Say("There are a few inns in Freeport, but personally, I would suggest the Hog Caller's Inn near the Militia House.");
	elseif(e.message:findi("where.* arena")) then
		e.self:Say("The arena is in west Freeport. It is a fine place to test one's mettle and, from time to time, we even have public executions there. Its only fault is that it is maintained by the Steel Warriors.");
	elseif(e.message:findi("where.* weapon")) then
		e.self:Say("Head to East Freeport and buy from Hallard's. Any other weapon shop would be a waste of hard earned gold.");
	elseif(e.message:findi("where.* warrior guild") or e.message:findi("where.* bunker") or e.message:findi("who.* steel warrior")) then
		e.self:Say("In this city you shall find the bunker next to the arena in western Freeport. It is the bunker which acts as headquarters for the Steel Warriors of Freeport. Many of us guards hail from these training grounds, but have decided to join the Freeport Militia, in hopes of making this city great once again. The Steel Warriors have lost all sense of what it means to be a warrior. They are nothing more than paper tigers now.");
	elseif(e.message:findi("where.* wizard guild") or e.message:findi("where.* magician guild") or e.message:findi("where.* enchanter guild") or e.message:findi("where.* academy.* arcane")) then
		e.self:Say("In the west end of this city sits the Academy of Arcane Science. It is in this marvel of magic that the Arcane Scientists study their arts. Their alliance with the weak Knights of Truth has cost them our total trust. If it were not for the need of their magic to assist in the flow of the Freeport aqueducts, they would be forced from this city.");
	elseif(e.message:findi("where.* rogue guild")) then
		e.self:Say("Are you a rogue?! I pray not. We do not tolerate such activity in Freeport. Use your talents elsewhere by joining the Freeport Militia. We could use you.");
	elseif(e.message:findi("where.* tavern") or e.message:findi("where.* bar")) then
		e.self:Say("Ahh. Fine drink and fine food is your aim. Try the Seafarer's Roost in Freeport Harbor. Wherever you go, do not go into the Grub N'Grog. That tavern is militia territory.");
	elseif(e.message:findi("where.* paladin guild") or e.message:findi("where.* temple.* marr") or e.message:findi("who.* knight.* truth")) then
		e.self:Say("In the northern portion of this city you will find the Hall of Truth and the Temple of Marr. The hall is the home of the Knights of Truth. These knights were once the great defenders of this city. Weak and pathetic are the Knights of Truth now. Sir Lucan was the last great knight to hail from that soon to be extinct brotherhood. These knights insist on patrolling their own streets. Bah! Better that we do not waste our time.");
	elseif(e.message:findi("where.* necromancer guild") or e.message:findi("who.* dismal rage")) then
		e.self:Say("What nonsense do you speak?! I have never heard of such a thing.");
	end
end
