function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, noble " .. e.other:GetCleanName() .. ". Remember to spread the words of Karana throughout the faraway lands on which you shall tread. We of the Temple of Thunder are looking for new members - good people who [wish to join our cause]. Let the call go out!");
	elseif(e.message:findi("join the cause")) then
		e.self:Say("That IS good news! If you walk the righteous path of the Rainkeeper, Karana, then you are truly noble. I have need of someone like that. I must find someone to perform a [dangerous mission] or perhaps you would rather [seek out the Rat King] or [crush the undead].");
	elseif(e.message:findi("crush the undead")) then
		if(e.other:GetFactionValue(e.self) >= -500) then -- need exact faction, it's between -375 and Scowls
			e.self:Say("Those who passed generations ago have had their bones exhumed and enchanted. Some evil force plagues this land with these evil skeletons. You will fight for us and crush the skeletons. Take this box and fill it with the bones of those creatures. We will not allow them to rise again and you shall earn our respect. Go forth and fight for Karana!");
			e.other:SummonCursorItem(17941); -- Box for bones
		else
			e.self:Say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
		end	
	elseif(e.message:findi("dangerous mission")) then		
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("You must go into the catacombs and find a man named Drosco Finlayer. Pass him this note. He has been deep undercover in the Shrine of Bertoxxulous and will have directions to that vile place. To do this will surely show your allegiance to this temple.");
			e.other:SummonCursorItem(18804); -- Item: A Tattered Note
		else
			e.self:Say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
		end			
	elseif(e.message:findi("seek out the Rat King")) then
		e.self:Say("Under this city lie the catacombs of Qeynos. Somewhere down there lurks the Rat King. None have truly seen him, but we know of him. It is he who plagues us with the recent infestation of rats. Why? Who knows? We need a brave member to [hunt the Rat King].");
	elseif(e.message:findi("hunt the Rat King")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Say("You are truly brave, young knight. Go to the catacombs. Find the Rat King. Bring me his head as proof of your noble deed. He must be stopped. Beware of his allies. May Karana watch over you.");
		else
			e.self:Say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
		end
	elseif(e.message:findi("Bertoxxulous")) then
		e.self:Say("Bertoxxulous, the Plaguebringer, is the Lord of Disease. It is he who smites Norrath with his diseases and imperfections. Those who follow him are called [Bloodsabers].");				
	elseif(e.message:findi("Bloodsabers")) then
		e.self:Say("It is rumored that there is a shrine in the great city of Qeynos which pays homage to the Plaguebringer, Bertoxxulous. The members of this vile church of the damned are called the Bloodsabers. They are dreaded shadowknights, necromancers and evil clerics. It is our duty to destroy all who dare to pray to such a deity. Join our fight. Speak more of this matter with Chesgard Sydwend.");					
	elseif(e.message:findi("karana")) then
		e.self:Say("Karana, the Rainkeeper, is the provider of the storms. If it were not for the storms of Karana, life would not flourish. All should pay tribute to the Rainkeeper.");
	elseif(e.message:findi("healer")) then
		e.self:Say("If you need to be healed, I suggest you speak with the Priests of Life. You can find them in the Temple of Life on the other side of Qeynos. The only service you can pay for here is holy armor. Daedet Losaren charges followers of Karana for that blessing.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 4) then
		e.self:Say("Your Excellency, we need to recruit a newcomer to find and infiltrate the Shrine of Bertoxxulous. The Shrine's eyes are watching all our moves.");
		eq.signal(1128,1); -- NPC: Runethar_Hamest
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13882})) then -- A box of bones
		e.self:Say("You have done well. Let it be known to all that you fight for the Rainkeeper. Go and continue the battle.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,280,10,0); -- Knights of Thunder
		e.other:Faction(e.self,221,-10,0); -- Bloodsabers
		e.other:Faction(e.self,341,7,0); -- Preists of Life
		e.other:Faction(e.self,262,7,0); -- Guards of Qeynos
		e.other:QuestReward(e.self,math.random(10),math.random(5),0,0,eq.ChooseRandom(13006,13007),3050); -- Item: Water Flask, Ration ; exp data confirmed.
	elseif(e.other:GetFactionValue(e.self) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18805})) then
		e.self:Say("This is terrible news. It is good you did not find your grave in the catacombs. You completed your mission regardless of the odds of survival. The temple thanks you. We shall still require your service, Knight of Thunder. Events have transpired which put all agents of righteousness in danger. We cannot explain all as yet. Take this note to Freeport. You will give it to Eestyana Naestra at the Hall of Truth. Beware, now. The Shrine of Bertoxxulous now knows of your allegiance. Give me any other item.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,280,50,0); -- Knights of Thunder
		e.other:Faction(e.self,221,-50,0); -- Bloodsabers
		e.other:Faction(e.self,341,37,0); -- Preists of Life
		e.other:Faction(e.self,262,37,0); -- Guards of Qeynos
		e.other:QuestReward(e.self,0,0,math.random(10),0,18822,500); -- Item: A Note ID's as: Note to hall of truth
	elseif(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13396})) then -- Rat Kings Head -- confirmed faction with lower than -300, wouldn't give quest but accepted human head
		e.self:Say("We have finally destroyed the Rat King. You have performed a great service to Qeynos. Here is a small reward. Please continue with the work of the Rainkeeper.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,280,50,0); -- Knights of Thunder
		e.other:Faction(e.self,221,-50,0); -- Bloodsabers
		e.other:Faction(e.self,341,37,0); -- Preists of Life
		e.other:Faction(e.self,262,37,0); -- Guards of Qeynos
		e.other:QuestReward(e.self,7,5,0,0,eq.ChooseRandom(2112, 2106, 2111, 2104, 2108),4900); -- Item(s): Patchwork Boots (2112) ; exp data confirmed
	elseif(e.other:GetFactionValue(e.self) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13288})) then -- Order of Thunder
		e.self:Say("Ahh. Drosco's Order of Thunder. You are truly an honorable knight. Many vile people would pay greatly for this medal. I thank you for its return. I shall honor you by rewarding you with a thunder staff. Meant for young clerics and paladins of this temple. Never let it leave your side.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,280,50,0); -- Knights of Thunder
		e.other:Faction(e.self,221,-50,0); -- Bloodsabers
		e.other:Faction(e.self,341,37,0); -- Preists of Life
		e.other:Faction(e.self,262,37,0); -- Guards of Qeynos
		e.other:QuestReward(e.self,0,0,math.random(10),0,6357,2000); -- Thunder Staff.
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1043 -- Wolten_Grafe 

