function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings young one, I am Himart Kichith, shaman of the Scaled Mystics and storekeeper of valuable knowledge of the past. I am always looking for knowledge of the past in the form of spells and [rare scrolls]. If you are interested in a tidy profit perhaps you would be willing to help me.");
	elseif(e.message:findi("rare scroll")) then
		e.self:Say("The remaining scrolls are very rare indeed. Very few have surfaced over the past few years. Should you happen to find more than you can use, return one of them to me and I shall grant you even more power. I still seek the Talisman of Jasinth, Spirit of Scale, Cripple, and the third rank of Cannibalize.");
	end
end


function event_trade(e)
	local item_lib = require("items");
	local count = item_lib.count_handed_item(e.self, e.trade, {19269, 19238, 19264, 19272});
	if(count > 0) then
		repeat
			e.self:Say("We have both gained much knowledge today.");  --made up text
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(19267,19271,19274,19266),1000);
			count = count - 1;
		until count == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end