function event_say(e)
	if(eq.is_the_ruins_of_kunark_enabled()) then
		if(e.message:findi("hail")) then
			e.self:Say("I hope you have a good reason for disturbing my contemplations. Perhaps you [seek the knowledge] of those who meditate within this Temple of Fear?");
		elseif(e.message:findi("seek.* knowledge")) then
			e.self:Say("It is the secrets of Fear you seek, but first you must prove your devotion to our temple. There are pack rats within the city that have a habit of getting into things. Some of these rats have ingested a concoction developed by the necromancers of this great city. The rats have since died and, due to the concoction, their undead corpses now roam the fields. Bring me four livers from these undead rats so that we may examine them.");
		elseif(e.message:findi("duties")) then
			if(e.other:GetFactionValue(e.self) >= 100) then
				e.self:Say("The primary duty of this temple is to spread terror, fright, and dread as a symbol of your devotion to our lord Cazic Thule. We are currently researching a means of summoning avatars of Fright, Terror and Dread, the primary minions of the Faceless in his home plane. Will you [assist me in summoning] the avatar of Fright?");
			elseif(e.other:GetFactionValue(e.self) >= 0) then
				e.self:Say("I sense the potential to learn the ways of fear within you. Continue striving to master your fear and one day perhaps you can be of service to our Lord Cazic-Thule.")		
			else
				e.self:Say("Begone from this place! Infidels like you have no place among the faithful of Cazic-Thule!")
			end
		elseif(e.message:findi("assist")) then
			if(e.other:GetFactionValue(e.self) >= 100) then
				e.self:Say("In order to summon the avatar of Fright. I require some special components for the ritual. Fetch me the flesh of a zombie. the dust used in the process of mummification. [charred bone chips]. and a [vial of Tunare's Breath].");
			elseif(e.other:GetFactionValue(e.self) >= 0) then
				e.self:Say("I sense the potential to learn the ways of fear within you. Continue striving to master your fear and one day perhaps you can be of service to our Lord Cazic-Thule.")
			else
				e.self:Say("Begone from this place! Infidels like you have no place among the faithful of Cazic-Thule!")
			end
		elseif(e.message:findi("chips")) then
			e.self:Say("Some time ago a necromancer by the name of Obretl was sent to slay Rathmana Allin and his abomination of an adopted son. Ortallius. Obretl failed in his task and now haunts a small ruin in the desert of Ro cursed by Solusek to wallow in his failure in the form of a burning skeleton. Slay Obretl to free him from his pathetic existence and gather his charred remains.");
		elseif(e.message:findi("vial")) then
			e.self:Say("Tunare's Breath is a life-giving potion created by the Fier'Dal Soldiers of Tunare. Seek out the druid Kalayia who is known to wander the Faydarks in search of reagents for potions. Procure from her a vial of Tunare's Breath. Shed her blood if need be.");
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("I hope you have a good reason for disturbing my contemplations.");	
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I need no fewer than four infected rat livers!! Now, go get me what I require!!";
	local text1 = "I require all four reagents, anything less is useless. Incompetence will get you nowhere amongst the faithful of Cazic-Thule!";

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18019})) then -- Harbingers of Fear Guild Note
		e.self:Say("You are welcomed into the fold. Now go out. and prove yourself. young one. You have much to learn about the Dark Truth.");
		e.other:Faction(e.self,265,100); -- Heretics
		e.other:Faction(e.self,242,-100); -- Deepwater Knights
		e.other:Faction(e.self,254,-100); -- Gate Callers
		e.other:Faction(e.self,231,-100); -- Craftkeepers
		e.other:Faction(e.self,233,-100); -- Crimson Hands
		e.other:QuestReward(e.self,0,0,0,0,13573,20); -- Blood Splattered Tunic
	end

	if(eq.is_the_ruins_of_kunark_enabled()) then
		if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13270, item2 = 13270, item3 = 13270, item4 = 13270},1,text)) then
			e.self:Say("Well done, go now and continue your contemplations of fear. Keep up with your [duties] and you will soon be reaping the rewards granted by our Lord Cazic-Thule!!");
			e.other:Faction(e.self,265,5); -- Faction: Heretics
			e.other:Faction(e.self,231,-5); -- Faction: Craftkeepers
			e.other:Faction(e.self,233,-5); -- Faction: Crimson Hands
			e.other:Faction(e.self,242,-5); -- Faction: Deepwater Knights
			e.other:Faction(e.self,254,-5); -- Faction: Gate Callers
			e.other:QuestReward(e.self,math.random(10),math.random(20),0,0,1437,500);
		elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13074, item2 = 16990, item3 = 14102, item4 = 14103},1,text1)) then
			e.self:Say("Excellent Job " .. e.other:GetCleanName() .. ". These components will help with our research immeasurably. You will soon be reaping the rewards granted by our Lord Cazic-Thule!! If you want to further assist our research effots, talk to Atdehim Sqonci.");
			e.other:Faction(e.self,265,30); -- Faction: Heretics
			e.other:Faction(e.self,231,-30); -- Faction: Craftkeepers
			e.other:Faction(e.self,233,-30); -- Faction: Crimson Hands
			e.other:Faction(e.self,242,-30); -- Faction: Deepwater Knights
			e.other:Faction(e.self,254,-30); -- Faction: Gate Callers
			e.other:QuestReward(e.self,0,0,0,0,14100,1000);
		end
		item_lib.return_items(e.self, e.other, e.trade)
	end
end
--END of FILE Zone:paineel  ID:75072 -- Sern_Adolia
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
