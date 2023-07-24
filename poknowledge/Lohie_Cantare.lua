--Lohie's Music Exhibit

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". Have you come to see my exhibit? I am honored but also sad to say it is incomplete. Mine will be the finest presentation of musical history you will find, once I finish assembling my display. If you have some free time, perhaps you could help me collect some still missing [pieces]?");
	elseif(e.message:findi("pieces")) then
		e.self:Say("'I need you to bring me a Minotaur Horn, Tambourine of Rituals, Orcish Lute of Singing, and a Stretched Skin Drum. If you could find these for me, I would be most overjoyed. You will need to get a Collector's Box from [Merri] to keep them in. Close the box up tightly and return it to me once you have placed the instruments inside. Hurry back and we shall have a grand festival!");
	elseif(e.message:findi("merri")) then
		e.self:Say("Curator Merri is the founder of the museum in the Selia district of New Tanaan. She is a true visionary and a wonderful person as well. It is her dream to turn life's love into something truly grand. She also carries with her the Collector's Boxes. If you need one, be sure to ask her for it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28080})) then--Collection of Instruments
		e.self:Emote("inspects each instrument carefully. 'These are in much better condition then I thought I would get them in. Adding these to my exhibit pleases me greatly. As promised, here is something for you.'");--Borrowed text, no final turn in text.
		e.other:QuestReward(e.self,0,0,0,0,28239);--Fine Antique Amice
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
