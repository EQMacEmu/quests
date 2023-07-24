function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, citizen! If it is a good time you are seeking, you should head toward the tavern. You can't miss it. There is only one. The emperor says we should spend most of our time training, not in revelry. We troopers try.");
	elseif(e.message:findi("sign the restraining order")) then
		e.self:Say("I do not believe you were sent by the legion. You do not look as though you could squash a kitten or even a bug. If you truly were sent, then you should be able to hunt down a sabertooth kitten. Tell you what, you bring me two sabertooth kitten canines and the legion order and I shall believe you. Only then will I sign the order for you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I told you that I need two sabertooth kitten canines and the legion order.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18246, item2 = 12670, item3 = 12670},1,text)) then --Legion Order (6 signed), Sabertooth Kitten Canine x 2
		e.self:Say("I suppose you were sent by the legion. I will sign. Here is the legion order back. Now, leave, so I can finish my watch.");
		-- confirmed faction hits
		e.other:Faction(e.self,441,2); 	--Legion of Cabilis
		e.other:Faction(e.self,440,1); 		--Cabilis Residents
		e.other:Faction(e.self,445,1); 	--Scaled Mystics
		e.other:Faction(e.self,442,1); 		--Crusaders of Greenmist
		e.other:Faction(e.self,444,1); 	--Swift Tails
		e.other:QuestReward(e.self,0,0,0,0,18247,800); 	--Legion Order (7 signed)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
