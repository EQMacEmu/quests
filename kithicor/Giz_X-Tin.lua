function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20446})) then
		e.self:Emote("flips you a coin after he recognizes the ring. 'It seems we have a mutual 'acquaintance.' The coin repays an old debt. You don't have to worry about what that is. Luckily, Lord Innoruuk has informed me of your coming and your desires. Fortunately, I have all the answers you require right here at the end of my friend's blade. I think I'll be paying my old 'friend' a visit.'");
		e.other:QuestReward(e.self,0,0,0,0,20447);
		eq.spawn2(20190,0,0,e.self:GetX()+20,e.self:GetY()+20,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF zone: kithicor ID: 20058 NPC: Giz_X`tin
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------