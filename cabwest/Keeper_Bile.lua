function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("bows before you as a gesture of kindness and respect. 'Greetings. I am Bile, Keeper of the Apprentice Ranks. My knowledge is that of the first circle of necromancy. I was once a great necromancer, but now i have a greater calling to protect the words of Kotiz. I also Conduct many tests to ensure the spells are deciphered correctly. I am in need of an apprentice to [collect components.]");
	elseif(e.message:findi("collect components")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Emote("takes out a tattered scroll and looks upon its words.'Hmm. Yes. I will need the following; One large scorpion pincer, one sabertooth cub canine and two brittle skulls. Bring these to me and I shall pay you and if I have an overscribed spell, I shall give you that also.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("No Iksar resident will have anything to do with you!");
		else
			e.self:Say("No Iksar resident will have anything to do with you!   Away from here before you find yourself dead.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12739, item2 = 12739, item3 = 12659, item4 = 12426})) then
		e.self:Emote("tosses the items into a nearby box and reaches into a sack at his feet. He hands you your reward. 'This spell is going to need some major testing. I can always use more of the same components.'");
		e.other:Faction(e.self,443,2); -- Faction: Brood of Kotiz
		e.other:Faction(e.self,441,1); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,math.random(10),0,0,eq.ChooseRandom(15338,15344,15339,15340,15225,15229,15346,15491,15502,15341,15342,15347,15348,15331,15221,15343),100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
