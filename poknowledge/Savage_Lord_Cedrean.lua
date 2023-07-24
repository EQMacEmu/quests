--Beastlord Tomes/Planar Armor Exchange
--I added the tome hand-in, it didn't exist previously -Kilelen
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("in an almost arcane motion, gives a mystic gesture of ancient greetings. 'The light of Selia shines upon you most brightly, " .. e.other:GetCleanName() .. ". Be at ease, and know that all answers you seek will be delivered in time. The library of Myrist, though lacking the purity of the virtues we hold most dear to our selves in valiant memory of our mortal endeavors, is truly an unrivaled source of infinite knowledge. However, if you seek the comfort of your own light and goodly virtues, then Selia shall provide whatever it can to accommodate your needs while in our midst. Unfortunately, the ruling of the council has limited each individual citizen of the city to one particular specialty so that each have their equal opportunity to share their unique knowledge. In my former life, I was a master of the beasts and crusader of Mithaniel Marr. If you share the same profession as I and are in need of training, then I am more than pleased to oblige you.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local count = item_lib.count_handed_item(e.self, e.trade, {7817, 7818, 7819, 7832, 7833, 7834, 7835}); --Anthemion Armor
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
