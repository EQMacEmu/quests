-- orc pawn picks & cutthroat rings quest

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, traveler! If you wish to walk upon the road to Freeport, you will pay the toll of two silver pieces. And you should. It is not safe to stray from the pathway. There are many [dangers in the Commonlands].");
	elseif(e.message:findi("dangers.* commonlands")) then
		e.self:Say("The orcs have been a nuisance of late. Many travelers have perished at the hands of the orc pawns. Would you like to [assist the Freeport Militia] in ridding the lands of the orcs?");
	elseif(e.message:findi("assist.* militia")) then
		e.self:Say("Sir Lucan would be proud!! Patrol the Commonlands and watch for any orc pawns. Should you find any orc pawn picks on them, I will pay you for every four you return to me. Be off, then! For the glory of Freeport!!");
	elseif(e.message:findi("no")) then
		eq.attack(e.other:GetName());
	elseif(e.message:findi("hunt dervish cutthroats")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("You will make a fine reserve!! Take this bag and fill it with Dervish Cutthroat Insignia Rings. When they are combined and returned to me you shall be accepted into the Reserve Freeport Militia!!");
			e.other:SummonCursorItem(17975); -- Item: Bag for Cutthroat Rings
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Doing away with more orc pawns, and perhaps turning in the orc pawn picks to me, may increase my trust in you.");
		else
			e.self:Say("Stand where you are, citizen. I believe you are wanted by the Freeport Militia.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I cannot reward you until you hand me four orc pawn picks. So says Captain Hazran.";

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13885,item2 = 13885,item3 = 13885,item4 = 13885},1,text)) then
		e.self:Say("You have done well. Keep up the good work and we may trust you to [hunt dervish cutthroats] which in turn will allow you to join the Reserve Freeport Militia.");
		e.other:Faction(e.self,330,3); -- freeport militia
		e.other:Faction(e.self,336,1); -- coalition of tradefolk underground
		e.other:Faction(e.self,281,-1); -- knights of truth
		e.other:Faction(e.self,362,-1); -- priests of marr
		e.other:QuestReward(e.self,0,0,math.random(5),0,0,500);
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12272})) then
		e.self:Say("Excellent work, "..e.other:GetName().."!! You are quite formidable. Maybe soon you shall aid in our efforts to rid the Northern part of Freeport of the paladins!! Until then keep up the good work. Take this Armory Token to the Militia Armorer in the Militia House in Freeport to receive your tunic. He may not be there, but I assure you he will show up at some time. On the second floor. Hail Sir Lucan!!");
		e.other:Faction(e.self,330,10); -- freeport militia
		e.other:Faction(e.self,336,1); -- coalition of tradefolk underground
		e.other:Faction(e.self,281,-1); -- knights of truth
		e.other:Faction(e.self,362,-1); -- priests of marr
		e.other:QuestReward(e.self,0,0,0,0,12273,500); -- Item: Militia Armory Token
	elseif(item_lib.check_turn_in(e.self, e.trade, {silver = 2}, 0)) then
		e.self:Say("It is best you donate to the Freeport Militia. I would hate to see anything happen to you.");
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--  EOF zone: commons ID: 21086 21109 NPC: Guard_Valon
