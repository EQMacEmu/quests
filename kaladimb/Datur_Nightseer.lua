function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to our temple. We are the paladins of the Church of Underfoot. I am lord of our holy order. I call upon you to assist us in the defense of Kaladim. Speak with the master paladins or priests and find ways to prove your allegiance to Brell.");
	elseif(e.message:findi("honored member")) then
		if(e.other:GetFactionValue(e.self) >= 50) then
			e.self:Say("Yes.  The light of righteousness shines from within you.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Clerics of Underfoot have yet to see your faith directed towards our wills.  Perhaps you should assist Master Gunlok Jure in the crusade against the undead.");
		else
			e.self:Say("How dare you approach a member of the Clerics of Underfoot?!  Dogs such as you lie in the same bed as aviaks and ogres!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18768})) then
		e.self:Say("Welcome, we are the Paladins of the Underfoot. I am Datur, and I will help teach you the word and will of the Duke of Below, Brell Serilis. Here is our guild tunic. Let's get started, shall we?");
		e.other:Faction(e.self,227,100); -- Clerics of Underfoot
		e.other:Faction(e.self,274,100); -- Kazon Stormhammer
		e.other:Faction(e.self,293,75); -- Miners Guild 249
		e.other:QuestReward(e.self,0,0,0,0,13514,20); -- Item: Dusty Tunic*
	elseif((e.other:GetFaction(e.self) < 5) and (item_lib.check_turn_in(e.self, e.trade, {item1 = 12279}))) then
		e.self:Say("The chalice is returned!! Praise be to Brell!! You have proven yourself to our church and have earned our respect. Let me welcome you into our brotherhood with the Cape of Underfoot. Wear it with pride as all of our finest paladins do.");
		-- verifed live faction
		e.other:Faction(e.self,227, 15); -- Faction: Clerics of Underfoot
		e.other:Faction(e.self,274, 15); -- Faction: Kazon Stormhammer
		e.other:Faction(e.self,293, 11); -- Faction: Miners Guild 249
		e.other:QuestReward(e.self,0,0,0,math.random(5),12281,2500); -- Item: Cape of Underfoot
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
