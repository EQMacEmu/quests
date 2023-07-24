--Gandan Tailfist is part of the quest line for the Whistling Fists

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("places a foul smelling book in your hands and speaks to you slowly. 'Take this rotting book given to me by lord Cazic Thule himself, I was given another but it has been lost. The search for the fists will be the end of me. If you are a monk of the final rung show me your Shackle of Tynnonium and I will share with you what I have found.");
		e.other:SummonCursorItem(18899); -- Item: Flayed Skin Tome
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4199})) then
		e.self:Say("The search for the fists has killed many so I hope that your strength is more than mine and those in the past. I was given this satchel by the lord Cazic Thule. I have searched for the fists in this place but they are not here. I suggest you seek audience with our lord. Tell him that I have failed in my task. I am sure that he ugnnnnnhnnn.' One last look to you is given before falling completely lifeless to the cold stone.");
		e.other:QuestReward(e.self,{items = {17364,4199},exp = 20000}); -- Item: Shackle of Tynnonium
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by: Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
