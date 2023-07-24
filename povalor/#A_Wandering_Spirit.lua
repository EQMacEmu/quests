-- This quest may not be implemented correctly.  It's not doable on Live anymore.
-- An Allakhazam comment says that a human version of the spirit spawns when you turn in the amulet+symbol.
-- I have an AK log of this done, and right after the amulet+symbol, he hails the spirit again and goes through the exact same dialog.
-- Whether or not it was a human form or still the suit version which did not disappear, I have no way to know.
-- The log does have the shield+sword turn in, which was turned in after the amulet+symbol, and that text here is accurate.

function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Emote("groans in extreme anguish. '[Help] me.'");
		
	elseif ( e.message:findi("help") ) then
		e.self:Say("My resting grounds have been desecrated. I now lie awake unable to rest with my fellow brethren. My soul is bound to this area for all of eternity. Until my [belongings] are brought back I cannot rest.");

	elseif ( e.message:findi("belongings") ) then
		e.self:Say("Many different things were taken, but I'm mainly concerned with my [amulet] and my family's crescent symbol. Bring these articles back into my possession and I'll return back to my state of rest.");

	elseif ( e.message:findi("amulet") ) then
		e.self:Say("The amulet was given to me after passing the Trials many many generations ago.  It is a part of every soldier who has passed the trials, it is a part of my very being.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if ( item_lib.check_turn_in(e.self, e.trade, { item1 = 20605, item2 = 20606 }) ) then -- Crescent Symbol of Rhaj, Righteous Amulet of Marr
		e.self:Emote("quickly grabs the amulet and crescent symbol before speaking. 'At long last! I can now rest in peace along with my fellow brethren. Thank you "..e.other:GetName()..". May the might of Marr follow you wherever you may go.'");
		e.other:QuestReward(e.self, 0, 0, 0, 0, 0, 250000);
		eq.depop();
		
	elseif ( item_lib.check_turn_in(e.self, e.trade, { item1 = 20608, item2 = 20607 }) ) then -- Unwavering Shield of Faith, Unwavering Sword of Faith
		e.self:Emote("looks at you with great surprise. 'It's been quite some time since I've been without my weaponry. Thank you for returning them to me "..e.other:GetName()..".'");
		e.other:QuestReward(e.self, 0, 0, 0, 0, 0, 500000);
		eq.depop();	
	end	
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_spawn(e)
	eq.set_timer("depop", 100000);
end

function event_timer(e)
	if ( e.timer == "depop" ) then
		eq.depop();
	end
end
