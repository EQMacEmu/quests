-- Fusibility Research

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. I am Makil Rargon, an esteemed assistant to the great wizard [Al'Kabor]. What can I help you with?");
	elseif(e.message:findi("al'kabor")) then
		e.self:Say("Al'Kabor is the most powerful wizard on all of Norrath. He is currently back to his Combine Empire research. Being his most trusted assistant, he assigned me to follow up on his fusibility [research] findings. Do you have any information to offer?");
	elseif(e.message:findi("research")) then
		e.self:Say("Ah. Yes, his fusibility research. Al'Kabor has been studying the melting point of minerals. Here, take this journal. It explains what fusibility is. Over the last few years, he has conducted several tests on [fusible ores].");
		e.other:SummonCursorItem(18290); -- Item: Fusibility Study: Part 1
	elseif(e.message:findi("fusible ore")) then
		e.self:Say("An ore is considered fusible if it can be melted. Now, this book explains the most unique forms of fusible ore that the master has conducted [experiments] on.");
		e.other:SummonCursorItem(18293); -- Item: Fusibility Study: Part 2
	elseif(e.message:findi("experiment")) then
		e.self:Say("So far his research has been quite successful. This journal explains what he has been able to accomplish. He has managed to create several magical items including an artifactual scepter of great power. While only he can grant permission to a worthy wizard to possess the artifact, if you are willing to help me complete a [fusibility test], I can offer you another item of great strength against the elements.");
		e.other:SummonCursorItem(18294); -- Item: Fusibility Study: Part 3
	elseif(e.message:findi("fusibility test")) then
		e.self:Say("Very well then . . . Fill this Empty Fusible Ore Crate up with four different fusible ores then seal it. Bring me back the Full Crate of Fusible Ore and I will use the compound to create a magical item that was developed by Master Al'Kabor.");
		e.other:SummonCursorItem(17408); -- Item: Empty Fusible Ore Crate
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 24069}, 0)) then
		e.self:Emote("begins to examine the contents of the crate and proceeds to conduct an experiment. He then turns toward you and says, 'Excellent job! As promised, here is one of Master Al'Kabor's fusiblity research creations.'");
		e.other:Faction(e.self,415,5); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-5); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,math.random(50),math.random(50),math.random(50),math.random(30),24070,5000000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
