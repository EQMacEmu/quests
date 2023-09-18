function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail stranger!  I see that you are not from around these parts.  Do you wish to stay or are you passing through?");
	elseif(e.message:findi("stay")) then
		e.self:Say("You wish to stay?  Good, we could use the extra help here.  There are many things to do here in Froststone.  The most important of which is the welfare of our keep. Everyone here works their fair share here, lest the monsters overrun us.  Don't you forget that if you want to stay here and stay alive.");
	elseif(e.message:findi("passing")) then
		e.self:Say("Fine.  Then dally not in my keep, outsider.  You are on your own.  Begone!");
	elseif(e.message:findi("burdael")) then
		e.self:Say("Eh? Burdael? Well, he was a hunter. Clan Flying Axe I believe. He died some time ago, before the Krom Zek found our home. Apparently he saw a Dragon once, or so goes the legend. After his meeting of the beast, he no longer showed fear in the face of any challenge. He was a courageous warrior, however it got him killed in the end.");
	elseif(e.message:findi("end")) then
		e.self:Say("He went on many adventures. The last was on an expedition deeper into our own mines, which had been gradually overgrown with monsters and the like. He was never seen again, nor his famous axe, Onyxbrand. Most of us believe that his ghost still haunts the lower halls. If yer brave enough, the Historian may be able to help ya meet him. But ye gotta give him some sorta record of Burdael's deeds. I ye do, he'll know what ye wish and tell ye what must be done.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end