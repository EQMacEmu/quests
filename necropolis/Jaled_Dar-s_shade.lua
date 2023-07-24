local SHOUTS = {
	"Trakanon, my friend, you BETRAYED me!",
	"Harla!  Phara!  It is cold here, and dark, so very dark.",
	"Somebody is there, I can tell!  Listen to me!  We were WRONG, he must be awakened!",
	"Zlandicar, I know you are here, you are always here!  Do not ignore me, you must listen....we must talk.",
	"Release him..............release him.....release...ME!",
};
local nextShout = 1;

function event_spawn(e)
	eq.set_timer("zoneshout", 2400000);
	eq.set_timer("depop", 48 * 60 * 60 * 1000);		-- he despawns, but the uptime and respawn times are unknown, so this is a guess
end

function event_timer(e)

	if ( e.timer == "zoneshout" ) then
		if ( not e.self:IsEngaged() and SHOUTS[nextShout] ) then
			e.self:Shout(SHOUTS[nextShout]);
		end

		nextShout = nextShout + 1;
		if ( not SHOUTS[nextShout] ) then
			nextShout = 1;
		end
	elseif ( e.timer == "depop" ) then
		eq.depop_with_timer();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Mortal! You MUST aid me! I will have my revenge, and my rest!");
	elseif(e.message:findi("aid you")) then
		e.self:Say("You must wake The Sleeper. He is our salvation, he will restore a new golden age to Norrath. It was a terrible mistake to subdue him, jealousy and envy led us to do it. I see all of this clearly now.");
	elseif(e.message:findi("sleeper")) then
		e.self:Say("Kerafyrm, the best of us, what we should be. We imprisoned him in a timeless slumber aeons ago. I know how to release him, but I am no longer of the flesh, so I cannot do it myself. But you can accomplish this task!");
	elseif(e.message:findi("task")) then
		e.self:Say("When the tomb was closed and the entry sealed, many dragons participated in the ceremony. They invested portions of their essence into the seal. The seal is part of them now. With the right talismans, I can show you how to make a key that will allow one to pass, as if they were of the First Brood. If you do not wish to do this for the good of all, perhaps you will be willing to do it for material riches. Priceless treasures are stored in the tomb, yours for the taking, once you are inside and have released The Sleeper.");
	elseif(e.message:findi("talisman")) then
		e.self:Say("Sontalak, Lendiniara, Klandicar, Yelinak, and Zlandicar are all that are left alive of those who were involved in the sealing of the tomb. Each has a talisman. Bring me any one of these items, or a large enough piece from one of the talismans from a dead first brood, and I shall unlock its power, which will allow you entry into the tomb.");
	elseif(e.message:findi("treasure")) then
		e.self:Say("Weapons, armor, tomes of great power, and more, are held inside. The barrier that keeps The Sleeper in his state of slumber also wards the treasure. You must first remove this barrier.");
	elseif(e.message:findi("barrier")) then
		e.self:Say("Four dragons maintain the barrier around The Sleeper. These four dragons channel their energies into the barrier. For the barrier to drop, you must slay all four. This will be no easy task, for they are powerful and learned, the best and brightest of that era. But once this is done, The Sleeper shall awake, and the treasures there shall be yours for the taking. The Sleeper will travel to the Skyshrine to resume his rightful position among wurmkind.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9296}, 0) or
		item_lib.check_turn_in(e.self, e.trade, {item1 = 27255}, 0) or
		item_lib.check_turn_in(e.self, e.trade, {item1 = 27256}, 0) or
		item_lib.check_turn_in(e.self, e.trade, {item1 = 27258}, 0) or
		item_lib.check_turn_in(e.self, e.trade, {item1 = 27259}, 0) or
		item_lib.check_turn_in(e.self, e.trade, {item1 = 27266}, 0)) then
		e.self:Say("Very well done. Here is how you unlock the entry. Seek out a great dragon statue in the Eastern Wastes, and use this key there. Not very different from how you entered my old domain, Veeshan's Peak, now, is it? Haha, yes, I know many things, even dead.");
		e.other:QuestReward(e.self,0,0,0,0,27265,50000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
