function event_spawn(e)
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if ( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Say("Lucky me! Someone has littered Freeport with good merchandise.");
		end
	end	
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Step right up!  The name's Ping Fuzzlecutter, groomer to the royal crowns of Norrath and alchemist of fine hair care products.  It was I who took the grey out of Felwithe, who added curls to Kaladim and tamed the tangles of Moggok of Oggok.  Step right up and find yourself a new look!  Hey, is that a bald spot?!");
	elseif(e.message:findi("coffin")) then
		e.self:Say("You're looking for a craftsman, are you? Well look no further! For I, Ping Fizzlecutter, am the best in all the lands! Or at lest this side of Freeport. So you're the one that Valeron was talking about, eh? Well, while you were off traipsing around the lands he and I discussed the details of the coffin. I require nothing less than these [components]. Get me them and I will gladly make you a coffin any king would be proud to be buried in!");
	elseif(e.message:findi("components")) then
		e.self:Say("I require a diamond, a star ruby, a pearl, a [special fire emerald], a sapphire, a fire opal, and two enchanted platinum bars. Take this bag and combine the items once you have them all and bring it back to me.");
		-- Empty Gem Bag ID-17512
		e.other:SummonCursorItem(17512); -- Item: Empty Gem Bag
	elseif(e.message:findi("special fire emerald")) then
		e.self:Say("Now the fire emerald I want is not the normal one you receive from most jewelers. There is one jeweler I know who has the special one I want. Last time I heard, she had traveled to the elven outpost. Just ask her about special fire emeralds.");
	elseif(e.message:findi("repair the toupee")) then
		e.self:Say("Ah!! You have a toupee to repair. It must be the [Mane Attraction]. I gave a one out and it seems to always fall to pieces. Seeing as it has a 100 season warranty and I only created it 5 seasons ago, I suppose I can do it. Do you want me to [make the Mane Attraction].");
	elseif(e.message:findi("what is the mane attraction")) then
		e.self:Say("The Mane Attraction is a special toupee I created for a Gnome junker. He wasn't getting much attention at the taverns till I created the eye catching toupee. He became one Charismatic Gnome after that. Unfortunately, it seems to fall to pieces to easy and since it has a warranty, I have to fix it for him every time at no charge!! I will never make another. ");
	elseif(e.message:findi("make the mane attraction")) then
		e.self:Say("If you have the original tattered toupee then I can do it. Before you give it to me I will also need three other items. I require two clumps of hair from a Hulking Gorilla and a strand of hair from a [certain mermaid].");
	elseif(e.message:findi("certain mermaid")) then
		e.self:Say("I encountered a particular mermaid with beautiful hair!! She had beautiful golden tresses. I used a lock of her hair to create the Mane Attraction. That was a while back when I was in Faydwer.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You want a Mane Attraction? Not until I get the two clumps of gorilla hair, the tattered toupee and a lock of hair from a certain mermaid.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6710})) then -- Full Gem Bag
		e.self:Emote("smiles broadly as he rifles through the bag, then looks up at you and says, 'Bout time! Here is the coffin as promised.'");
		e.other:QuestReward(e.self,0,0,0,0,17080); -- Gem Encrusted Casket
	-- Clumps of Hair ID- 12335 - Lock of Hair ID- 12338 - Tattered Toupee ID- 12337
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12335,item2 = 12335,item3 = 12338,item4 = 12337},1,text)) then
		e.self:Say("You are a good helper. Here you go. One genuine, charismatic, lady magnet, zero to hero making Mane Attraction!! Guaranteed to lower prices world wide. Guaranteed to last forever.. Err.. Well,.. It has a 1000 year warranty at least.");
		e.other:Faction(e.self,229,5); -- Faction: Coalition of Tradefolk
		e.other:Faction(e.self,281,5); -- Faction: Knights of Truth
		e.other:Faction(e.self,291,3); -- Faction: Merchants of Qeynos
		e.other:Faction(e.self,336,5); -- Faction: Coalition of Tradefolk Underground
		e.other:QuestReward(e.self,0,0,0,0,12254,500); -- Item: Mane Attraction
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Ping_Fuzzlecutter

