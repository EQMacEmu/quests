function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hmph. Hello, how are ye an' how do ye do? Now, what are ye planning to buy?");
		eq.signal(29043,1); -- NPC: Murtog_MacYee
	elseif(e.message:findi("jinkus sent me")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
			e.self:Say("So, ye're the next to be tested, then, eh?! I pray ye're able to return. Ye'll need to take this note to Einhorst in Clan McMannus' fishing village in the Plains o' Karana. He'll hand ye the monthly Karana clover shipment to be returned to me. Just remember, dinnae stop running! Do ye [need directions to Clan McMannus]?");
			e.other:SummonCursorItem(18831); 								-- Tattered Note identifying as Message to Clan McMannus
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Ye're no criminal to the Shamans o' Justice, but ye've yet to prrove yer devotion to justice.");
		else
			e.self:Say("The scales o' the Shamans o' Justice dinnae tip in yer favor. Ye'd best flee while ye still have the chance.");
		end		
	elseif(e.message:findi("directions")) then
		e.self:Say("Ye go through Everfrost Peaks and run through Blackburrow. Once in Qeynos Hills, ye'll head to yer left and follow the pathway to the Plains of Karana. In the plains, when the pathway splits, go to yer right. Then just head toward the horizon.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13962})) then	--Karana Clover Shipment
		local spelltext = "";
		local rewardr = math.random(10);
		local rewarditem = 0;
		if(rewardr  < 4) then
			-- : Drowsy : Frost Rift : Sicken : Fleting Fury : Spirit of Bear : Cure Blindness : Spirit Sight : Scale Skin : Spirit Pouch : In that order
			local spellreward = eq.ChooseRandom(15270,15275,15075,15271,15279,15212,15079,15274,15272);
			local dialog0;
			local dialog1 = "Drowsy ";
			local dialog2 = "Frost Rift";
			local dialog3 = "Sicken";
			local dialog4 = "Fleeting Fury";
			local dialog5 = "Spirit o' the Bear"; --check dialog with alla or live
			local dialog6 = "Cure Blindness";
			local dialog7 = "Spirit Sight";
			local dialog8 = "Scale Skin";
			local dialog9 = "Spirit Pouch";
			if(spellreward == 15270) then
				dialog0 = dialog1;
			elseif(spellreward == 15275) then
				dialog0 = dialog2;
			elseif(spellreward == 15075) then
				dialog0 = dialog3;
			elseif(spellreward == 15271) then
				dialog0 = dialog4;
			elseif(spellreward == 15279) then
				dialog0 = dialog5;
			elseif(spellreward == 15212) then
				dialog0 = dialog6;
			elseif(spellreward == 15079) then
				dialog0 = dialog7;
			elseif(spellreward == 15274) then
				dialog0 = dialog8;
			elseif(spellreward == 15272) then
				dialog0 = dialog9;
			end
			spelltext = "Take and remember this spell, " .. dialog0 .. ", I hope ye've attained the necessary skills to scribe it.  If not, I'm sure ye soon will. Go now, and serve justice.";
			rewarditem = spellreward;
		elseif(rewardr > 3 and rewardr < 7) then
			rewarditem = eq.ChooseRandom(2031,2036,2030,2034,2027,2038,2026,2029,2025,2032,2028,2033);	-- Complete Set of Large Leather Items
		elseif(rewardr > 6 and rewardr < 10) then
			rewarditem = eq.ChooseRandom(5043,6032,6030,7022,7024,6031);							-- All SHM usable tarnished weaponry
		elseif(rewardr > 9) then
			rewarditem = 2912;																		-- Polar Bear Cloak
		end
		e.self:Say("Good work. We Shamans o' Justice are like no other. We must remain in top physical form for we never know when justice must be served. I was commanded to give ye a reward. Take this. It was doing nothing more than collecting dust. Go, and serve justice well.  " .. spelltext .. "");
		-- Confirmed Live Factions
		e.other:Faction(e.self,327,10); 								--Shamen of Justice
		e.other:Faction(e.self,328,1); 								--Merchants of Halas
		e.other:Faction(e.self,223,-1); 								--Circle of Unseen Hands
		e.other:Faction(e.self,336,-1); 								--Coalition of Tradefolk Underground
		e.other:Faction(e.self,5009,-2); 								--Hall of the Ebon Mask
		e.other:QuestReward(e.self,math.random(0,9),math.random(0,9),0,0,rewarditem,1600);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
