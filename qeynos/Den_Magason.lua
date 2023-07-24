function event_waypoint_arrive(e)
	if(e.wp == 16 or e.wp == 43 or e.wp == 70) then
		e.self:Say("Psst.. Hey, you there.. Yeah, you.. You need some [blank scroll sheets].. I just got a special shipment of things in.. Come on, it's just what you're looking for.. I know you.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then	
			e.self:Say("Oh, hey there.. How ya doing? My name's Den. I work for ol' [Rohand] here, unloading the [shipments] that come in from overseas.");
		else
			e.self:Say("Wha'?  Another talking rat? Your reputation with the merchants in this town has put a price on your head...  begone, before I decide to collect!");
		end
	elseif(e.message:findi("rohand")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Ol' Captain Rohand is the owner of the Mermaid's Lure. He trades goods with sailors and sea [merchants]. I think that old man was even born at sea.. And he's got more stories than fish have scales.");	
		else
			e.self:Say("Wha'?  Another talking rat? Your reputation with the merchants in this town has put a price on your head...  begone, before I decide to collect!");
		end
	elseif(e.message:findi("shipments") or e.message:findi("merchants")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Yeah.. We get merchants and traders with goods from here to [Odus].");	
		else
			e.self:Say("Wha'?  Another talking rat? Your reputation with the merchants in this town has put a price on your head...  begone, before I decide to collect!");
		end
	elseif(e.message:findi("blank scroll sheets")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Blank scroll sheets, huh? You know, there seems to be a shortage of these around here lately. But, hey friend, ol' Denny-boy here would never steer you wrong. I'll sell you some for 2 gold. I know, I'm too kind.");
		else
			e.self:Say("Wha'?  Another talking rat? Your reputation with the merchants in this town has put a price on your head...  begone, before I decide to collect!");
		end
	elseif(e.message:findi("Odus")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Odus? I've never been there, but I hear it's a long journey.");
		else
			e.self:Say("Wha'?  Another talking rat? Your reputation with the merchants in this town has put a price on your head...  begone, before I decide to collect!");
		end
	end
end

function event_trade(e)
	local item_lib =require("items");
	local text = "Ok, good job, but I still need the other ones, too. Get the rest of them, so I can ship them all to Odus.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {gold = 2})) then
		e.self:Say("Yeah, well, these are pretty hard to come by. In fact, these came all the way from Odus. Enjoy, and tell your buddies.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,223,1,0);		-- Circle of Unseen Hands
		e.other:Faction(e.self,291,-1,0); 	-- Merchants of Qeynos
		e.other:Faction(e.self,230,1,0); 		-- Corrupt Qeynos Guards
		e.other:Faction(e.self,262,-1,0); 	-- Guards of Qeynos
		e.other:Faction(e.self,273,1,0);		-- Kane Bayle
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,0,0,0,18006,100); -- Item: Blank Scroll Sheets
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13784})) then
		e.self:Say("All right, I'll make sure this gets put on the next boat to Erudin. But now, I need a favor of you. Since I'm stuck here working the docks all day, I need someone to run out to Qeynos Hills and bring me back various pelts and skins. I got a customer in Odus who is trying to get a new shop started, and he needs some samples. Bring me back some snake scales, a high quality bear skin, a high quality wolf skin, and some bat fur. Make sure the quality is good, I can't send him rags.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,223,10,0);		-- Circle of Unseen Hands
		e.other:Faction(e.self,291,-1,0); 	-- Merchants of Qeynos
		e.other:Faction(e.self,230,1,0); 		-- Corrupt Qeynos Guards
		e.other:Faction(e.self,262,-1,0); 	-- Guards of Qeynos
		e.other:Faction(e.self,273,1,0);		-- Kane Bayle
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13070, item2 = 13752, item3 = 13755, item4 = 13069},1,text)) then -- Snake Scales, High Quality Bear Skin, High Quality Wolf Skin, Bat Fur
		e.self:Say("Great... Hopefully he will like these samples, and order a lot more from me. Here's some gold for your efforts. Also, could you pass this note on to Ghil next time you talk to him? Thanks again.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,223,20,0);		-- Circle of Unseen Hands
		e.other:Faction(e.self,291,-3,0); 	-- Merchants of Qeynos
		e.other:Faction(e.self,230,3,0); 		-- Corrupt Qeynos Guards
		e.other:Faction(e.self,262,-3,0); 	-- Guards of Qeynos
		e.other:Faction(e.self,273,3,0);		-- Kane Bayle
		e.other:QuestReward(e.self,0,math.random(10),0,0,18796,50000);	-- Note for Ghil
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
