function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. citizen!  I am very busy. I do not have time to speak with you.  If you have any complaints. please direct them to City Hall.  Unless. of course. you have some personal business in which I might be interested.");
	elseif(e.message:findi("shrine of innoruuk")) then
		e.self:Say("It is about time Pietro sent someone. You people should be lucky I allow you to conduct your business in this city. I will have you all locked up if you cannot be more prompt. Now, listen up! I want you to go out to the Commonlands. My guards have reported that a messenger from Qeynos is staying at an inn near the western edge of the Commonlands. I suspect he is carrying vital information to the Hall of Truth. I want him stopped. Bring me the message if you know what's good for you and the Dismal Rage. Now, get out of here!");
	end
end

function event_death_complete(e)
	eq.spawn2(9147, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(),e.self:GetHeading());
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18816})) then
		e.self:Say("So I see you decided to bring me the message. Good. I would hate to have to hunt you down. It could have gotten really messy and I hate reading bloodstained messages. Well it seems Antonius Bayle and the Knights of Truth have begun an alliance. And it sounds as though I may have a traitor among my guards. If you wish to switch your allegiance to Freeport, then find me this traitor. Bring me his militia tunic. Try to keep the blood from staining it.");
		-- HK confirmed live factions
		e.other:Faction(e.self,330,25,0); -- Faction: The Freeport Militia
		e.other:Faction(e.self,336,3,0); -- Faction: Coalition of Tradefolk Underground
		e.other:Faction(e.self,281,-2,0); -- Faction: Knights of Truth
		e.other:Faction(e.self,362,-2,0); -- Faction: Priests of Marr
		e.other:QuestReward(e.self,0,math.random(10),0,0,0,5000);		
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13926})) then
		e.self:Say("So, it was Alayle! He was of no importance to us. He knew nothing. I thank you for assisting the Freeport Militia. My men shall keep an eye out for you. Unfortunately, so will the Knights of Truth. Might I suggest you spend less time in North Freeport?"); 
		-- HK confirmed live factions
		e.other:Faction(e.self,330,25,0); -- Faction: The Freeport Militia
		e.other:Faction(e.self,336,3,0); -- Faction: Coalition of Tradefolk Underground
		e.other:Faction(e.self,281,-2,0); -- Faction: Knights of Truth
		e.other:Faction(e.self,362,-2,0); -- Faction: Priests of Marr
		e.other:QuestReward(e.self,0,0,math.random(10),0,0,7500);		
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freportw  ID:9018 -- Sir_Lucan_D`Lere
