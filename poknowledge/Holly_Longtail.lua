--Holly Longtail's Replacement Parts
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". The preservation of ancestors is a time-honored tradition. It's a task one must handle with painstaking care and precision. Please do not fret for the lives of these specimens. They live in the eternal realm of beauty now. I have quite a large collection of stuffed animals ready to go, but many of them have sustained injuries in their capture. In fact, I wouldn't mind some help to collect some [replacement parts] from creatures around the world.");
	elseif(e.message:findi("replacement parts")) then
		e.self:Say("Grab a Collector's Box from [Merri] before you go. You need to recover an Undead Froglok Tongue, Cockatrice Beak, High Quality Cougarskin, and a Tiny Rockhopper Eye. Seal the box tightly and return it to me. If the contents are in sufficient and usable condition, I may have a reward for you.");
	elseif(e.message:findi("Merri")) then
		e.self:Say("Curator Merri is the founder of the museum in the Selia district of New Tanaan. She is a true visionary and a wonderful person as well. It is her dream to turn life's love into something truly grand. She also carries with her the Collector's Boxes. If you need one, be sure to ask her for it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28076})) then--Collection of Taxidermy
		e.self:Emote("opens the box and carefully inspects its contents. 'These will do. Please accept this as a show of my appreciation. Now if you'll excuse me I have much work left to do.");
		e.other:QuestReward(e.self,0,0,0,0,28237);--Fine Antique Ring
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
