function event_waypoint_arrive(e)
	if(e.wp == 3) then
		e.self:Say("Greetings, sister! I just wanted to make sure no harm had befallen you.");
		eq.signal(4052,5); -- NPC: Chanda_Miller
		e.self:SetRunning(true);
	elseif(e.wp == 4) then
		e.self:SetRunning(false);
	elseif(e.wp == 7) then
		eq.set_anim(4055,1);
	end
end

function event_signal(e)
	e.self:Say("But, you will always be my little sister. Fare well, Chanda! See you soon!");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, there. My name is Baobob Miller. My [sister] and I are the best tanners in all of Norath. Wolves are my specialty. A nice wolf skin [garment] would be the perfect accessory to your stylish ensemble.");
	elseif(e.message:findi("sister")) then
		e.self:Say("My little sister Chanda is the second best tanner around!. Seriously though, she is a very skilled artisan and people travel far and wide to acquire one of her fine bear skin cloaks. I am proud of her. She doesn't really like to meet new people, but if you tell her [Baobob sent you], I am sure she can help get you into some nice bear skin boots.");
	elseif(e.message:findi("garment")) then
		e.self:Say("I make the finest wolf skin [boots],[cloaks] and [belts] in all of Antonica.");
	elseif(e.message:findi("boot")) then
		e.self:Say("If you can bring me a wolf skin of medium quality and pay me a fee of say.. hmmmm.. for you.. 15 gold pieces, I think I can make you a pair of boots that will make all of Qeynos envy you.");
	elseif(e.message:findi("cloak")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Yes! One of my wold skin cloaks would go very well with your.. eeerr.. style.. Ahem! Let's see.. I think I can get you into one for 21 gold pieces, but, you have to provide the skin, and I make my cloaks with only the highest quality wolf skins.");
		else
			e.self:Say("Hmm.. I really would not feel comfortable helping you in that way. You need to prove yourself to me by aiding my friends and family in the Plains of Karana before I will help you.");
		end
	elseif(e.message:findi("belt")) then
		e.self:Say("Belts are far more forgiving than cloaks or boots. A lesser quality pelt and 5 gold pieces would get you a nice wolf-hide belt.");
	elseif(e.message:findi("talym")) then
		e.self:Say("Talym Shoontar. He is a fine hunter. He sure can skin a bear faster than any man alive. Last I heard, he was hunting in the Plains of Karana.");	
	elseif(e.message:findi("mammoth")) then
		e.self:Say("Mammoth! That beast is the oldest living bear I have ever heard of. Ten feet tall and full of muscles. If you ever find yourself in the caves of Surefall Glade, make sure to hunt that beast down and send him to his death. We Millers would pay a lot of platinum for a hide like that.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Good work! Now have you the rest of what I require?";

	-- Confirmed Live Faction and Experience	
	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13755, gold = 21},1,text)) then
		e.self:Say("Here ya go! That should keep ya nice and warm! Be sure to tell all the friends you're going to impress where you got this fine cloak. Although I am sure they probably have heard of me already.");
		e.other:Faction(e.self,345,2,0); -- Karana Residents
		e.other:Faction(e.self,262,1,0); -- Guards of Qeynos
		e.other:Faction(e.self,341,1,0); -- Priests of Life
		e.other:Faction(e.self,280,1,0); -- Priests of Life
		e.other:QuestReward(e.self,{itemid = 2905,exp = 50}); -- Item: Wolf-hide Cape		
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13754, gold = 15},1,text)) then
		e.self:Say("They are exquisite, if I do say so myself. Hope they fit.");
		e.other:Faction(e.self,345,2,0); -- Karana Residents
		e.other:Faction(e.self,262,1,0); -- Guards of Qeynos
		e.other:Faction(e.self,341,1,0); -- Priests of Life
		e.other:Faction(e.self,280,1,0); -- Priests of Life
		e.other:QuestReward(e.self,{itemid = 2906,exp = 50}); -- Item: Wolf-hide Boots
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13753, gold = 5},1,text)) then
		e.self:Say("I hate working with such low quality hides. They lack the sheen that makes a high quality pelt look so fine! Anyhow, here's your belt.");
		e.other:Faction(e.self,345,2,0); -- Karana Residents
		e.other:Faction(e.self,262,1,0); -- Guards of Qeynos
		e.other:Faction(e.self,341,1,0); -- Priests of Life
		e.other:Faction(e.self,280,1,0); -- Priests of Life
		e.other:QuestReward(e.self,{itemid = 2907,exp = 50}); -- Item: Wolf-hide Belt
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
