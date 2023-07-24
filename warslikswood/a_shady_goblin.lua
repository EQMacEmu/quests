-- a Shady Goblin, Warsliks Woods
-- Second part of the chardok quest, initiated by Herald Telcha
-- Regal Band of Bathezid

function event_say(e)
	if(e.other:HasItem(5728)) then -- we handed the Signet of Service yet
		if(e.message:findi("hail")) then
			e.self:Say("If yer not my contact ya best be movin' on. Got no time to waste on ya.");
		elseif(e.message:findi("contact")) then
			e.self:Say("Are ya? Hum, let me see yer insignia then, and the note Skargus gave ya.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6475, item2 = 6471})) then -- forged note & Drogan Warlord's Insignia
		e.self:Emote("gapes at the note in puzzlement, obviously a bit concerned by it. The courier looks at the note for more than a minute, then looks at you, and back at the note. 'Errm... welp, dunno what to make of the note. If I know the right of it, Skargus finally got him some girly to do his writin' for him. Ooooh I bet she a tasty one, graarr. If I was warlord I know I'd have me a girly too. Gah, take this report and get outta my sight.");
		e.other:QuestReward(e.self,0,0,0,0,6474); -- 6474  Report to Skargus
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
