--Planar Armor Exchange
function event_say(e)
	if(e.message:findi("Hail")) then
		if(e.other:Race() == "Dark Elf" or e.other:Race() == "Iksar" or e.other:Race() == "Troll" or e.other:Race() == "Ogre" or e.other:Class() == "Shadowknight" or e.other:Class() == "Necromancer") then
			e.self:DoAnim(60)
			e.self:Emote("inhales sharply in a very stern study of the dark one before him. 'You travel lightly, I see. Perhaps you are merely lost and my reaction is one of preconceived notions. In any event, the district of Kartis is not too distant a travel from where you stand now and I'm certain that your own kind would be more than helpful in accommodating your immediate needs while within this fair city. If for one reason or another you are here by intent, then we reluctantly welcome you upon the condition that you uphold our ways of neutrality -- the ramblings of the zealous are not welcome sounds to our ears. If you seek guidance in the ways of fundamental skills necessary to the elementalists of Norrath, then I am at your service should you desire it.'");
		else
			e.self:DoAnim(48);
			e.self:Emote("gives a deep nod of his head in formal and polite recognition of " .. e.other:GetCleanName() .. " before him. 'Greetings, traveler, and welcome to the district of Tanaan. In light of your presence among us, we have gathered our knowledge and memories of lives past upon Norrath in hopes that our experiences would benefit you in the present. Do not hesitate to approach all citizens of this district, for we are equally fair and willing to grant you the aid that is within our individual power to provide. In my own personal experience upon Norrath, I was a wizard of some power -- though I do not boast. I have offered my knowledge of this art to any who would have the desire to learn from me. Unfortunately, time is not a luxury that you possess in the manner that we of the Plane are graced and thus, I may only offer instruction on skills. If you are in need of spells, then the library of Myrist should be your destination. The scholars there are infinitely wise despite their mortal lineage.'");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local count = item_lib.count_handed_item(e.self, e.trade, {1225, 1226, 1227, 1228, 1229, 1230, 1231}); --Carmine Armor
	if(count > 0) then
		repeat
			e.self:Say("Thank you, " .. e.other:GetCleanName() .. "."); --Text made up
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),300000); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
			count = count - 1;
		until count == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
