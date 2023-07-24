-- a Sarnak Spy, Frontier Mountains
-- Second part of the chardok quest, initiated by Herald Telcha
-- Regal Band of Bathezid

function event_say(e)
	-- Flagging wasn't needed.  Could skipped the first part and just obtained the note
	if(e.message:findi("proceed")) then
		e.self:Say("Good, here then is what you must do. It's pretty simple actually and even one such as you should have no troubles. Skargus has been trading in slaves with the Iksar. He has a courier there visits the outskirts of Cabilis and sends weekly reports back to Droga. If we could get that report, Skargus would be finished. Will you go to Cabilis and [get the report]?");
	elseif(e.message:findi("report")) then
		e.self:Emote("scowls at you, clearly unimpressed by your efforts. 'Of course you'll go get the report fool, but do you think that the courier will just give to you?' The sarnak shakes his head sadly. 'Okay, look. Go into Droga and try to get a warlord's insignia off one of the goblins in there. Take this forged note to the courier I've written out, along with the insignia to Warslik's woods and give it to the courier. With luck, he'll believe you work for Skargus and give you the report. If you get the report, find Gragbar and give it to him.'");
		e.other:SummonCursorItem(6471); -- 6471  Forged Note to Courier
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6472})) then -- Traitor's note, from goblin traitor
		e.self:Emote("reads the note slowly, turning it around in his claws a few times before completing it. 'I see you spoke with that half-wit goblin! I hate hate hate it when he sends me a note, his penmanship is almost illegible. I hope he informed you of the situation, he's really not the most dependable agent of Di'zok, and sadly his note doesn't really make much sense. No matter though, are you ready to [proceed] in this mission?'");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
