function event_say(e)
	if(eq.is_the_scars_of_velious_enabled()) then
		if(e.message:findi("hail")) then
			e.self:Say("Welcome, my child.  I am Leraena Shelyrak, overseer of the Temple of Divine Light. Inside this temple, you may find the path to inner peace.  Introduce yourself to each of the priests and priestesses of the temple as well as the paladins. Together we shall put an end to such disruptive influences as the [kobold shamans]."); 	
		elseif(e.message:findi("guild coin")) then
			if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
				e.self:Say("Yes, of course. Here it is. Remember that it is not a form of currency.");
				e.other:SummonCursorItem(13989); -- Item: Peacekeeper Token		
			elseif(e.other:GetFactionValue(e.self) >= 0) then
				e.self:Say("You have not done much to upset the Peacekeepers of this temple, but we must ask you to prove yourself to us before we may discuss things such as this.");
			else
				e.self:Say("Leave my sight at once! You are no friend to the Peacekeepers of the Temple of Divine Light.");
			end
		elseif(e.message:findi("kobold shaman") or e.message:findi("slay") or e.message:findi("powerful") or e.message:findi("greater kobold")) then
			if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
				if(e.message:findi("kobold shaman")) then
					e.self:Say("The primitive kobold race has begun to show signs of healing ability. No doubt this was granted by some evil deity. Since they are of little power compared to a much more superior race such as ours. we only require the talents of young priests to [slay the kobold shaman].");
				elseif(e.message:findi("slay")) then
					e.self:Say("You are so young...  Go to Toxxulia and find these kobold shamans. Cut off their paws and return them to me. I require three paws as proof of your worth to our temple.");
				elseif(e.message:findi("powerful")) then
					e.self:Say("There are obviously other shaman with greater healing ability than those we have yet seen.  Take this pouch and collect some of their odd necklaces so that we may study them.");
					e.other:SummonCursorItem(17090); -- Item: Small Embroidered Sack
				elseif(e.message:findi("greater kobold")) then
					e.self:Say("Return to the Warrens and obtain eight of the bronze symbols worn by the kobolds greater shaman. Place them in this sack that has been blessed by the powers of Quellious to protect you from the evil influence of the evil symbols. Return the full sack with your initiate symbol of Quellious.");
					e.other:SummonCursorItem(17090); -- Item: Small Embroidered Sack				
				end
			elseif(e.other:GetFactionValue(e.self) >= 0) then
				e.self:Say("You have not done much to upset the Peacekeepers of this temple, but we must ask you to prove yourself to us before we may discuss things such as this.");
			else
				e.self:Say("Leave my sight at once! You are no friend to the Peacekeepers of the Temple of Divine Light.");
			end
		elseif(e.message:findi("ready to advance")) then
			e.self:Say("You are ready to strike at the body of the kobold shamans power. There is no reasoning with the Kobolds thus there shall be no peace in our beloved lands until their devotion to their wicked deity ceases. Return once again to the Warrens and bring me the unholy symbol worn by the High Shaman.");
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("Welcome, my child.  I am Leraena Shelyrak, overseer of the Temple of Divine Light. Inside this temple, you may find the path to inner peace.  Introduce yourself to each of the priests and priestesses of the temple as well as the paladins."); 	--made up text
		elseif(e.message:findi("guild coin")) then
			if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
				e.self:Say("Yes, of course. Here it is. Remember that it is not a form of currency.");
				e.other:SummonCursorItem(13989); -- Item: Peacekeeper Token		
			elseif(e.other:GetFactionValue(e.self) >= 0) then
				e.self:Say("You have not done much to upset the Peacekeepers of this temple, but we must ask you to prove yourself to us before we may discuss things such as this.");
			else
				e.self:Say("Leave my sight at once! You are no friend to the Peacekeepers of the Temple of Divine Light.");
			end
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I require the hieroglyph translations, the doctrine of Rolfron Zek, and your disciple symbol of Quellious.";
	local text2 = "I instructed you to return THREE paws.";

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18723},0)) then --  Tattered Note
		e.self:Say("Greetings. and welcome to the Temple of Divine Light! Here is your guild tunic. Serve Quellious well. Please see Lumi Stergnon - he has a task for you.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,298,100); --  Peace Keepers.
		e.other:Faction(e.self,266,25); --  High Council of Erudin.
		e.other:Faction(e.self,265,-25); --  Heretics.
		e.other:QuestReward(e.self,0,0,0,0,13546,20); -- Faded Silver Tunic*
	elseif(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 14585},0)) then -- requires amiably
		e.self:Say("It is imperative that we discern the nature of these symbols and the source of the kobolds shamanistic powers. There is a citizen of Erudin residing in Freeport named Glyssa Sonshaw. She is quite possibly the most knowledgeable individual in the field of heraldic and hieroglyphic studies. Take the high shamans necklace and this note to her. When you have discovered the nature of the symbols return to me with the documentation and your Disciple Symbol of Quellious.");
		e.other:QuestReward(e.self,{items = {1772,14585}}); -- Item: Odd Cold Iron Necklace
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2049},0)) then --  rolled up strip of cloth
		e.self:Say("This is important news indeed. It seems there is a tribe of cat men in the Stonebrunt Mountains that wishes to form an alliance with Erudin. I must alert the High Council of this immediately, thank you for your services."); 
		-- Confirmed Live Factions
		e.other:Faction(e.self,298,2); --  Peace Keepers.
		e.other:Faction(e.self,266,1); --  High Council of Erudin.
		e.other:Faction(e.self,265,-1); --  Heretics.
		e.other:QuestReward(e.self,math.random(10),math.random(5),0,0,0,1000);
	elseif(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 14582},0)) then -- requires amiably
		e.self:Say("I am unfamiliar with the markings that adorn these necklaces. You have done well thus far in hindering the kobolds worship of their evil deity. I award you the Initiate Symbol of Quellious. Return to me when you feel you are ready to deal with the [greater kobold shaman].");
		-- Confirmed Live Factions
		e.other:Faction(e.self,298,25); --  Peace Keepers.
		e.other:Faction(e.self,266,6); --  High Council of Erudin.
		e.other:Faction(e.self,265,-6); --  Heretics.
		e.other:QuestReward(e.self,0,0,0,0,1564,1000); -- Initiate Symbol of Quellious
	elseif(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13883,item2 = 13883,item3 = 13883},1,text2)) then -- requires amiably, 3x kobold shaman paw
		e.self:Say("Fine work. They shall never lay hands upon another kobold again. I mean paws. Here is a small reward for a fine job. Unfortunatly we have recently learned that the shamen in the forest are merely underlings to [more powerful kobold shamen] that reside in the kobold warrens. Continue the work of Quellious.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,298,20); -- Faction: Peace Keepers
		e.other:Faction(e.self,266,5); -- Faction: High Council of Erudin
		e.other:Faction(e.self,265,-5); -- Faction: Heretics
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(15213, 15011, 15212, 15036, 15216),500); -- Spell Scrolls : Cure Disease, Holy Armor, Cure Blindness, Gate, Stun
	elseif(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 14583,item2 = 1564})) then -- requires amiably
		-- Confirmed Live Factions
		e.self:Say("Your service to this temple is commendable. I award you the rank of Disciple for your devotions to The Tranquil. When you are [ready to advance] return to me and I will set you upon another task.");
		e.other:Faction(e.self,298,30); -- Faction: Peace Keepers
		e.other:Faction(e.self,266,7); -- Faction: High Council of Erudin
		e.other:Faction(e.self,265,-7); -- Faction: Heretics
		e.other:QuestReward(e.self,0,0,0,0,1565,1000);
	elseif(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1780,item2 = 1781,item3 = 1565},1,text)) then -- requires amiably
		e.self:Say("You have done well yet again, young disciple. I award you the rank of Regent of the Peacekeepers. With this information we can hopefully gain some insight into the workings of the kobolds' religion.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,298,70); -- Faction: Peace Keepers
		e.other:Faction(e.self,266,17); -- Faction: High Council of Erudin
		e.other:Faction(e.self,265,-17); -- Faction: Heretics
		e.other:QuestReward(e.self,0,0,0,0,1566,2000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98079 -- Leraena_Shelyrak
