--Randi's Floral Specimens

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("And a good morning to you as well, " .. e.other:GetCleanName() .. ". I can see by the gleam in your eye you are interested in learning more about the flowers of Norrath. Sadly my exhibit is not much to speak of. I require new [specimens] to help build my collection.");
	elseif(e.message:findi("specimens")) then
		e.self:Say("If you could find some for me, I would be ever so grateful. I need a Black Root, Maneater Bud, Yew Leaf, and a Twilight Orchid. If you should come across them, handle them with care. Be sure to get a Collector's Box from [Merri] to keep them in. Close the box and return it to me.");
	elseif(e.message:findi("Merri")) then
		e.self:Say("Curator Merri is the founder of the museum in the Selia district of New Tanaan. She is a true visionary and a wonderful person as well. It is her dream to turn life's love into something truly grand. She also carries with her the Collector's Boxes. If you need one, be sure to ask her for it.");--Text from Holly's quest.
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28083})) then--Collection of Plants
		e.self:Say("Plants and flowers are a special treasure I keep close to my heart. Did you ever stop to marvel at how beautiful these specimens are? I thank you greatly for them. Here, take this in return.");
		e.other:QuestReward(e.self,0,0,0,0,28238);--Fine Antique Corset
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
