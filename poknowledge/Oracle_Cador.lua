--Willamina's Needles/Planar Armor Exchange
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("gives a stiff nod in proper greetings to " .. e.other:GetCleanName() .. ". 'The light of Selia shines in welcoming, friend. If you seek supplies or training, know that Selia will accommodate your every need in these specific areas most efficiently -- for that is what we have striven for in the recent past with the unexpected, though eagerly welcome influx of Norrath's heroes. I am Oracle Cador, shaman of The Truthbringer and adept of my art in the district of Selia. I shall oblige any needs that you may have now or in the future regarding training in the shamanistic ways. If you are of another adept path, then do not be disheartened for Selia holds an adept master for every art that the pure light of goodly mortal virtues shines upon.'");
	elseif(e.message:findi("black lava powder")) then
		e.self:Say("You are most astute. I do have a stock of black lava powder with me, but I will only share it with those who prove themselves worthy. Onirelin Gali is currently in possession of an artifact I need to better commune with the spirits. Please recover it for me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local count = item_lib.count_handed_item(e.self, e.trade, {4871, 4872, 4873, 4874, 4875, 4876, 4877}); --Rune Etched Armor
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28089})) then--Cador's Artifact
		e.self:Say("The spirits are restful now that this piece of legend is in safe hands. You may take this to Mirao for whatever purpose he desires it for. May your vision always be clear!");
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,0,0,0,28090,100); --Black Lava Powder
	end
	if(count > 0) then
		repeat
			e.self:Say("Thank you, " .. e.other:GetCleanName() .. "."); --Text made up
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),300000); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
			count = count - 1;
		until count == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
