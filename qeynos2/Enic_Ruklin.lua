function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail! These are the sacred grounds of the Temple of Life. Please do not cause any disturbances while on our grounds. I would hate to have to hurt you. In the name of Rodcet Nife, of course. Now excuse me, I have a [problem] to attend to.");
	elseif(e.message:findi("problem")) then
		e.self:Say("I have been charged with the duty of protecting the [Pool of Jahnda] and its fish. Now it seems as though a beast by the name of [Frostbite] has slurped up another one of the sacred fish, the [Koalindl]. If I do not get the little corpse of this fish back, I could be in trouble. Any respected member of this temple who aids me will be rewarded greatly.");
	elseif(e.message:findi("pool of jahnda")) then
		e.self:Say("The Pool of Jahnda is not meant for public use. It is a sacred pool created for the [Koalindl]. They say that, every so often, the Prime Healer visits our plane in the guise of a Koalindl. He swims in our pool.");
	elseif(e.message:findi("koalindl")) then
		e.self:Say("The fish called Koalindl were a gift to Priestess Jahnda from the Prime Healer. They come from the plane of health. To kill one Koalindl is to bring the wrath of Rodcet Nife and the Priests of Life down upon you.");
	elseif(e.message:findi("frostbite")) then
		e.self:Say("Frostbite is a dog. He belongs to some barbarian who visits the city every so often. I know not where they are from. I cannot see them coming from Halas. Their visits are too frequent.");
	elseif(e.message:findi("donation.* temple.* thunder") or e.message:findi("donate.* temple.* thunder")) then		
		e.self:Say("I would be glad to help you out. The Knights of Thunder are a respected order.");
		e.other:SummonCursorItem(13292); -- Item: A Donation
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13383})) then  -- requires amiably
		e.self:Say("Thank you my friend! Every Koalindl must be accounted for, even the dead. Rodcet Nife shall be pleased and I shall reward you. Nothing much. Just a token of gratitude.");
		-- Confirmed Live Factions and exp data
		e.other:Faction(e.self,341,100); -- Priest of Life
		e.other:Faction(e.self,280,30); -- Knight of Thunder
		e.other:Faction(e.self,262,50); -- Guards of Qeynos
		e.other:Faction(e.self,221,-25); -- Bloodsabers
		e.other:Faction(e.self,219,15); -- Antonius Bayle
		e.other:QuestReward(e.self,0,0,math.random(20),0,eq.ChooseRandom(13297,13296),5850);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
