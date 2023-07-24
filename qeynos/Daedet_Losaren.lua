function event_say(e)
	local fac = e.other:GetFaction(e.self);
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, " .. e.other:GetCleanName() .. ". I am Deadet Losaren, faithful priest of Karana. You appear to be in search of [guidance] or perhaps you are merely a [visitor to the temple of thunder] wishing the blessing of [holy armor]?");
	elseif(e.message:findi("guidance")) then
		if(fac < 5) then
			e.self:Say("So it is guidance you seek. You will begin on the bottom rung. There is much more to our temple than the bashing of foes. We will need you to [collect donations].");
		elseif(fac == 5) then
			e.self:Say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us. But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
		elseif(fac > 5) then
			e.self:Say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");	
		end			
	elseif(e.message:findi("collect donation")) then
		if(fac < 5) then
			e.self:Say("Then you are a new acolyte. Take this Chest of Faith into Qeynos and Qeynos Hills. Find me six residents will to donate to the Temple of Thunder. Combine these donations within the Chest of Faith and return it to me. Do so and I shall reward you with the spell 'Ward Undead.' Now go and spread the Word of Karana.");
			e.other:SummonCursorItem(17925); -- Chest of Faith (container)
		elseif(fac == 5) then
			e.self:Say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us. But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
		elseif(fac > 5) then
			e.self:Say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");	
		end			
	elseif(e.message:findi("visitor to the temple of thunder")) then
		e.self:Say("Then feel free to look around and speak with the priests and paladins of Thunder. May you find ways to serve the Rainkeeper.");
	elseif(e.message:findi("holy armor")) then
		e.self:Say("Holy Armor? I offer the blessing of Holy Armor to members in good standing of the Knights of Thunder. I must charge ten gold for the service. [Components] are expensive these days!");
	elseif(e.message:findi("components")) then
		e.self:Say("Components are required for my daily tribute to the Rainkeeper. It is he whose power flows from my body. I require a faithful acolyte to [gather the required items].");
	elseif(e.message:findi("gather the required items")) then
		if(fac < 5) then
			e.self:Say("Very noble of you. Take this chest. I will require it to be filled with flame beetle eyes. Four normal beetles and four [Kerra Isle beetles]. Combine these items within the chest and return it to me. I shall reward you with the protection of Holy Armor.");
			e.other:SummonCursorItem(17934); -- Beetle Eye Chest (container)
		elseif(fac == 5) then
			e.self:Say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us. But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
		elseif(fac > 5) then
			e.self:Say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");	
		end			
	elseif(e.message:findi("Kerra Isle beetles")) then
		e.self:Say("Kerra Isle beetles are normally found in the vicinity of the Kerra catpeople. They can be found in Kerra Ridge, but a closer and perhaps safer location would be on the island between Antonica and Odus. The outcast catpeople of that island are far less dangerous.");
	elseif(e.message:findi("karana") or e.message:findi("Rainkeeper")) then
		e.self:Say("Karana, the Rainkeeper, is the provider of the storms. If it were not for the storms of Karana, life would not flourish. All should pay tribute to the Rainkeeper.");
	elseif(e.message:findi("Bertoxxulous")) then
		e.self:Say("Bertoxxulous, the Plaguebringer, is the Lord of Disease. It is he who smites Norrath with his diseases and imperfections. Those who follow him are called [Bloodsabers].");				
	elseif(e.message:findi("Bloodsabers")) then
		e.self:Say("It is rumored that there is a shrine in the great city of Qeynos which pays homage to the Plaguebringer, Bertoxxulous. The members of this vile church of the damned are called the Bloodsabers. They are dreaded shadowknights, necromancers and evil clerics. It is our duty to destroy all who dare to pray to such a deity. Join our fight. Speak more of this matter with Chesgard Sydwend.");		
	elseif(e.message:findi("drosco")) then
		e.self:Say("Have you knowledge of Sir Drosco? He is a Knight of Thunder and reports to Sir Wolten. He has been missing for quite some time. I believe Sir Wolten has begun a search for him."); 	
	elseif(e.message:findi("healer")) then
		e.self:Say("If you need to be healed, I suggest you speak with the Priests of Life. You can find them in the Temple of Life on the other side of Qeynos. The only service you can pay for here is holy armor. Daedet Losaren charges followers of Karana for that blessing.");
	end
	
	
end  

function event_trade(e)
	local fac = e.other:GetFaction(e.self);
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {gold = 20}) and (fac < 5)) then
		e.self:Say("This should help you remain safe.");
		e.other:SelfCast(11);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13395})) then -- Beetle Eye Chest (closed)
		e.self:Say("You have done well. Karana is pleased. I cannot say the same for the cat people. I now bestow upon you the knowledge of Holy Armor. Study the words and soon the power shall be bestowed upon you by the greatness that is the Rainkeeper.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,280,10,0); -- Knights of Thunder
		e.other:Faction(e.self,221,-10,0); -- Bloodsabers
		e.other:Faction(e.self,341,7,0); -- Priest of Life
		e.other:Faction(e.self,262,7,0); -- Guards of Qeynos
		e.other:QuestReward(e.self,math.random(20),0,0,0,15011,200); -- spell:holy armor
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13289})) then -- Chest of Faith (closed)
		e.self:Say("You have done supremely well, my young acolyte of Thunder. For your great service to the Temple of Thunder. Now go and cast the storm into the populace of Antonica.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,280,10,0); -- Knights of Thunder
		e.other:Faction(e.self,221,-10,0); -- Bloodsabers
		e.other:Faction(e.self,341,7,0); -- Priest of Life
		e.other:Faction(e.self,262,7,0); -- Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,15218,200); -- spell:ward undead
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
