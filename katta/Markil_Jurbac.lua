function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". I am Governor Markil Jurbac. It is my primary duty to uphold the law in Katta Castellum. How may I be of assistance to you?");
	elseif(e.message:findi("halle")) then
		e.self:Say("Legionnaire Halle?  She was doing some work for Phenic and now... Forgive the bureaucrat in me but do you have something official?");
	elseif(e.message:findi("phenic")) then
		e.self:Say("Magistrate Phenic Dionicas sets a fine example for any to follow- from one of our finest soldiers to one of our finest magistrates, Katta Cestellum is better of for his presence.  Have you some business with him?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18331}, 0)) then -- Sealed Message
		e.self:Emote("lowers his head and mourns the loss of Halle. 'Tis the greatest shame of all when good people are lost to the most cowardly of deeds. I will seek Governor Tilbok's council in this matter... I have never been able to wrap my head around this kind of treachery and he may very well have more information. Give this dossier to Tilbok, it has all of the information he will need.");
		e.other:Faction(e.self,1503, 2); -- Validus Custodus
		e.other:Faction(e.self,1502, 1); -- Katta Castellum Citizens
		e.other:Faction(e.self,1504, 1); -- Magus Conlegium
		e.other:Faction(e.self,1505, -1); -- Nathyn Illuminious
		e.other:Faction(e.self,1506, -1); -- Coterie of the Eternal Night
		e.other:Faction(e.self,1483, -1);  -- Seru
		e.other:Faction(e.self,1484, -1); -- Hand of Seru
		e.other:Faction(e.self,1485, -1); -- Eye of Seru
		e.other:Faction(e.self,1541, -1); -- Hand Legionnaries
		e.other:QuestReward(e.self,0,0,0,0,29844,1000); -- Dossier
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
