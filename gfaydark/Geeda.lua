function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Are not the woods of the Faydarks a lovely sight? Tunare has truly blessed us. It is unfortunate that the orcs of [Crushbone Citadel] have chosen to invade our lands.");
	elseif(e.message:findi("crushbone citadel")) then
		e.self:Say("Within the Greater Faydarks can be found the entrance to Crushbone Citadel, home of the orcs. They have increased their raids on our lands. We do not know why. The High Elder of Kelethin has instructed us to keep tabs on the orcs' movements. Hmmm.. How would you like to [assist the scouts]?");
	elseif(e.message:findi("assist the scouts")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("We trust this operation to high standing rogues of the Scouts of Tunare. Easy it may be, but the reward is a scout cape. The scout cape is meant for Scouts of Tunare only. Have you [contributed to the Scouts' cause]?");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("The Scouts of Tunare have no quarrel with you, but perhaps a few less Crushbone Orcs would prove your worth. Then we shall speak.");
		else
			e.self:Say("You dare to speak with a loyal member of the Scouts of Tunare?!  You are truly foolish!  Run away, while you still can.");			
		end
	elseif(e.message:findi("contributed")) then 
		if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably faction regardless of class
			e.self:Say("So we have heard. Here, then. Take this coin. Venture into Crushbone and find our scout, Kelynn. He is posing as a slave to gain information. He tries to work very close to an opening in a cave near the moats. Find this point and wait for him to appear. Give him the coin and he shall give you the information you are to return to me.");
			e.other:SummonCursorItem(12184); -- Item: Useless Token
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("The Scouts of Tunare have no quarrel with you, but perhaps a few less Crushbone Orcs would prove your worth. Then we shall speak.");
		else
			e.self:Say("You dare to speak with a loyal member of the Scouts of Tunare?!  You are truly foolish!  Run away, while you still can.");			
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12183})) then
		e.self:Say("Fine work. We are very grateful. Take this Scout Cape. May you use it to serve Kelethin.");
		e.other:Faction(e.self,316,20); -- Faction: Scouts of Tunare
		e.other:QuestReward(e.self,0,0,0,0,2914,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
