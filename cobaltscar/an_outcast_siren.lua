function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Leave me alone, beast! Or I will cut your belly open and feed your entrails to the sharks.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 25107}, 0)) then -- Mechanical Net
		e.self:Say("So you are the servant of Wenglawks here to retrieve his cloak. I will need more scales to make the cloak in his size. I have already slaughtered a good thirty sirens and the cloak is nearly complete. Go forth and slaughter my kind and bring me three excellent scales and this idol. Let this idol be your protection from the wrath of E'ci. I will continue my work on the cloak.");
		e.other:QuestReward(e.self,0,0,0,0,25108,1000); -- Idol of Solusek Ro (statless)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25108,item2 = 25109,item3 = 25109,item4 = 25109})) then -- Excellent Siren Scales, Idol of Solusek Ro (statless)
		e.self:Say("You are an excellent hunter. Tell me, did you enjoy the screams of the sirens as they perished? I find the sound so wonderful.' she hands you a gigantic cloak made of slick siren scales. 'I was done making the cloak already. I just wanted to watch you slay the weak. I thank you for bringing more suffering into the world.");
		e.other:QuestReward(e.self,0,0,0,0,25110,1000); -- Giant Siren Scale Cloak
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
