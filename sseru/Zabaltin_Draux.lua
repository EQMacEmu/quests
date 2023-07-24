-- Poisoning Brendar

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Enough with the chit chat. Are you or are you not a rogue?");
	elseif(e.message:findi("rogue")) then
		e.self:Say("Good, I need you to serve Seru. There is a member of the Shoulder that is cutting the delivery of supplies to us and he must be stopped. He is a traitor to this city. He must be a sympathizer with the loyalists of Katta. What I need from you is poison. Go make me four vials of Aching Blood. We will see how he likes his wine with some of that in it!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14058,item2 = 14058,item3 = 14058,item4 = 14058}, 0)) then
		e.self:Emote("takes the poison from you and pours it into a bottle of ale. 'Here, deliver this to Brendar Mynden! Tell him first that I wish to find compromise between our differences to throw him off guard. Then give him the ale to drink. So that I know you were successful bring me that gaudy ring he always wears. I sure do hate that ugly ring.'");
		e.other:QuestReward(e.self,0,0,0,0,29862);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29863}, 0)) then
		e.self:Say("Ha! His gaudy ring! You have done well young rogue. Perhaps you would be an asset to the Eye after all. You can have his nasty ring back, I am sure that it is worthless. Darn thing weighs as much as a Netherbian and is twice as ugly!");
		e.other:Faction(e.self,1485,10); -- eye of seru
		e.other:Faction(e.self,1484,-1); -- hand of seru
		e.other:Faction(e.self,1486,-1); -- heart of seru
		e.other:Faction(e.self,1483,1); -- seru
		e.other:Faction(e.self,1542,-1); -- haven smugglers
		e.other:Faction(e.self,1503,-1); -- validus custodus
		e.other:Faction(e.self,1504,-2); -- magus conlegium
		e.other:QuestReward(e.self,0,0,0,0,29864,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
