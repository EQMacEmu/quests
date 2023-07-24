--Renni's Rock Collection

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Har har, " .. e.other:GetCleanName() .. "! I see yer curious mind has brought ye to what will be the most fabulous and fascinating museum display of them all, the geological exhibit. Behold the [rocks] of Norrath! I'd be most delighted to show them to ye, eh, but I'm afraid it's not quite ready yet, you see. Some pieces of my collection have gone missing and I haven't gone to get replacements yet.");
	elseif(e.message:findi("rocks")) then
		e.self:Say("Eh, let's see. I'm missing a Whirling Crystal, A Scarlet Stone, Icy Geoduck, and A Pulsating Rock. Might ye have these on ye? If ye do, go and get a Collector's Box from [Merri], and put them inside. Close the box and bring it to me. The display will be most grand if ye do!");
	elseif(e.message:findi("Merri")) then
		e.self:Say("Curator Merri is the founder of the museum in the Selia district of New Tanaan. She is a true visionary and a wonderful person as well. It is her dream to turn life's love into something truly grand. She also carries with her the Collector's Boxes. If you need one, be sure to ask her for it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	-- if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28077})) then--Collection of Gems correct item does not exist in db
	--	e.self:Emote("opens the box carefully and inspects the contents.  'These will do.  Thank ye.  Take this as a reward.'");--Text made up, no reference
	--	e.other:QuestReward(e.self,0,0,0,0,28235);--Fine Antique Pelisse
	-- end
	item_lib.return_items(e.self, e.other, e.trade)
end
