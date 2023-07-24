-- Quests for Katta Castellum - Tilbok Furrunner: Runed Earring of Veracity, Signet Earring of Veracity and Traitor to the Validus Custodus

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:GetCleanName() .. ". Pleasure to meet you, I am Governor Tilbok Furrunner. I am tasked with the gathering and security of information for the Concilium Universus, the ruling council of our fine city.");
	elseif(e.message:findi("purpose")) then
		e.self:Say("The teaching in the city is that Katta feigned his death to blame it on Seru. When in fact Seru actually poisoned Katta. The crusade that Seru leads is false and must be stopped. We must gain access to Seru's [chambers] and destroy him and show the city the truth.");
	elseif(e.message:findi("chambers")) then
		e.self:Say("We do not know much about Seru's Chamber, that is what we need you to find out. This will require great effort on your part. We need you to infiltrate Sanctus Seru and bring back reports from each Consillium. I do not know who will have these reports, and I have only heard rumor that they exist. Return to me with the Satchel full, and your Etched Earring.");
	elseif(e.message:findi("action")) then
		e.self:Say("You must go see Lcea. She was Tsaph Katta's closest advisor. This matter has escalated greatly and must be placed in her hands. Ask her about the [Arx Key] she will no doubt ask in your service retrieving it. I salute your service to the city and wish you well.");
	elseif(e.message:findi("praesertum")) then -- This text is from where?
		e.self:Say("The four Praesertum can be found in the center of the city. Each has their own building, easily identified by the symbol above the main entrance. Stay clear of the Arx Seru, the central building. This is the resting place of Seru, who does not allow anyone but the Praesertum to disturb him. To venture inside is death for all that are not invited.");
	elseif(e.message:findi("who is Seru")) then
		e.self:Say("Seru is the genius behind the Combine Empire. A man of unfailing honor and honesty, he devised the Inquisition, to root out unclean elements in the Empire. His saddest day was when he discovered that Katta himself was a traitor. When confronted with proof of his treachery, Katta feigned his own murder, and fled to Luclin. Seru had no choice but to amass an expedition and follow after him.");
	elseif(e.message:findi("i will help")) then
		e.self:Say("Excellent. Find Claudius and give that to him- it's gibberish but he and his new friends won't know that now will they? We have been watching someone named Vahn enter the city under the guise of a trader. We know he works for Seru, but we were not sure what he was doing here, so we let him be- trouble was he kept giving us the slip passing through the tunnels. Looks now like we may have found a connection. The plan sounds complicated and I don't want to confuse you, but if you stick with me it will all go just fine. You with me so far, " .. e.other:GetCleanName() .. "?");
		e.other:QuestReward(e.self,0,0,0,0,29846); -- Recording Stone
	elseif(e.message:findi("i am with you")) then
		e.self:Say("OK, now you follow Claudius but not so closely that he can see you. Keep this stone on you, it is imbued with the power to record anything spoken within a certain distance and will be a great asset to us when this is all said and done. If Claudius does meet up with Vahn, I want you to walk right up to him and say, 'traitor to the Validus Custodus' and do it quickly- they won't give you much time. That should rattle him a bit and it will be the signal for my men to come in and take care of them. After the arrest, just give that recording stone to Condor. Best of luck to you, " .. e.other:GetCleanName() .. ".");
	elseif(e.message:findi("Where is claudius")) then
		e.self:Say("Claudius is a bit of a lazy sod anyway. If he ain't asleep in a bunk downstairs right now, you can bet your undergarments he will be soon.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29891}, 0)) then -- Report to Tilbok
		e.self:Emote("reads through the report, hands you a small satchel then starts to explain. 'Finally, news from Euzan. I knew that it would take a long time to get planted within Seru, but I still worried about their mission constantly. This report shows that you have earned trust from Euzan, so I in turn will show the same trust. Euzan and Torsten were placed in the city for information. They are deep undercover and risk their life everyday. Every person in that city is ingrained with the [purpose] of either destroying Katta or converting his people.'");
		e.other:Faction(e.self,1503,10);  -- Validus Custodus
		e.other:Faction(e.self,1502,1);  -- Katta Castellum Citizens
		e.other:Faction(e.self,1504,1);  -- Magus Conlegium
		e.other:Faction(e.self,1505,-1); -- Nathyn Illuminious
		e.other:Faction(e.self,1506,-1);  -- Coterie of the Eternal Night
		e.other:Faction(e.self,1483,-1); -- Seru
		e.other:Faction(e.self,1484,-5); -- Hand of Seru
		e.other:Faction(e.self,1485,-1);  -- Eye of Seru
		e.other:Faction(e.self,1541,-1); -- Hand Legionnaries
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,0,0,0,17121,1000); -- Report Satchel
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29858,item2 = 29889})) then -- Etched Earring of Veracity and Full Satchel
		e.self:Say("According to these reports Seru resides in a building called the Arx Seru. It is the large complex in the center of the four Praesertum Consillium. We must take [action] now. Do not underestimate the power of Sanctus Seru for what they do they feel is right.");
		e.other:Faction(e.self,1503,20);  -- Validus Custodus
		e.other:Faction(e.self,1502,2);  -- Katta Castellum Citizens
		e.other:Faction(e.self,1504,2);  -- Magus Conlegium
		e.other:Faction(e.self,1505,-2); -- Nathyn Illuminious
		e.other:Faction(e.self,1506,-2);  -- Coterie of the Eternal Night
		e.other:Faction(e.self,1483,-2); -- Seru
		e.other:Faction(e.self,1484,-10); -- Hand of Seru
		e.other:Faction(e.self,1485,-2);  -- Eye of Seru
		e.other:Faction(e.self,1541,-2); -- Hand Legionnaries
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,0,0,0,29859,10000); -- Runed Earring of Veracity
 	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29844}, 0)) then -- Dossier: Case 3463827
		e.self:Emote("reads through the dossier and then looks at you, eyebrow raised curiously, 'look at the mess you have gotten yourself in the middle of,' he says with a chuckle, while beginning to jot a note. 'Here take this and...' he stops midsentence. 'I guess I haven't even given you the chance to say whether or not you want to help. Would you like to see this through to the end?'");
		e.other:Faction(e.self,1503,2);  -- Validus Custodus
		e.other:Faction(e.self,1502,1);  -- Katta Castellum Citizens
		e.other:Faction(e.self,1504,1);  -- Magus Conlegium
		e.other:Faction(e.self,1505,-1); -- Nathyn Illuminious
		e.other:Faction(e.self,1506,-1);  -- Coterie of the Eternal Night
		e.other:Faction(e.self,1483,-1); -- Seru
		e.other:Faction(e.self,1484,-1); -- Hand of Seru
		e.other:Faction(e.self,1485,-1);  -- Eye of Seru
		e.other:Faction(e.self,1541,-1); -- Hand Legionnaries
		e.other:QuestReward(e.self,0,0,0,0,29845,5000); -- Field Orders
	elseif(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 5105}, 0)) then
		e.self:Say("I see you've spoken with Condor, and no doubt he told you I can recharge this for you. Well, it's true, but don't go around telling everyone. It's not something I like to make public, you know. Keep up the good work, though, we all appreciate it around here.");
		e.other:QuestReward(e.self,0,0,0,0,5105);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
