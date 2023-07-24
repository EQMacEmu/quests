function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail! You appear to be a [new priest]. Ah, I so enjoy the presence of youth within Deepwater Temple. I am sure Prexus is smiling upon us as we speak.");
	elseif(e.message:findi("new priest") or e.message:findi("protect the depth") or e.message:findi("convert fishermen in qeynos")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
			if(e.message:findi("new priest")) then
				e.self:Say("As I suspected. I shall assist you with your training and you shall assist the temple with your service. A young priest can help out by asking to [convert fishermen in Qeynos] or maybe even something truly great such as requesting to [protect the depths].");
			elseif(e.message:findi("protect the depth")) then
				e.self:Say("We have heard of zombies inhabiting the depths of Erud's Crossing. Go and seek them out. Destroy them. This evil should not exist within the realm of the Ocean Lord. Take this bag. Fill it with their rotting flesh. combine it and return it to me. May Prexus guide you.");
				e.other:SummonCursorItem(17939); -- Item: Empty Bag
			elseif(e.message:findi("convert fishermen in qeynos")) then
				e.self:Say("So you wish to journey to Qeynos? So be it. Go to Qeynos and find me a willing convert. Ask them if they wish the blessing of Prexus. If so, they should snap their pole in two and you will return it to me. Do this and be rewarded.");
			end
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("There is no reason to dislike you, but we of the Deepwater Knights must see more done for our cause before we truly accept you.");
		else
			e.self:Say("We, the Deepwater Knights, know of your vile ways. You had best leave while you can.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13922})) then -- requires amiably
		e.self:Say("Good work, young priest. Soon you shall carry the word of the Ocean Lord to distant lands. For now, continue your training. As for your reward, I have this which has been sitting in our vault. I hope it can be of use to a young priest such as yourself.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,242,5,0); -- Faction: Deepwater Knights
		e.other:Faction(e.self,266,1,0); -- Faction: High Council of Erudin
		e.other:Faction(e.self,265,-1,0); -- Faction: Heretics
		e.other:QuestReward(e.self,0,math.random(20),math.random(10),0,eq.ChooseRandom(2144,2146,2147,17005),2000); -- Item(s): Raw-hide Sleeves (2144), Raw-hide Gloves (2146), Raw-hide Leggings (2147), Backpack (17005)
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13880})) then -- requires amiably
		e.self:Say("Peeuww!! That most certainly is zombie flesh!! Here is your reward. You have done a fine service in the name of Prexus. Soon you shall advance and we may tell you of greater dangers lurking in the depths.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,242,10,0); -- Faction: Deepwater Knights
		e.other:Faction(e.self,266,1,0); -- Faction: High Council of Erudin
		e.other:Faction(e.self,265,-1,0); -- Faction: Heretics
		e.other:QuestReward(e.self,0,math.random(20),math.random(10),0,eq.ChooseRandom(2144,2146,2147,17005,15205,15203,15207,15201,15208,15209),5000); -- Item(s): Raw-hide Sleeves (2144), Raw-hide Gloves (2146), Raw-hide Leggings (2147), Backpack (17005), Spells: Cure Poison, Lull, True North, Spook the Dead, Flash of Light, Divine Aura
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:24050 -- Dleria_Mausrel
