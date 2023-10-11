function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Temple of Life, where the will of Rodcet Nife, the Prime Healer, is carried out.  I am the High Priestess Jahnda.  If you require any training in our ways, please talk to any of our priests or any of the paladins of the Temple of Life.");
	elseif(e.message:findi("blessed oil")) then
		e.self:Say("I do not distribute the blessed oil of life. Please speak with Nomsoe Jusagta. Tell Nomsoe that Brother Estle needs the blessed oil.");
	elseif(e.message:findi("hayle mool")) then
		e.self:Say("Brother Hayle Mool is one of our finest clerics. He could convert anyone to the ways of Rodcet Nife. Recently, he has been out in the [Plains of Karana] trying to befriend the [Splitpaw clan]. I pray he has not become their prisoner or even worse, their dinner.");
	elseif(e.message:findi("paw")) then
		e.self:Say("Paw is a gnoll burrow. It is said to be located somewhere in the Plains of Karana. The gnolls of this burrow is rarely seen. The fur of these gnolls is white, unlike their brothers in Blackburrow.");
	elseif(e.message:findi("bertoxxulous") or e.message:findi("plaguebringer")) then
		e.self:Say("Bertoxxulous is the evil Lord of Disease. It is he who demeans life with his wicked maladies.  It is said there are some who follow this monster.  They are called the [Bloodsabers].");
	elseif(e.message:findi("bloodsaber")) then
		e.self:Say("So you too have heard the rumors of the Bloodsabers?  These are followers of the lord of disease, Bertoxxulous.  It is our belief that they have begun to spread disease among the animals of Qeynos Hills.  We have yet to confirm their existence.  Please speak with Suuspa Clanim and the others.");
	elseif(e.message:findi("rodcet")) then
		e.self:Say("The Prime Healer, the giver of all life.  Rodcet Nife is the power which flows through every living being, be he good or evil.  It is in honor of Him that the Temple of Life was constructed.  It is for Him that we devote our lives to the extermination of all who would taint the glory of life.");
	elseif(e.message:findi("heal")) then
		e.self:Say("I cannot help you with your request.   You must speak with Brother Tonmerk Plorsin.");
	elseif(e.message:findi("honored member")) then
		if(e.other:GetFactionValue(e.self) >= 50) then
			e.self:Say("Yes.  The light of righteousness shines from within you.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Temple of Life smiles upon you, friend... but such a delicate matter can only be entrusted to our most loyal members.")
		else
			e.self:Say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");
		end
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18714}, 0)) then -- Tattered Note
		e.self:Say("Welcome to the Temple of Life. I am Jahnda, the High Priestess of the Clerics of Nife. Wear this tunic with pride and carry out the will of Nife. Please, see Tonmerk Plorsin or Nomsoe Jusagta. They will help get you started spreading the will of The Prime Healer.");
		e.other:Faction(e.self,341,100,0); -- Priest of Life
		e.other:Faction(e.self,280,30,0); -- Knight of Thunder
		e.other:Faction(e.self,262,50,0); -- Guards of Qeynos
		e.other:Faction(e.self,221,-25,0); -- Bloodsabers
		e.other:Faction(e.self,219,15,0); -- Antonius Bayle
		e.other:QuestReward(e.self,0,0,0,0,13506,100); -- Faded Tunic*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13724}, 0)) then
		e.self:Say("Excellent work! You are surely under the protection and guidance of the Prime Healer. This evidence will help us greatly to convince Antonious and the guild leaders of Qeynos that the Bloodsabers are here and seek to destroy all we have worked so long for.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,341,50); -- Priest of Life
		e.other:Faction(e.self,280,15); -- Knight of Thunder
		e.other:Faction(e.self,262,25); -- Guards of Qeynos
		e.other:Faction(e.self,221,-12); -- Bloodsabers
		e.other:Faction(e.self,219,7); -- Antonius Bayle
		if(math.random(100) > 5) then
			e.other:QuestReward(e.self,math.random(0,10),math.random(0,10),math.random(0,10),0,eq.ChooseRandom(14007,14003),4000);
		else
			e.other:QuestReward(e.self,math.random(0,10),math.random(0,10),math.random(0,10),0,eq.ChooseRandom(13723,13720),4000);
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13911}, 0)) then -- PrayerBeads
		e.self:Say("Oh my word!! This is terrible news. This belongs to Hayle Mool. He has been captured by the Splitpaw Clan while in Karana. You must go to his aid. We cannot do so at this time. Here. Be sure to hand him this summons. I will need to speak with him.");
		e.other:QuestReward(e.self,0,0,0,0,18927); -- Temple Summons
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
