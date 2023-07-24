function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("white training sash")) then
		if(e.other:GetFactionValue(e.self) >= 150) then
			e.self:Say("The white training sash of the Ashen Order is awarded to our new members for completing a few simple tasks to prove their devotion to our clan. As you know, Freeport is a very hostile place, under constant attack from [orcs], wild beasts, and even the undead. To help keep this city and its citizens relatively safe, we must help the Militia protect the main gates. Bring me two Deathfist pawn scalps from those vile [Deathfist orcs], a snake fang, and some bone chips from a skeleton. Good luck, " .. e.other:GetCleanName() .. ", represent us well!");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("I have been watching you, and appreciate the help you've given to the brothers and sisters of the Ashen Order, but I feel that such a vital matter should be left to one of our more trusted members.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("yellow sash of order")) then
		if(e.other:GetFactionValue(e.self) >= 175) then
			e.self:Say("To earn the yellow sash, you must prove yourself to be very skilled in the art of fighting. The lands to the west and south of Freeport are filled with dangerous beasts that often prey upon innocent travelers. Help protect our merchant caravans and traveling citizens, while at the same time practicing your defensive skills, and eliminating these deadly creatures from the surrounding landscape. Bring me a giant snake rattle, a Deathfist slashed belt, the chitin of a desert tarantula, and turn in your white training sash, and I shall reward your noble work with our yellow Sash of Order. Good luck, " .. e.other:GetCleanName() .. "!");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("I have been watching you, and appreciate the help you've given to the brothers and sisters of the Ashen Order, but I feel that such a vital matter should be left to one of our more trusted members.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Greetings. " .. e.other:GetCleanName() .. "!  I am Velan Torresk of the Ashen Order.  I am in charge of training the newest members of our clan. and helping them advance their skills and rank.  When members perform certain tasks on behalf of the Order. they advance to a higher rank in our clan. and are awarded a special [sash].");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("sash")) then
		e.self:Say("The Sashes of Order are given out by the various trainers of our clan.  I give out the [white training sash] and the [yellow Sash of Order]. and [Reyia] is in charge of the [orange and red sashes].");
	elseif(e.message:findi("orcs")) then
		e.self:Say("The Deathfist Orcs are a large tribe of Orcs who live out in the desert. They are constantly sending small raiding parties and scouts to attack Freeport and its citizens.");
	elseif(e.message:findi("reyia") or e.message:findi("orange and red")) then
		e.self:Say("Reyia Beslin is one of our head trainers. She helps our members to improve their skills, and is also in charge of the orange and red Sashes of Order.");
	elseif(e.message:findi("purple") or e.message:findi("blue") or e.message:findi("klom")) then
		e.self:Say("Brother Klom is the Ashen Order's second master.  He is in charge whenever Master Puab is absent or falls ill.");
	elseif(e.message:findi("puab") or e.message:findi("closk")) then
		e.self:Say("Master Puab is the head master of the Ashen Order.  His grandfather, Khenur Closk, was the founder of the Ashen Order many years ago.  Khenur led the Order around the Desert of Ro nomadically for almost a decade, helping the lost and protecting trade caravans from bandits.  He then decided to settle here in Freeport, and the rest is history.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "Ah, very good. You are well on your way to earning the white sash."
	local text2 = "Ah, very good. You are well on your way to earning the yellow Sash of Order."

	-- Medium Amiable Faction - Deathfist Pawn Scalp - Snake Fang - Bone Chips
	if(e.other:GetFactionValue(e.self) >= 150) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13794,item2 = 13794,item3 = 13067,item4 = 13073},1,text1)) then
			e.self:Say("Good work, " .. e.other:GetCleanName() .. ", you've worked hard and proven yourself a valuable addition to the Ashen Order. Here's your white sash, wear it with pride.");
			e.other:Faction(e.self,361,25,0); -- Ashen Order
			e.other:Faction(e.self,281,3,0); -- Knights of Truth
			e.other:Faction(e.self,309,1,0); -- Silent Fist Clan
			e.other:QuestReward(e.self,0,0,0,0,10130,500); -- White Training Sash
		end
	end
	-- White Training Sash - Giant Snake Rattle - Deathfist Slashed Belt - Desert Tarantula Chitin
	-- No need to check faction again since they must have the White Training Sash
	if(e.other:GetFactionValue(e.self) >= 175 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10130,item2 = 13058,item3 = 13916,item4 = 20901},1,text2)) then
		e.self:Say("Ah, well done, " .. e.other:GetCleanName() .. ". You have proven that you are a very skillful fighter and it is an honor to have you as a member of the Ashen Order. On behalf of Master Closk, and under the watchful eyes of Quellious, I present you, " .. e.other:GetCleanName() .. ", with this, the yellow Sash of Order. Go out and make us proud.");
		e.other:Faction(e.self,361,50,0); -- Ashen Order
		e.other:Faction(e.self,281,7,0); -- Knights of Truth
		e.other:Faction(e.self,309,2,0); -- Silent Fist Clan
		e.other:QuestReward(e.self,0,0,0,0,10131,750); -- Yellow Sash of Order
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freportw  ID:9065 -- Velan_Torresk

