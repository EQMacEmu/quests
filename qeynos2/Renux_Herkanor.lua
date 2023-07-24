function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You need something, or are you just browsing?");
	elseif(e.message:findi("knargon")) then
		e.self:Say("Heh. Knargon is one of our expendables. And if he keeps up his trash, he'll find my dagger in his back...  whether Hanns likes it or not.");
	elseif(e.message:findi("who.* carson")) then
		e.self:Say("Hmm. Maybe you should ask someone else and quit annoying me.");
	elseif(e.message:findi("about stanos")) then
		e.self:Say("What? <she looks shaken> I see it is time to make my choices. Forget you mentioned that name, " .. e.other:GetCleanName() .. ". Leave me.");
		e.self:DoAnim(12);
	elseif(e.message:findi("Lomarc")) then
		if(e.other:GetFactionValue(e.self) >= 50) then -- mid indifferent to start
			e.self:Say("Lomarc? He's a small time smuggler who runs from here to Odus. He got sloppy on his last run, and now the guards are on to him. We need to have someone [meet him behind the Mermaid's Lure] tonight to pick up a package.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Circle has recognized your deeds and contributions, but I think you need to prove your worth to us a little more.");
		else
			e.self:Say("Heh...  With all you've done, I'm surprised you're still alive.");
		end			
	elseif(e.message:findi("him.* mermaid")) then
		if(e.other:GetFactionValue(e.self) >= 50) then
			e.self:Say("Hmm, you think you can handle it? Eh, Lomarc is nothing but a two-bit smuggler anyway. Take this payment to him for the package, and don't let him give you any grief. Got it?");
			e.other:SummonCursorItem(18793); -- Item: Lomarc's Payment
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Circle has recognized your deeds and contributions, but I think you need to prove your worth to us a little more.");
		else
			e.self:Say("Heh...  With all you've done, I'm surprised you're still alive.");
		end			
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFactionValue(e.self) >= 40 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13716})) then -- Kerran Doll
		e.self:Say("Yes, I see you aim to please. I hope you gave Lomarc the payment he deserved? Heh, that punk had no idea of the value of this shipment. The emerald inside this doll will fetch a pretty penny from those greedy merchants.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,223,30,0);		-- Circle of Unseen Hands
		e.other:Faction(e.self,291,-4,0); 	-- Merchants of Qeynos
		e.other:Faction(e.self,230,4,0); 		-- Corrupt Qeynos Guards
		e.other:Faction(e.self,262,-4,0); 	-- Guards of Qeynos
		e.other:Faction(e.self,273,4,0);		-- Kane Bayle
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 3) then
		e.self:Say("When is Lomarc getting back from Odus? He was supposed to be back three nights ago. Have you heard anything?");
		eq.signal(2074,3); -- NPC: Hanns_Krieghor
	elseif(e.wp == 4) then
		e.self:Say("Hanns, you are not going to want to hear this, but one of our boys in Donovan's gang swears he saw Stanos in the Karanas a week ago. And we still haven't cornered Malka Rale.");
		eq.signal(2074, 4); -- NPC: Hanns_Krieghor
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Ok, I'll send someone out to meet [Lomarc] behind the [Mermaid's Lure] tonight.");
	elseif(e.signal == 2) then
		e.self:Say("Very well, Father is as good as dead. Did I ever mention that I really hate family reunions? <chuckle>. I am gone!");
	end
end

-- END of FILE Zone:qeynos2  ID:2020 -- Renux_Herkanor
