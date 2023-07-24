function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18847})) then	-- Tattered note
		e.self:Say("Welcome " .. e.other:GetCleanName() .. "! The blood of our brothers the wolves run strong through your veins. You must learn to control your spiritual link with our canine brothers. Wear this tunic so that others may recognize you as a Field Priest of the Tribunal, the claws and fangs of justice! Talk to my friend Hoyce and he can get you started.");
		e.other:Faction(e.self,327, 15);   							-- Shamen of Justice
		e.other:Faction(e.self,328, 2);   								-- Merchants of Halas
		e.other:Faction(e.self,223, -2);   								-- Circle Of Unseen Hands
		e.other:Faction(e.self,336, -2); 								-- Coalition of Tradefolk Underground
		e.other:Faction(e.self,244, -3); 								-- Ebon Mask
		e.other:QuestReward(e.self,0,0,0,0,13574,20);        		-- Soiled Gray Tunic
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
