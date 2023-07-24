--Willamina's Needles
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Well, good day to you, good traveler. I am Elisha Dirtyshoes, a humble citizen of New Tanaan. Though I have never braved the dangers of an adventurer's life, I make a suitable and humble life here in this beautiful city. If you are a potter, then perhaps my wares might interest you?");
	elseif(e.message:findi("ring")) then
		e.self:Emote("sighs and says, 'Tis a painful memory, for sure. My love for Narik fell once I met Onirelin, but my love for him was not reciprocated. Now I am left with no one to share my life, with only this ring as a reminder. Narik may have it back if he desires it, but then I shall be left truly alone. Boiron Ston once held a door open for me, such a handsome dwarf he is. If he could only find more time to spend with me, giving up this ring would be no problem at all. Do you think he likes me? Could you ask him and find out?'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28086})) then--Letter to Elisha
		e.self:Emote("reads the letter and says, 'Oh happy day! Boiron will be visiting me soon. You may take Narik's ring back to him now. If you'll excuse me, I have some cleaning up to do.'");
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,0,0,0,28087,100);--Narik's Ring
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
