function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to my shop, sss. Only the finessst I have. I make for you jussst as I make for the emperor's harem. Many [bristle silk] garmentsss do they need. Ssss.. Lucky man, the emperor isss.");
	elseif(e.message:findi("bristle silk")) then
		e.self:Say("What is bristle silk?!! Huh? Where have you been living? Under the rocksss.. Nahh. I sssee. You are a broodling from the common ssstock. You could never afford bristle silk nor the affectionss of those who drape themselves with it. Still, commons have much ssservice to offer. Maybe you would like to earn some [curscale armor]. Hmm?");
	elseif(e.message:findi("curscale armor")) then
		e.self:Say("Curscale armor? I make thisss crude armor from the broodlings of the scaled wolves. I use the ssskins of the pupsss and cubs. Those ssskins are ssstill young and thin and are bessst for the young adventurers. I sssupply them to the Legion of Cabilisss, but for a [small service] I shall make them available to you.");
	elseif(e.message:findi("^small service")) then
		e.self:Say("I am in need of pup and cub scaled wolf skins to create more [curscale armor]. Many Legionnaires have died in battle. The Baron demands more sssuits. I mussst have more ssskins or it is MY HIDE!! I shall reward pieces of the curscale armor to any who [perform a small service].");
	elseif(e.message:findi("perform.* small service")) then		--Gives the empty curscale pack.
		e.self:Say("Good. You take thisss pack and fill it all with scaled curskins. Only the pupsss and cubs of the scaled wolves shall do. They are not much for one sssuch as you. Combine all those ssskins and return the full curskin pack and I shall reward you with any available piece of curskin armor and a sssmall amount of coin. Mossst important is that you shall be proving your allegiance to all of Cabilisss.");
		e.other:SummonCursorItem(17992); -- Item: Empty Curskin Bag
	end
end

function event_trade(e)
	local item_lib = require("items");
	--Accepts combined curscale pack.
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12655})) then
		e.self:Say("You are a good servant and a fine citizen. I have this piece of curscale armor available, but if it is not enough then perhaps I shall have another piece available if you were to [perform the small service] again.");
		e.other:Faction(e.self,440,5); -- Faction: Cabilis Residents
		e.other:Faction(e.self,441,1); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,math.random(0,9),math.random(0,5),math.random(0,3),0,eq.ChooseRandom(4270,4271,4272,4273,4274,4275,4276,4277,4279,4280,4281),10000); -- Item(s): Curscale Skullcap (4270), Curscale Snout Mount (4271), Curscale Choker (4272), Curscale Tunic (4273), Curscale Shawl (4274), Curscale Cape (4275), Curscale Belt (4276), Curscale Sleeves (4277), Curscale Gloves (4279), Curscale Leggings (4280), Curscale Boots (4281)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12685})) then 	--Full Pouch of Leech Husks
		e.self:Say("I see you have done some hunting, young broodling. I shall prepare these husks later, as for now you can have this training bag husk I have already prepared. You will require a sewing kit, but I am sure you already have one. You will next have to seek out granite pebbles.  Where you shall find them in Cabilis is unknown to me. When you obtain no less than three piles of granite pebbles then you can tailor a monk training bag for your caste. Good luck!");
		e.other:Faction(e.self,440,3); -- Faction: Cabilis Residents
		e.other:Faction(e.self,441,1); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,12687,500); 								--Training Bag Husk
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
