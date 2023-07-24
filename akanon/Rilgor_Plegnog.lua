function event_say(e)
	if (e.message:findi("mechanical pen")) then
		e.self:Say("Why do you want one of those contraptions. You will spend more time repairing it then you will writing with it. But if you insist on getting one, you are going to have to do a small favor.");
	elseif(e.message:findi("favor")) then
		e.self:Emote("tugs at your robe and grins evilly. 'Mighty nice outfit you have there. Sure beats these drab robes us three are wearing. Hmm...my favorite color is purple, in fact a shiny metallic purple would do nicely. How bad did you want that pen?'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18703})) then  -- Old Folded Letter
		e.other:Faction(e.self,238,100,0); 	-- Dark reflection
		e.other:Faction(e.self,245,-10,0); 	-- eldritch collective
		e.other:Faction(e.self,255,-10,0); -- gem choppers
		e.other:Faction(e.self,240,-10,0); 	-- Deepmuses
		e.other:QuestReward(e.self,0,0,0,0,13524,20);	-- Dark Gold Felt Robe*
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 1360})) then
		e.self:Say("Very nice!! It is perfect! Here take this pen. Have fun with it.");
		e.other:QuestReward(e.self,0,0,0,0,10600,50000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
