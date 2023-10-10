function event_signal(e)
	e.self:Say("Hire one soon, Wolten. We need to get in touch with Drosco!");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Temple of Thunder. We are home to paladins and clerics who follow the ways of Karana. Do you [need guidance] or are you [already a follower of Karana]?"); 
	elseif(e.message:findi("need guidance")) then
		e.self:Say("Then go forth into the church and speak with Gehna Solbenya. She will assist you."); 
	elseif(e.message:findi("follower of karana") or e.message:findi("wish to assist")) then
		if(e.other:GetFaction(e.self) <= 4) then
			if(e.message:findi("follower of karana")) then
				e.self:Say("So you are one with our cause? This is good. Be aware that there are forces at work which not even the Qeynos Guard can keep at bay. We are here to spread the words of Karana and smite those who should try to end His children. We and Antonius Bayle shall work together in our destruction of evil. He requests our aid. Do you also [wish to assist Lord Bayle]?");
			elseif(e.message:findi("wish to assist")) then
				e.self:Say("Then we command you to assist the Qeynos Guard with the destruction of Blackburrow. Report to Captain Tillin of Qeynos Guard and speak with him of the [gnolls of Blackburrow]. I believe he is at the arena. My loyal friend, if you have earned your Thunder Staff, I urge you to [retrieve the Bayle list].");						
			end		
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us.  But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
		else
			e.self:Say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
		end	
	elseif(e.message:findi("retrieve the Bayle list")) then
		if(e.other:GetFactionValue(e.self) >= 900) then
			e.self:Say("The Temple of Thunder was asked by Antonius Bayle to retrieve a list. He does not trust his own militia of late. He asked me to send a knight to the Jaggedpine to find a man named Frenway Marthank. When you find him, you are to tell him that [Toe needs the Bayle List]. Return the Bayle List and your Thunder Staff to me and I shall provide a fine reward. Be aware that the shadowknights of Bertoxxulous are also after the list. Be careful!");	
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us.  But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
		else
			e.self:Say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
		end			
	elseif(e.message:findi("honored member")) then
		if(e.other:GetFactionValue(e.self) >= 50) then
			e.self:Say("Yes.  The light of righteousness shines from within you.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us.  But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
		else
			e.self:Say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
		end	
	elseif(e.message:findi("drosco")) then
		e.self:Say("Have you knowledge of Sir Drosco? He is a Knight of Thunder and reports to Sir Wolten. He has been missing for quite some time. I believe Sir Wolten has begun a search for him."); 
	elseif(e.message:findi("karana")) then
		e.self:Say("Karana, the Rainkeeper, is the provider of the storms. If it were not for the storms of Karana, life would not flourish. All should pay tribute to the Rainkeeper.");
	elseif(e.message:findi("bertoxxulous")) then
		e.self:Say("Bertoxxulous, the Plaguebringer, is the Lord of Disease. It is he who smites Norrath with his diseases and imperfections. Those who follow him are called [Bloodsabers].");
	elseif(e.message:findi("bloodsaber")) then
		e.self:Say("It is rumored that there is a shrine in the great city of Qeynos which pays homage to the Plaguebringer, Bertoxxulous. The members of this vile church of the damned are called the Bloodsabers. They are dreaded shadowknights, necromancers and evil clerics. It is our duty to destroy all who dare to pray to such a deity. Join our fight. Speak more of this matter with Chesgard Sydwend.");
	elseif(e.message:findi("healer")) then
		e.self:Say("If you need to be healed, I suggest you speak with the Priests of Life. You can find them in the Temple of Life on the other side of Qeynos. The only service you can pay for here is holy armor. Daedet Losaren charges followers of Karana for that blessing.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I thank you, but before I reward you I must have both the Bayle List II and your Thunder Staff.";

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18710},0)) then
		e.self:Say("Greetings, fellow knight of Karana, and welcome to the Temple of Thunder! Here, wear this tunic and help our crusade. Wolten Grafe is my assistant, he will get you started and teach you the ways of the Rainkeeper.");
		e.other:Faction(e.self,280,100,0); -- Faction: Knights of Thunder
		e.other:Faction(e.self,221,-100,0); -- Faction: Bloodsabers
		e.other:Faction(e.self,341,75,0); -- Faction: Priests of Life
		e.other:Faction(e.self,262,75,0); -- Faction: Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,13505,100); -- Old Gray Tunic*
	elseif(e.other:GetFaction(e.self) < 3 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18809,item2 = 6357},1,text)) then
		e.self:Say("Antonius Bayle will be pleased. The Temple is also pleased. Here is the enchanted staff we call Bonethunder. Should you find the enchantment gone, just ask Kasine to [enchant Bonethunder]. We need more disciples like you! Go forth to tell the world of the Rainkeeper.");
		e.other:Faction(e.self,280,50,0); -- Faction: Knights of Thunder
		e.other:Faction(e.self,221,-50,0); -- Faction: Bloodsabers
		e.other:Faction(e.self,341,37,0); -- Faction: Priests of Life
		e.other:Faction(e.self,262,37,0); -- Faction: Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,6358,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1136 -- Runethar_Hamest 

