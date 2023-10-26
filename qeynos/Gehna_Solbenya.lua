function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings and blessings to you, " .. e.other:GetCleanName() .. ". Karana offers you his protection and guidance. All who accept the offer shall find safe haven within our Temple of Thunder, If you are a cleric of Karana, you must have a [desire to serve Karana]'s flock.");
	elseif(e.message:findi("serve karana")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("If you are a young acolyte, you may [deliver blessings to the flock] and if you are a skilled cleric, we need you to [hunt bandit binders].");	
		else
			e.self:Say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
		end
	elseif(e.message:findi("deliver.* flock")) then					
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Then go to the Plains of Karana. It is there that the blessings are needed. Ask every resident of the plains if they are followers of Karana. If they are, then ask them if they [require Karana's blessings]. Let them drink from this temple chalice. Return the empty chalice to me and you shall never go thirsty again.");
			e.other:SummonCursorItem(12103); -- Item: A Full Chalice
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us.  But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
		else
			e.self:Say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
		end
	elseif(e.message:findi("hunt.* binders")) then
		if(e.other:GetFactionValue(e.self) >= 250) then	-- requires mid amiably
			e.self:Say("Go to the Plains of Karana and seek out the Karana Bandits. Among them can be found their bandit binders. They are healers of sorts. Which evil deity granted them this power is unknown to us. Each carries a binder spectacle. I shall reward clerics for every two returned spectacles. Perhaps a new power may even be bestowed.");				
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us.  But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
		else
			e.self:Say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
		end
	elseif(e.message:findi("karana") or e.message:findi("rainkeeper")) then
		e.self:Say("Karana, the Rainkeeper, is the provider of the storms. If it were not for the storms of Karana, life would not flourish. All should pay tribute to the Rainkeeper.")							
	elseif(e.message:findi("bertoxxulous")) then
		e.self:Say("Bertoxxulous, the Plaguebringer, is the Lord of Disease. It is he who smites Norrath with his diseases and imperfections. Those who follow him are called [Bloodsabers].");
	elseif(e.message:findi("bloodsaber")) then
		e.self:Say("It is rumored that there is a shrine in the great city of Qeynos which pays homage to the Plaguebringer, Bertoxxulous. The members of this vile church of the damned are called the Bloodsabers. They are dreaded shadowknights, necromancers and evil clerics. It is our duty to destroy all who dare to pray to such a deity. Join our fight. Speak more of this matter with Chesgard Sydwend.");
	elseif(e.message:findi("heal")) then
		e.self:Say("If you need to be healed, I suggest you speak with the Priests of Life. You can find them in the Temple of Life on the other side of Qeynos. The only service you can pay for here is holy armor. Daedet Losaren charges followers of Karana for that blessing.");
	end
end

function event_trade(e)
	local item_lib =require("items");
	local text = "The bounty will not be paid until two spectacles are received.";
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12104})) then
		e.self:Say("You have done a good service for the flock of Karana. Study the words upon this scroll and soon Karana shall keep you from thirst.");
		-- Confirmed Live Faction
		e.other:Faction(e.self,280,10,0); -- Faction: Knights of Thunder
		e.other:Faction(e.self,221,-10,0); -- Faction: Bloodsabers
		e.other:Faction(e.self,341,7,0); -- Faction: Priests of Life
		e.other:Faction(e.self,262,7,0); -- Faction: Guards of Qeynos
		e.other:QuestReward(e.self,math.random(20),math.random(20),0,0,eq.ChooseRandom(15210,15207,15201),2000);
	elseif(e.other:GetFactionValue(e.self) >= 250 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12101,item2 = 12101},1,text)) then -- spectacle
		e.self:Say("Excellent work. These foul men have no right to be proficient in the ways of healing. Here then is your bounty. Use it in your continued war against the Karana bandits.");
		-- Confirmed Live Faction
		e.other:Faction(e.self,280,20,0); -- Faction: Knights of Thunder
		e.other:Faction(e.self,221,-20,0); -- Faction: Bloodsabers
		e.other:Faction(e.self,341,15,0); -- Faction: Priests of Life
		e.other:Faction(e.self,262,15,0); -- Faction: Guards of Qeynos
		e.other:QuestReward(e.self,0,math.random(10),math.random(20),0,eq.ChooseRandom(15226,15219),20000); -- Spell: Endure Disease or Spell: Center
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
