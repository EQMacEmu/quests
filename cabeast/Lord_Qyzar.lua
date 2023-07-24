--Lord Qyzar is for the Greenmist quest and administers the fourth, fifth, and sixth quests in the line.

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks upon you with a sneer. 'What is the year of our birth and who was our Father?'");
	elseif(e.message:findi("371 AG.* Rile") or e.message:findi("Rile.* 371 AG")) then --Test of the Zealot (Greenmist Quest 4/8)
		e.self:Say("You are a student of our ways? I would hope so. I seek a knight in search of a way to prove his allegiance and a way to earn his [zealot khukri].");
	elseif(e.message:findi("zealot khukri")) then --Test of the Zealot (Greenmist Quest 4/8)
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("In search of a zealot khukri? I have heard much of your deeds to aid us. I offer it to you in exchange for your service. I have dispatched a knight named Grizzle to seek out the Kromdul fortress called Chalp. He was to secretly map Chalp and return with a [Chalp diagram]. He has yet to return. Perhaps you can [rescue Grizzle].");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Crusaders of Greenmist demand further devotion to our ways before the knowledge you seek shall be revealed.");
		else
			e.self:Say("Ignorant lout!  The Crusaders of Greenmist shall have nothing to do with you.  Go while I ponder your suffering to come.");
		end
	elseif(e.message:findi("chalp diagram")) then --Test of the Zealot (Greenmist Quest 4/8)
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Emote("grimaces in pure disgust. 'I have been awaiting the Chalp diagram from a knight named Grizzle, but alas, he has proven himself weak. He has been taken prisoner by one of the Kromdul of Chalp. If only there were another knight I could send to [rescue Grizzle] and return the Chalp diagram...'");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Crusaders of Greenmist demand further devotion to our ways before the knowledge you seek shall be revealed.");
		else
			e.self:Say("Ignorant lout!  The Crusaders of Greenmist shall have nothing to do with you.  Go while I ponder your suffering to come.");
		end
	elseif(e.message:findi("rescue grizzle")) then --Test of the Zealot (Greenmist Quest 4/8)
		e.self:Say("If you can find the knight in Chalp and have him hand you the Chalp diagram, you shall become a zealot and wield a zealot khukri. All I need are the Chalp diagram and your knight khukri.");
	elseif(e.message:findi("matter of betrayal")) then --Test of the Betrayal (Greenmist Quest 5/8)
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("One of our agents, a hero by the name of Goxnok, has found evidence that the book entitled 'Charasis' has been taken from this temple and is to be delivered to an unknown foe in the Outlands. Go at once to the lower levels of the temple and greet Goxnok. Hurry, before he departs!");
			eq.unique_spawn(106301,0,0,-113,1000,-23.9,30); --
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Crusaders of Greenmist demand further devotion to our ways before the knowledge you seek shall be revealed.");
		else
			e.self:Say("Ignorant lout!  The Crusaders of Greenmist shall have nothing to do with you.  Go while I ponder your suffering to come.");
		end
	elseif(e.message:findi("visceral dagger")) then --Test of the Hero (Greenmist Quest 6/8)
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("The visceral dagger was an ancient torturing weapon. I do not know much of it other than that it was forged by a member of the Brood of Kotiz, but that was ages ago. He is surely dust by now.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Crusaders of Greenmist demand further devotion to our ways before the knowledge you seek shall be revealed.");
		else
			e.self:Say("Ignorant lout!  The Crusaders of Greenmist shall have nothing to do with you.  Go while I ponder your suffering to come.");
		end
	elseif(e.message:findi("greenmist")) then 
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Emote("shudders at the mention of Greenmist.  'What?!  Have you stumbled upon the ancient weapon of the Father?  Do not fill my ears with such knowledge.  It can only be delivered to the ears of the Arch Duke.  Go at once and speak with him!");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Crusaders of Greenmist demand further devotion to our ways before the knowledge you seek shall be revealed.");
		else
			e.self:Say("Ignorant lout!  The Crusaders of Greenmist shall have nothing to do with you.  Go while I ponder your suffering to come.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "There shall be no zealot khukri until I have the Chalp diagram and your knight khukri.";		
	local text2 = "You disappoint me. I must have the Charasis Tome and its copy along with your zealot khukri.";	
	local text3 = "I am saddened by your failure to procure the visceral dagger and your crusader khukri. You are no hero!!";
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12496, item2 = 5123},1,text1)) then --Test of the Zealot (Greenmist Quest 4/8)
		e.self:Say("At last!! The Chalp diagram. I shall see that the emperor gets this at once. You have proven yourself more than just a mere knight, you are a zealot. Being new to the temple we have need of you in a [matter of betrayal].");
		e.other:Faction(e.self,442,10); -- Faction: Crusaders of Greenmist
		e.other:Faction(e.self,441,2); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,math.random(0,10),math.random(0,2),5124,1600); -- Item: Zealot's Khukri
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1730, item2 = 5124, item3 = 1729},1,text2)) then --Test of Betrayal (Greenmist Quest 5/8)
		e.self:Say("Congratulations! You are now a true crusader, but there is no time for celebration. We have lost two of our operatives. Crusaders Golin and Fodcod were dispatched to seek out an ancient artifact, the [visceral dagger]. Where they have gone, I do not know. They have been gone far too long. Find them and return the dagger to me with your crusader khukri and you shall be a hero.");
		e.other:Faction(e.self,442,20); -- Faction: Crusaders of Greenmist
		e.other:Faction(e.self,441,5); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,math.random(0,10),math.random(0,2),5125,2000); -- Item: Crusader's Khukri
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 7324, item2 = 5125},1,text3)) then --Test of the Hero (Greenmist Quest 6/8)
		e.self:Emote("gazes in astonishment at the dagger. 'Ahhh!! You have brought the sacred visceral dagger back to the Temple of Terror. Let all be aware that the great " .. e.other:GetCleanName() .. " has returned to Cabilis a hero!! You now wield the weapon of a hero. Hail, " .. e.other:GetCleanName() .. ", hero of the Crusaders of Greenmist.");
		e.other:Faction(e.self,442,20); -- Faction: Crusaders of Greenmist
		e.other:Faction(e.self,441,5); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,math.random(0,10),math.random(0,3),5126,3000); -- Item: Hero's Khukri
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
