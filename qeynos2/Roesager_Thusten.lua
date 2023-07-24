function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. "!  My name is Roesager Thusten. Paladin of Life.  I am a loyal servant of the Prime Healer and I seek to destroy all who wish to bring death and disease to the land of Norrath.");
	elseif(e.message:findi("prime")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("Rodcet Nife is the Prime Healer.  It is He who gives us the power to resist the decay and death that Bertoxxulous has released upon Norrath.  The Temple of Life is dedicated to His honor.");
		else
			e.self:Say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");
		end
	elseif(e.message:findi("disease")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("The Plaguebringers are followers of the disease lord, Bertoxxulous. We  believe a sect of them now operates in Qeynos, be we need proof before we can act.");
		else
			e.self:Say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");
		end
	elseif(e.message:findi("Bertoxxulous")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("Bertoxxulous is a vile creature who rules the Plane of Disease. His filthy followers are spreading their stain across all of Norrath. We fear they are already here in Qeynos.");	
		else
			e.self:Say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");
		end
	elseif(e.message:findi("proof")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("Someone reported seeing a Plaguebringer roaming about in the hills near Qeynos. We have long suspected that their dark influence was spreading. I am searching for proof that they are now here in Qeynos.  If you find anything, please bring it to me at the Temple of Life.");
		else
			e.self:Say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");
		end
	elseif(e.message:findi("temple of life")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("The Temple of Life, dedicated to the glory of the Prime Healer, is in the heart of North Qeynos. Enter the glowing disks above the Pool of Jahnda and you will magically appear inside the temple.");
		else
			e.self:Say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");		
		end
	elseif(e.message:findi("niclaus")) then
		if(e.other:GetFactionValue(e.self) >= 200) then
			e.self:Say("Niclaus Ressinn? Have you seen him? He is one of our paladins who was sent out to investigate the undead sightings in Qeynos Hills. I have a message from Jahnda for him, but I must continue my own search here in Qeynos. Could you take this to Niclaus? Your help would be appreciated.");
			e.other:SummonCursorItem(18970);
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Temple of Life smiles upon you, friend... but such a delicate matter can only be entrusted to our most loyal members.");
		else
			e.self:Say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18802}, 0)) then -- A Sealed Letter (Letter to Opal)
		e.self:Say("Rodcet be praised!! This is what we have been searching for! On behalf of the Temple of Life, let me thank you and offer you this small reward for your aid in our war against the Plaguebringer.");
		e.other:Faction(e.self,341,50,0); -- Priest of Life
		e.other:Faction(e.self,280,15,0); -- Knight of Thunder
		e.other:Faction(e.self,262,25,0); -- Guards of Qeynos
		e.other:Faction(e.self,221,-12,0); -- Bloodsabers
		e.other:Faction(e.self,219,7,0); -- Antonius Bayle
		e.other:QuestReward(e.self,0,0,0,0,14007,100); -- Potion of Light Healing
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:qeynos2  ID:2049 -- Roesager_Thusten