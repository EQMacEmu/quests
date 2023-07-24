function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Yes, I just got some new information from Prak this evening. He says they found out the spy is working for some bandit in the Karanas named Rujahn Tahslek. You used to work out there. do you recognize the name?");
		eq.signal(2085,2); -- NPC: Zannsin_Resdinet
	elseif(e.signal == 2) then
		e.self:Say("Hmmff.. Anyway, send someone to Prak. I want this job done quickly. Let's show these pathetic bandits that they've been nosing around in the wrong places.");
		eq.signal(2085,3); -- NPC: Zannsin_Resdinet
	elseif(e.signal == 3) then
		e.self:Say("Lomarc is already back. He sent word that the guards are on to him, so he's laying low for a bit. He also said the cost for delivery just went up, because he had to pay off the owner of the Mermaid's Lure.");
		eq.signal(2033,1); -- NPC: Renux_Herkanor
	elseif(e.signal == 4) then
		e.self:Say("Finally, the rat comes out of his hole! Send some men, no no, go yourself, and track him down. Then kill him. I don't care who sees you, or who gets in your way. Finish the job. And bring me whatever you find on his carcass. I'm sure he took some valuables from us when he escaped. And don't worry about Malka, she will keep until you finish Stanos, then she is yours. Shame to waste such talent, but you don't steal from the Circle and live.");
		eq.signal(2033,2); -- NPC: Renux_Herkanor
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("My name is Hanns..  Do as I say, and we shall get along just fine.");
	elseif(e.message:findi("knargon")) then
		e.self:Say("That little weasel is scurrying around here somewhere, I suppose.");
	elseif(e.message:findi("carson has a mole in the highpass")) then
		e.self:Say("Arrgg, that Carson can't control anything. Sometimes he's practically useless. Go tell Zannsin that [I want him to send some of his men to Prak in Highpass], to help Carson get back on track.");
	elseif(e.message:findi("stanos")) then
		e.self:Say("Stanos Herkanor? <he roars in frustration> That bastard should be long dead by now. if you see him, you hightail it back and let me know at once. Do I make myself clear, " .. e.other:GetCleanName() .. "? Do not speak to him, do not attack him, just return here and inform me. And that is ALL you need to know about Stanos.");
		e.self:DoAnim(60); -- glare animation
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18708})) then -- Napkin From Crow's
		e.self:Say("Lucky thing you weren't followed. or you'd be breathing through holes in your back right now. Go find Knargon, maybe you can help run the next [shipment]. Remember, we keep our business quiet, so watch yourself, sewer crawler.");
		e.other:Faction(e.self,223,100,0); -- Circle of Unseen Hands
		e.other:Faction(e.self,291,-15,0); -- Merchants of Qeynos
		e.other:Faction(e.self,230,15,0); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,262,-15,0); -- Guards of Qeynos
		e.other:Faction(e.self,273,10,0); -- Kane Bayle
		e.other:QuestReward(e.self,0,0,0,0,13501,20); -- Second Hand Tunic*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 28058})) then
		e.self:Say("YES! The bastard is dead, finally. I would have loved to do the work myself, but this will suffice. Here, take this, you have proven yourself a true friend of the Circle!");
		-- Confirmed Live Factions
		e.other:Faction(e.self,223,200,0); -- Circle of Unseen Hands
		e.other:Faction(e.self,291,-30,0); -- Merchants of Qeynos
		e.other:Faction(e.self,230,30,0); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,262,-30,0); -- Guards of Qeynos
		e.other:Faction(e.self,273,20,0); -- Kane Bayle
		e.other:QuestReward(e.self,0,0,0,0,7501,50000); -- Item: Fanged Skull Stiletto
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- Submitted by Jim Mills
