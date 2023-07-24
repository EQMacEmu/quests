function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met " .. e.other:GetCleanName() .. ".  Are you the new recruit that was sent to me to help exterminate the [Zelniaks] that attack our guards and caravans?");
	elseif(e.message:findi("zelniak")) then
		e.self:Say("Weren't you briefed on this already?  The Zelianks are highly aggressive scaled creatures with a large mane of fur that runs down the length of their back.  They are a constant problem for the guards and caravans that used travel in [Dawnshroud].");
	elseif(e.message:findi("dawnshroud")) then
		e.self:Say("Are you new here or something?  Dawnshroud peaks are a range of mountains lush in vegetation and water.  We used to utilize this area as a trade route to Shadowhaven.  The caravans that would travel through were too often attacked by roaming Zelniaks.  I thought you were the one that was sent to me to [help lower] the amount of Zelniaks in the area.  So the trade route could be reestablished.");
	elseif(e.message:findi("help lower")) then
		e.self:Say("How ambitious of you to help the mighty warriors of the Hand.  If you chose to serve Seru bring me back four pieces of Zelniak meat.  I will reward you for your time in the field.");
	elseif(e.message:findi("peran")) then
		e.self:Say("Centurion Peran is new to the ranks.  He gets things done I suppose it just takes him a long, long time.  Since you did his job for him, take him these new orders.  We will make a soldier out of him yet.");
		e.other:SummonCursorItem(6514);
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10692,item2 = 10692,item3 = 10692,item4 = 10692}, 0)) then
		e.self:Say("Although your service to Seru is appreciated, I just received word that you were not the one that was sent to do this menial task. That lazy boy [Peran] was supposed to take the job.");
		-- confirmed live faction
		e.other:Faction(e.self,1499,5); -- Citizen of Seru
		e.other:Faction(e.self,1484,1); -- Hand of Seru
		e.other:Faction(e.self,1486,1); -- Heart of Seru
		e.other:Faction(e.self,1485,1); -- Eye of Seru
		e.other:Faction(e.self,1487,1); -- Shoulder of Seru
		e.other:Faction(e.self,1502,-2); -- Katta Castellum Citizen
		e.other:QuestReward(e.self,math.random(0,5),math.random(0,5),math.random(0,5),math.random(0,5),0,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
