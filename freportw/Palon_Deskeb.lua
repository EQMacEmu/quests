function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Pleased to meet you. %s. Have you seen how clear the water is underneath the Academy? All sorts of life could flourish there. What a shame there are no [Marr Minnows] there.",e.other:GetName()));
	elseif(e.message:findi("marr minnow")) then
		e.self:Say("The Marr Minnow swims in the pond near the Temple of Marr. I wish I had one. Not a dead one. A live one. I need someone to [get the minnow].");
	elseif(e.message:findi("get the minnow")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Please try. Here you are. Take this jar. Offer the jar to the minnows. Maybe they will swim into it.");
			e.other:SummonCursorItem(13861); -- Item: A Jar of Liquid
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The word of mouth in the Academy of Arcane Science is that you are no foe, but you have yet to prove your worth to us. Perform more tasks for the great Tara Neklene.");
		else
			e.self:Say("You had best leave my sight. I am a faithful member of the Academy of Arcane Science and you are no ally of ours.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13862})) then
		e.self:Say("Oh! A beautiful Marr Minnow. This shall look grand in my aquarium! How lucky that you are a friend to the Academy of Arcane Science. Take your reward.");
		e.other:Faction(e.self,220,5,0); -- Arcane Scientists
		e.other:Faction(e.self,281,1,0); -- Knights of Truth
		e.other:Faction(e.self,296,-1,0); -- Opal Dark Briar
		e.other:Faction(e.self,330,-1,0); -- Freeport Militia
		e.other:QuestReward(e.self,math.random(10),math.random(5),math.random(0,2),0,eq.ChooseRandom(13002,13007),100); -- Item(s): Torch (13002), Ration (13007)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Palon_Deskeb
