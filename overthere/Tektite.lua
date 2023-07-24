--Zone: Overthere  NPC: Tektite
function event_say(e)
	if(e.message:findi("tektite")) then
		e.self:Emote("makes the sound of grinding rocks as he moves his mouth. You cough uncontrollably from the dust cloud it creates. 'YOU SEEK TO OWN ME?' ");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10011, item2 = 10011})) then
		e.self:Emote("takes one hand and pries out one of his eyes, which he casts far into the plains. He then places the carnelian into his eye socket. He turns towards you and holds open his palm. ");
		e.self:Emote("pries out his other eye and places the second carnelian gem in its place. His eyes burn brightly with scarlet fire. He then hands you a fragment of tektite. ");
		e.other:QuestReward(e.self,0,0,0,0,12831);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Qadar
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
