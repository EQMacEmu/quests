function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Rrrrrr..  Away frrrom this isle of death and.. prrrr.. punishment.");
	elseif(e.message:findi("thipt")) then
		e.self:Say("Clawknight Thipt wished to learn the ways of Ashen.  Prrr.. Together we go into green goblins' lair to train.  Prrr.. We find too many and he is too weak.  Separated and unable to find him, I hear his death cry.  Prr.. I cannot make it back, eyes upon me.  Now I must find one sent by Ashen to aid in the recoverrry of his remains.");
	elseif(e.message:findi("puab")) then
		e.self:Say("Prrr... Master Puab? Show me prrroof.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12369})) then
        e.self:Say("Ashen Order!!  Prrr.. My order.  I have been expecting one of us.  Prrr.. Help me rejoin my native land.  Take this box.  Combine all the [remains of Thipt] within the box and return it to me.  This shall aid me in my redemption.");
		e.other:QuestReward(e.self,0,0,0,0,17985,500);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12371})) then
        e.self:Say("Prrr.. Thank you brother of Ashen. I can now spend my time upon this island in peace, until my penance is serrrved. He dabs his paw into the mud and places it upon a tattered parchment. Take this message to Puab. Farrrwell.");
		e.other:QuestReward(e.self,0,0,0,0,12370,500); -- a pawprint
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:kerraridge  ID:74029 -- a_banished_Kerran