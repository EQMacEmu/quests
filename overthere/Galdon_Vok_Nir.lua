function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Please do not harm me.  I am not the one who brought the outsiders to our land.  I am innocent and deserve to return to my people.");
	elseif(e.message:findi("di nozok")) then
		e.self:Emote("opens his eyes wide. 'Oh! You found one of my family's fine canopics. That particular one was made for the legendary mystic, Di Nozok. If you think you're going to open it, think again. I know how, and will gladly [open the Nozok canopic], for a price. I heard the second was stolen by a sarnak shaman.");
	elseif(e.message:findi("open.* canopic")) then
		e.self:Say("Want it opened? I will need the two [keys of Dai], the Dai skull canopic, and my fee, 400 gold coins.");
	elseif(e.message:findi("sealed")) then
		e.self:Say("I have heard of such things. You must have stumbled upon an ancient jar devised by one of my long-dead ancestors. They were fine craftsmen. I do not share their gift, but I do know the secret of the locks. If you have one of the ancient Vok Nir canopics, allow me to open it for you.");
	elseif(e.message:findi("key")) then
		e.self:Say("There are two keys of Dai. They were made of ceramic and were also crafted to look like warrior totems. I once broke one as a child and my grandfather got very angry. He lashed me good! I do not know what the big fuss was about; he easily put them back together using some sort of clay.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "To open the canopic, I require the two Dai keys, the Dai skull canopic and 400 gold coins.";	
	
	--Turn in the 2 totems and the canopie of Di Nozok and 400 gold pieces
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12743, item2 = 12744, item3 = 12742, gold = 400},1,text1)) then
		e.self:Emote("takes the two keys. He inserts and twists them, one at a time, in hidden slots on the Dai skull canopic. Suddenly, it pops open and he hands you an iksar skull. 'Here you are,' he says, 'I hope it is what you were looking for.");
		e.other:QuestReward(e.self,0,0,0,0,12740); -- Give the player the Iksar Skull
	end
	item_lib.return_items(e.self, e.other, e.trade) --return items if not the ones required
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
