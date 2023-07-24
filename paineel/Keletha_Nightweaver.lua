function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". Interested in the art of research? I have several tomes which may aid you in such a pursuit.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1774})) then--Envelope with Dust
		e.self:Emote("takes the note, dumps the dust into her hand and examines it for a moment. She looks up and chuckles 'It's amuzing how one of our Royal Guards cannot identify this substance. Do you feel how it's slightly cooler than other metals? It's called Permafrost Iron, also known as Cold Iron to laymen. Miragul wrote of it's properties in his memoirs. There are much better metals at our disposal now, so it's use is rare except in more primitive cultures. Here is my report.'");
		e.other:QuestReward(e.self,0,0,0,0,1775,137180);--Heretics Report
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
--END of FILE Zone:paineel  ID:75083 -- Keletha_Nightweaver

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
