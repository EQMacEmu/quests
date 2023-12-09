function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is always a pleasure to meet a new face. We have many who travel far and wide to visit our great academy. Many who brave the long trip by boat. Many who dare to cross the territory of the [Deathfist orcs].");
	elseif(e.message:findi("deathfist orcs")) then
		e.self:Say("The Deathfist are a clan of orcs. They are not very powerful, yet I hear they dabble in the circles of magic. Their skills in the ways of magic are limited. It is my duty to study them. I shall pay for your services. Will you [assist with the research]?");
	elseif(e.message:findi("assist with the research")) then
		e.self:Say("Yes. You will do. Go into the lands which surround Freeport. There you shall encounter Deathfist apprentices. They are as young as yourself and each should carry an orc cantrip. Return one for further studies. Do so and you will earn your pay as well as our respect.");
	elseif(e.message:findi("test the might of the orc oracles")) then
		if(e.other:GetFactionValue(e.self) >= 200) then
			e.self:Say("You have heightened your knowledge to the appropriate rank. You are ready to challenge the Deathfist oracles. Do so and return one oracle scroll which any of them may have. If I am in a good mood when you return, you shall soon be summoning elementals.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The word of mouth in the Academy of Arcane Science is that you are no foe, but you have yet to prove your worth to us. Perform more tasks for the great Tara Neklene.");
		else
			e.self:Say("You had best leave my sight. I am a faithful member of the Academy of Arcane Science and you are no ally of ours.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13845})) then
		e.self:Say("Very fine work, my young apprentice. This shall be very useful in understanding their ways. I have heard rumors of a scribe who can decipher these scrolls. He is said to frequent the local taverns. Bah!! If I cannot decipher them, no one can!! Continue with your work. Soon you shall advance enough to [test the might of the orc oracles].");
		e.other:Faction(e.self,220,10,0); -- Arcane Scientists
		e.other:Faction(e.self,281,2,0); -- Knights of Truth
		e.other:Faction(e.self,296,-1,0); -- Opal Dark Briar
		e.other:Faction(e.self,330,-1,0); -- Freeport Militia
		e.other:QuestReward(e.self,math.random(15),math.random(15),0,0,eq.ChooseRandom(13005,13007,13002,13006),250); -- Iron Ration, Ration, Torch, Water Flask  
	elseif(e.other:GetFactionValue(e.self) >= 200 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13225})) then
		e.self:Say("Wonderful! You have survived the might of an oracle. With this we can now continue our experiments. Now you may continue your teaching and study the power to summon those of earth, air, water and fire.");
		e.other:Faction(e.self,220,15,0); -- Arcane Scientists
		e.other:Faction(e.self,281,3,0); -- Knights of Truth
		e.other:Faction(e.self,296,-2,0); -- Opal Dark Briar
		e.other:Faction(e.self,330,-2,0); -- Freeport Militia
		e.other:QuestReward(e.self,math.random(15),math.random(15),math.random(2),0,eq.ChooseRandom(15317,15058,15316,15315),500); -- Spells : Elementalkin Air, Earth, Fire, Water
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Tara_Neklene