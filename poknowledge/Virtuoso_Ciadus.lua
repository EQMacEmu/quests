--Added tome handins - Kilelen
function event_say(e)
	e.self:Emote("raises a brow sharply, his Teir'Dal heritage perfectly displayed in his sharp features twisted in a glare of flawless contempt. 'The district of Kartis -- the land of the shadow -- is not a place for you, light crawler. Your presence here has no justification and you only insult your people by being here. Yes, you have betrayed your philosophy, for you are fueling the shadow with your presence within it. You may see yourself as a creature of justice and think yourself doing good by being here -- perhaps to show us the light, or to learn our secrets. Aaah. . .  learn our secrets. Yes, why don't you do that? I would be more than willing to teach you, light crawler, for whatever it is you learn under the shadow's guidance, despite how you use that knowledge, you fuel it, for you are now a product of corruption.'");
end

function event_trade(e)
	local item_lib = require("items");
	local count = item_lib.count_handed_item(e.self, e.trade, {4861, 4862, 4863, 4864, 4865, 4866, 4867}); --Imbrued Platemail Armor
	if(count > 0) then
		repeat
			e.self:Say("Thank you, " .. e.other:GetCleanName() .. "."); --Text made up
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),300000); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
			count = count - 1;
		until count == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
