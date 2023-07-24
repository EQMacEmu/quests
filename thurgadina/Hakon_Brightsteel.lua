-- The Velium Focus

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Busy, busy, busy. Must get all these tools sharpened before the miners get cranky.");
	elseif(e.message:findi("stonetooth")) then
		e.self:Say("You spoke with old Stonetooth? Eeegads man! No one talks to 'im. Legend says he spent so much time down there that he eats nothin' but rocks now and drinks melted velium. Well I guess I should sharpen his axe, but I'll need some velium ore to repair it some. Bring me a chunk o' Velium Ore along with his axe and I'll get to work.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Hey, I can't start me work without both Stonetooth's axe and the small piece of Velium. Get to it, lad!";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 22569,item2 = 1690},1,text)) then -- Small piece of Velium, Norman's Axe (unsharpened axe)
		e.self:Say("Excellent! I'll get ta work now. Hakon whistles an unfamiliar tune as he repairs and sharpens the pick axe. Here ye are, " .. e.other:GetCleanName() .. ". Watch that old Stonetooth, he's a few steins short of a keg, if ye know what I mean.");
		e.other:Faction(e.self,406,5); -- Coldain
		e.other:Faction(e.self,405,1); -- Dain Frostreaver IV
		e.other:Faction(e.self,448,-1); -- Kromzek
		e.other:Faction(e.self,419,-2); -- Kromrif		
		e.other:QuestReward(e.self,0,0,0,0,1691,1000); -- Norman's Axe (sharpened axe)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
