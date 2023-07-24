function event_say(e)
	miller = eq.get_entity_list():GetMobByNpcTypeID(160376);
	
	if(e.message:findi("hail")) then
		e.self:Say("Hello there weary adventurer. do you come seeking the truth?");
	elseif(e.message:findi("truth")) then
		e.self:Say("The truth is a precarious thing, twisted and torn by those that would deceive for their own nefarious purposes.  That is why there are people like me to guide the ignorant masses that know no better than to believe that which they are told.");
		if(miller.valid) then
			miller:Say("Yeah, you tell 'em Arbogast!  I bet this one doesn't even know what's going on right under his nose in this here city.  Like for example, you probably don't even know the truth about about his importantness Phenic Dionicas do you?");
		end
	elseif(e.message:findi("phenic")) then
		e.self:Say("He that battles what he truly is only truly battles himself.  Phenic Dionicas for years has made quite a show of his war on the Vampyres of Tenebrous.  This misdirection of truth serves only to keep people from discovering that he himself is a foul demon of the night.  Miller and I, for our singular vision of that which is true, are not well liked in this city and so cannot obtain proof for your disbelieving eyes.");
	elseif(e.message:findi("proof")) then
		e.self:Say("You wish to see the truth for yourself?  That is good, you will be taking your first step down a winding road to the only fulfillment this existence has to offer: enlightenment.  Take this flask of water, I have blessed it such that it will singe the skin of the unholy.  Go to Phenic Dionicas and give it to him, then you will see... you will see.");
		if(miller.valid) then
			miller:Say("Yeah, splash it right in his unliving face!");
		end
		e.other:SummonCursorItem(29899);
	elseif(e.message:findi("tsaph")) then
		e.self:Say("When you fake your death to discredit another you only discredit yourself when another sees your death was faked.  Yes, you heard me correctly, Tsaph Katta lives on here in this city, can you guess who it is he pretends to be?");
		if(miller.valid) then
			miller:Say("Ooh! I know, I know!  Nathyn Illuminious!!!");
			e.self:Say("Yes, yes, I know you know... very good Miller");
			miller:Emote("beams a smile your way.");
		end
	elseif(e.message:findi("exist")) then
		e.self:Say("You are beginning to see the truest truths as the only true truths now, are you not? That large blue orb that hangs in the Luclin sky from time to time is nothing more than an overgrown comet. What appear to be land masses and other geological features are in actuality powerful illusions cast upon the comet by Tsaph Katta himself so that panic does not spread amongst the ignorant masses. I am not one to spread conjecture, but it is possible that Katta's astronomers have discovered that the comet is hurtling slowly toward Luclin and will destroy all life on the planet, so you can see why he would want to keep the truth about the [Exodus] from his journal.");
	elseif(e.message:findi("exodus")) then
		e.self:Say("The Exodus is the single biggest lie propagated onto the people of Katta Castellum in the known history of the intelligent races. Hogwash I tell you.");
		if(miller.valid) then
			miller:Say("A bloody, boldfaced lie!");
			e.self:Say("A story told to children. Tsaph Katta wove together a tale of Seru trying to kill him on the fantasy world of 'Norrath' and how the entire combine fled here to escape from him... a wheel of lies, do you see how they interconnect? Why, I'll bet that even in Shadowhaven, the very site of this alleged 'Exodus' and home to one of the grandest libraries you will ever see, not a single shred of reliable evidence regarding such an event could be found. HA! You bring me a book on this 'Exodus' and Miller here will eat his hat! Especially if the book is wrapped in that gold paper I gave you...");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	miller = eq.get_entity_list():GetMobByNpcTypeID(160376);
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29898}, 0)) then
		e.self:Say("He simply gave this to you?  Cunning indeed for him to cover his weakness so thoroughly- he must have powerful protective enchantments in place, no doubt put in place by his good friend and associate, Tsaph Katta!");
		e.other:Faction(e.self,1577,10);
		e.other:QuestReward(e.self,0,0,0,0,17516,100000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29692}, 0)) then
		e.self:Say("Ahh, you have retrieved the memoirs, let me see.' Arbogast opens the book and starts flipping through pages, 'Yes here, you... no, wait it must be back... hrmmm, maybe he... but it must... Well, that was pretty clever of old Tsaph Katta, removing any record of who he truly is- probably did it to cover up the fact that Norrath does not really exist.");
		e.other:Faction(e.self,1577,10);
		e.other:QuestReward(e.self,0,0,0,0,17517,100000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29694}, 0)) then
		e.self:Say("Ahhh, excellent... I am glad to see your interest piqued. It is the truth that will liberate the masses when the masses fail to liberate the truth. To continue to divine and demystify the truth from the mistruth, I employ a powerful component known to the Akheva as 'Akuel xi ans Vius' which translated means 'Thing that tells Truth.");
		e.other:Faction(e.self,1577,10);
		e.other:QuestReward(e.self,0,0,0,0,17518,100000); -- black wrapping paper
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(160226)) then
			eq.get_entity_list():GetMobByNpcTypeID(160226):Say("It translates to 'Gift of the Dark' you fool!");
			e.self:Say("Oh, the foolish and naive, they are the salt of the land... anyhow, bring me two of these wrapped in the black paper you have and I shall reward you, my new ally of truth, with a cherished robe that was given us by Seru himself. Isn't that right Miller? Miller...")
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29695}, 0)) then -- black wrapped item
		e.self:Say("Oh, would you look at that?");
		e.other:Faction(e.self,1577,10);
		e.other:QuestReward(e.self,0,0,0,0,0,100000);
		if(miller.valid) then
			miller:Emote("looks a bit distressed and says to Arbogast, 'You said he would die getting these and we could keep...' Arbogast silences Miller with a kick under the table and smiles broadly at you, 'Well done and my very sincere thanks to you. The cloak is in the bank, Miller and I each hold a piece of it. We will go get it for you now.' Miller and Arbogast lean in close to each other and discuss this in whispers for a moment before getting up and heading out, Miller looking most dejected.")
			miller:CastToNPC():DoAnim(27);
			e.self:Say("Right then, let's get going Miller.");
			miller:CastToNPC():AssignWaypoints(24);
		end
		eq.start(23);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 9) then
		if(miller.valid) then
			miller:Emote("and Arbogast do their business with the bank, Miller retrieving a heavy brown cloak and Arbogast a beautiful golden clasp. They look up at each other, unable to bear the thought of actually parting with their treasures when Arbogast says, 'You know what? I think we'll keep them. Thanks for your help, don't be a stranger. Come now Miller, let's not be a bother.' With that, they both tear off out the door");
			miller:Say("Wait for me!");
			eq.spawn2(160111,26,0,miller:CastToNPC():GetX(),miller:CastToNPC():GetY(),miller:CastToNPC():GetZ(),miller:CastToNPC():GetHeading());
			eq.depop_with_timer(160376);
		end
		eq.spawn2(160004,25,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
end
