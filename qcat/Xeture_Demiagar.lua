function event_say(e)
	if(eq.is_the_shadows_of_luclin_enabled()) then
		if(e.message:findi("hail")) then
			if(e.other:GetFactionValue(e.self) >= -500) then	
				e.self:Say("I have much to do here for the defense of our Temple and the appeasing of our patron Bertoxxulous, the Plague Lord. If the Plague Lord has gifted you with the desire to [serve his will] as a priest of the Bloodsabers I will assist in your training. If not, then leave me now and do not interrupt me again.");
			else
				e.self:Say("The lair of the Bloodsabers is no place for you...  begone, or be dead!");	
			end
		elseif(e.message:findi("serve his will")) then
			if(e.other:GetFactionValue(e.self) >= -500) then
				e.self:Say("By spreading the disease, decay, and destructive powers of the Plague Lord you will in turn be gifted with great insight and power. First however you must learn to survive in this city, surrounded by those who would see you destroyed for your faith. Take this note to Torin Krentar. He will instruct you on how to acquire a suit of armor to protect you from the weapons of our [enemies].");
				e.other:SummonCursorItem(20207); -- Item: Note to Torin Krentar
			else
				e.self:Say("The lair of the Bloodsabers is no place for you...  begone, or be dead!");	
			end
		elseif(e.message:findi("enemies")) then
			if(e.other:GetFactionValue(e.self) >= -500) then
				e.self:Say("The self-righteous ruler of this city, Antonius Bayle IV, is backed by the Knights of Thunder, paladins and clerics of the Storm Lord Karana, and the Temple Life, paladins and clerics of the Prime-Healer, Rodcet Nife. Be wary when not within the security of our temple here in the Qeynos Catacombs, should the Qeynos Guards discover you allegiances they would have you executed. Once you have been properly armored return to me and I will give you [further instruction].");
			else
				e.self:Say("The lair of the Bloodsabers is no place for you...  begone, or be dead!");	
			end
		elseif(e.message:findi("further instruction")) then
			if(e.other:GetFactionValue(e.self) >= -500) then
				e.self:Say("The Priests of Life, those who claim allegiance to the Prime Healer, Rodcet Nife, have proven to be a large obstacle in our conversion of the people of Qeynos to the ways of the Plague Bringer. Lately a Priest of Life by the name of Rolon Banari has been campaigning amongst the beggars and sickly, a social group from which we have gained many converts. Find this meddling priest and bring me his head.");
			else
				e.self:Say("The lair of the Bloodsabers is no place for you...  begone, or be dead!");	
			end	
		end
	else
		if(e.message:findi("hail")) then
			if(e.other:GetFactionValue(e.self) >= -500) then	
				e.self:Say("I have much to do here for the defense of our Temple and the appeasing of our patron Bertoxxulous, the Plague Lord. If the Plague Lord has gifted you with the desire to serve his will as a priest of the Bloodsabers I will assist in your training. If not, then leave me now and do not interrupt me again."); -- made up text
			else
				e.self:Say("The lair of the Bloodsabers is no place for you...  begone, or be dead!");	
			end		
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18716})) then --Tattered Note
		e.self:Say("Hmmm. Another rat has found its way to my doorstep, huh? Well, we may have use for you. Go find Rihtur, maybe he has an errand for you.");
		e.other:Faction(e.self,221,100); --Bloodsabers
		e.other:Faction(e.self,262,-15); --Guards of Qeynos
		e.other:Faction(e.self,296,10); --Opal Dark Briar
		e.other:Faction(e.self,341,-25); --Priest of Life
		e.other:Faction(e.self,230,5); --Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,13598,100); --Ruined Training Tunic*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20197})) then
		e.self:Say("You have done well, " .. e.other:GetCleanName() .. ". Take this Rusty Bloodsaber Mace to a forge and clean it up with a Sharpening Stone. It may take you several attempts to get all the rust off if you are not familiar with the process. Once that is done take the Refined Bloodsaber Mace to Torin Krentar with a Giant King Snake Skin and he will put the finishing touches on the weapon.");
		e.other:Faction(e.self,221,10); -- Faction: Bloodsabers
		e.other:Faction(e.self,262,-1); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,296,-1); -- Faction: Opal Dark Briar
		e.other:Faction(e.self,341,-2); -- Faction: Priests of Life
		e.other:Faction(e.self,230,1); -- Faction: Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,20198);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
