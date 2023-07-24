function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("Peace and tranquility be with you. " .. e.other:GetCleanName() .. ".  Are you a [new acolyte of peace] or are you [here to pay homage] to the child of tranquility?");
	elseif(e.message:findi("new acolyte of peace") or e.message:findi("retrieve the peacekeeper staffs") or e.message:findi("battle the undead") or e.message:findi("important missions") or e.message:findi("track down the staff")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably	
			if(e.message:findi("new acolyte of peace")) then
				e.self:Say("Then you shall learn the ways of Quellious and learn to do as you are told by higher ranking members. It is time for you to do the lesser duties of a young priest. Which will it be? [Retrieve the Peacekeeper staffs] or [battle the undead]?")
			elseif(e.message:findi("retrieve the Peacekeeper staffs")) then
				e.self:Say("Then take this note to the woodworker in Toxxulia Forest. His name is Emil Parsini. He shall have the staff to be returned to the temple.");
				e.other:SummonCursorItem(18833); -- A Sealed Letter for Emil Parsini
			elseif(e.message:findi("battle the undead")) then
				e.self:Say("Then you shall venture to Toxxulia Forest. There has been an increase in skeleton sightings lately. I do not know their origin, but I believe that your efforts will reduce their numbers! Take this box. Return it to me when you have filled it with the bones of these undead creatures and combined it. May Quellious' light guide you.");
				e.other:SummonCursorItem(17941); -- Box for Bones	
			elseif(e.message:findi("important missions")) then
				e.self:Say("We have need of skilled priests. We have learned that a High Guard battle staff has been stolen. We require a priest to [track down the staff].")
			elseif(e.message:findi("track down the staff")) then
				e.self:Say("In the mountain keep called High Hold, we have heard there is a person hiring mercenaries for an attempt to obtain a High Guard battle staff. We are missing one of our staffs and believe this person has it. Go to Highpass Hold and find this person. Return the High Guard battle staff to me!")				
			end
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You have not done much to upset the Peacekeepers of this temple, but we must ask you to prove yourself to us before we may discuss things such as this.");
		else
			e.self:Say("Leave my sight at once! You are no friend to the Peacekeepers of the Temple of Divine Light.");
		end
	elseif(e.message:findi("here to pay homage")) then
			e.self:Say("Then respect our temple and keep your prayers silent.");
	end
end

			
function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13882})) then -- requires amiably, A Box of Bones
		e.self:Say("This is fabulous work, my friend! You have served your people well. Take this as a gift. I hope it can be of use to you. We need proof of these skeletons' origins. Continue the eradication of the undead and find out who creates them. Once you know, bring their head to me.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,298,10,0);  -- Peace Keepers (Quellious temple)      
		e.other:Faction(e.self,266,2,0);  -- High Council of Erudin      
		e.other:Faction(e.self,265,-2,0);  -- Heretics
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,math.random(20),math.random(5),0,eq.ChooseRandom(17005,17002,10018,2144,2145,2146,6011,6016,15203,15207,15201,15208,15209,15014,15205,15210,6012),500); -- Item(s): Backpack (17005), Belt Pouch (17002), Hematite (10018), Raw-hide Sleeves (2144), Raw-hide Wristbands (2145), Raw-hide Gloves (2146), Rusty Mace (6011), Rusty Morning Star (6016)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13816})) then -- The completed Peacekeeper Staff
		e.self:Say("You have done well, neophyte.Let me add the touch of harmony to finish the job.. Here, then. Take these supplies. I am sure you'll need them. Soon you may be able to assist us in [important missions].");
		-- Confirmed Live Factions
		e.other:Faction(e.self,298,10,0);  -- Peace Keepers (Quellious temple)      
		e.other:Faction(e.self,266,2,0);  -- High Council of Erudin      
		e.other:Faction(e.self,265,-2,0);  -- Heretics      
		e.other:QuestReward(e.self,math.random(20),math.random(10),0,0,eq.ChooseRandom(17005,17002,10018,2144,2145,2146,6011,6016,6012,2109,2101,2106),2500); -- Item(s): Backpack (17005), Belt Pouch (17002), Hematite (10018), Raw-hide Sleeves (2144), Raw-hide Wristbands (2145), Raw-hide Gloves (2146), Rusty Mace (6011), Rusty Morning Star (6016), Worn Great Staff (6012), Tattered Wristband, Tattered Skullcap, Patchwork Cloak
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98045 -- Lumi_Stergnon
