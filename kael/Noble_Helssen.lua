function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You obviously have no idea where you have trespassed so I will generously allow you to live. I suggest you leave immediately before my generosity runs out however......Unless, you're looking for work.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("looking for work")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Well, you might do. Out in the deepest scar, known as the Wakening Land we have deployed several mercenaries to harass the local annoying population. They are in need of constant supplies so we hire those we can trust to deliver those supplies to the mercenaries wandering out in the field. Are you interested, " .. e.other:Race() .. "?");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("interested")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Very well. Take this pack of supplies to any of the Mercenaries you come across in the field. They will pay you upon delivery. Return here for more supplies to deliver when you are ready.");
			e.other:SummonCursorItem(1724); -- Item: Field Supplies
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("plane of growth")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Our soldiers fell victim to the denizens of that plane and unless we can find some way to stop this from happening, the land of Wakening will never be under our control. Many have suggested just destroying the Nexus but they are short-sighted fools. My vision is not only to control the resources that forest provides, but also to control the very force of Growth itself! You will help me to do this, mercenary.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("help you")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The tablet I have given you is inscribed with runes of binding. I am owed a favor and it has come time to use it. There is a venerable sea turtle that lives along the warmer part of the coast, where the ice floes begin to break up. His name is Corudoth. Find him and speak with him. Remind him of his obligation to me and if he is not forthcoming in his answers, tell him he owes me. Then show him the tablet. He will tell you what to do. He will most likely be beneath the ocean.  The mask I gave you should help.");
			e.other:SummonCursorItem(1713); -- Enchanted Velium Mask
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I have much to do, " .. e.other:GetCleanName() .. ". Do not waste my time unless you have the Arcanum AND the key to open it.";
	
	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1709}, 0)) then -- Report of Failure
		e.self:Emote("takes the report from you and places it in a pocket without even glancing at it. He says, 'Do not worry, " .. e.other:GetCleanName() .. ". I know of the planar creatures who eliminated my troops. The fault is not yours but of that fool Drioc's. The Savage land is not just a simple forest as those idiots in the field believe. It is a cradle of life and the forces that drive it. Within that forest is a nexus, a gateway to another plane of existence, the Plane of Growth.'");
		-- live faction verified 
		e.other:Faction(e.self,448,15); -- Faction: Kromzek
		e.other:Faction(e.self,419,3); -- Faction: Kromrif
		e.other:Faction(e.self,429,3); -- Faction: King Tormax
		e.other:Faction(e.self,430,-7); -- Faction: Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,1710,1000); -- inscribed velium tablet
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1722}, 0)) then -- Helssen's Voucher
		e.self:Say("Excellent choice, " .. e.other:Race() .. ". Competence and a sense of style. When we are ready to take the Wakening I will most definitely welcome your participation. Here is your reward.");
		e.other:QuestReward(e.self,{items = {1723,1720},exp = 2000}); -- Noble's Seal, Helssen's Prismatic Trinket
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1712,item2 = 1714},1,text)) then -- Arcanum of Roth, Ancient Rusted Key
		e.self:Say("Ahhh, you suprise me mercenary. You have found the book as well as the key to open it. I must begin my research as soon as possible. But first, your reward. With this voucher you can receive 1 of the 3 treasures I will offer you. If given to Kellek you will receive an item worthy of a hearty and rugged combatant. If given to Wenglawks you will aquire an item to be worn by only the most pious. And if given to me I will give you a sorcerous trinket of my own design.");
		e.other:Faction(e.self,448,11); -- Faction: Kromzek
		e.other:Faction(e.self,419,5); -- Faction: Kromrif
		e.other:Faction(e.self,429,5); -- Faction: King Tormax
		e.other:Faction(e.self,430,-5); -- Faction: Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,1722,2000); -- Helssen's Voucher
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
