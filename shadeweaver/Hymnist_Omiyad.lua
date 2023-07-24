function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings young one, have a seat by the fire.  You will notice the dance being preformed.  This is much more than just a dance though.  It is a ritual that we preform to [purge] the evil spirits that are plaguing the thicket.");
	elseif(e.message:findi("purge")) then
		e.self:Say("Lately there has been a surge in the number of Lodi Kai threatening our trade routes.  This ritual is preformed around a fire that burns from their [remains].  Setting their remains in the fire will free their tie with this world and shall ward off their numbers.");
	elseif(e.message:findi("remains")) then
		e.self:Emote("glances toward the fire. 'I see the fire is dying down some. Should you come across the remains of the Loda Kai bring them to me to keep the ritual fire burning. Bring plenty though, four if you can.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31289, item2 = 31289, item3 = 31289, item4 = 31289})) then --Handin: Loda Kai Remains
		e.self:Emote("takes the remains and throws them into the fire, flames blaze immediatey with a sicky hue. 'You have preformed a great service by helping destroy some of the wretched Lodi Kai. Take this small talisman, it is worn by the dancers here. Take it with you and feel free to do a dance whenever you like, haha!'");
		e.other:Faction(e.self,1513,10); -- +Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,7498,250);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
