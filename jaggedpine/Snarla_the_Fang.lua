function event_say(e)
	if(e.message:findi("hail") or e.message:findi("respect temple") or e.message:findi("food") or e.message:findi("dryad pate") or e.message:findi("necklace")) then
		if(e.other:GetFaction(e.self) < 7) then
			if(e.message:findi("hail")) then
				e.self:Say("Shhh. quiet! This is place of solitude and peace! You [respect temple] while you here if you know what good for you!");
			elseif(e.message:findi("respect temple")) then
				e.self:Say("One way guests show respect is to bring the host [food]. Something really good would be nice.");
			elseif(e.message:findi("food")) then
				e.self:Say("Lessee. . . Dryad Pate is what I want. Bring me some [Dryad Pate] and then you be a good guest. Maybe then I return a favor for you.");
			elseif(e.message:findi("dryad pate")) then
				e.self:Say("I don't know how it made. Talk to the Brargus about it. He the cook.");
			elseif(e.message:findi("necklace")) then
				e.self:Say("I make many different kinds of necklaces for my friends from fangs of powerful creatures like bear, panther and wolf. You give me your token of friendship and I give you a pouch to keep some stuff in. After you get the stuff and seal the bag, bring it back and I make you a nice necklace to wear. Stuff I need is one Anaconda Skin and three Fangs. Fangs that make good necklaces are Wolf, Bear and Panther. Make sure all fangs are same. Necklaces with different fangs are neat but not as nice as ones with all same fangs, so I only make those ones.");
			end
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) < 7 and item_lib.check_turn_in(e.self, e.trade, {item1 = 8199}, 0)) then -- Hand-In: Dryad Pate
		e.self:Say("Ohh. . . This really good, thanks! You take this token of friendship. You all smell the same so this way I know who you are. I can make nice [necklaces] for my friends.");
		e.other:Faction(e.self,1598,20); -- Anchorites of Brell Serilis
		e.other:QuestReward(e.self,0,0,0,0,8270); -- Token of Friendship
	elseif(e.other:GetFaction(e.self) < 7 and item_lib.check_turn_in(e.self, e.trade, {item1 = 8270}, 0)) then -- Hand-In: Token of Friendship
		e.self:Say("Ok, here pouch to collect stuff. Come back when pouch full. Make sure you seal pouch or stuff may fall out.");
		e.other:QuestReward(e.self,0,0,0,0,17263); -- Necklace Component Pouch
		e.other:QuestReward(e.self,0,0,0,0,8270); -- Token of Friendship
	elseif(e.other:GetFaction(e.self) < 7 and item_lib.check_turn_in(e.self, e.trade, {item1 = 9228}, 0)) then -- Hand-In: Sealed Wolf Fang Pouch
		e.self:Say("Oh hello friend, I make this nice necklace for you! You wear this and feel the spirit of the wolf run through you!");
		e.other:Faction(e.self,1598,10); -- Anchorites of Brell Serilis
		e.other:QuestReward(e.self,0,0,0,0,8258); -- Wolf Fang Necklace
	elseif(e.other:GetFaction(e.self) < 7 and item_lib.check_turn_in(e.self, e.trade, {item1 = 9229}, 0)) then -- Hand-In: Sealed Bear Fang Pouch
		e.self:Say("My friend returns again! I make this nice necklace for you. Wear this and feel the essence of the bear flow through you.");
		e.other:Faction(e.self,1598,10); -- Anchorites of Brell Serilis
		e.other:QuestReward(e.self,0,0,0,0,8261); -- Bear Fang Necklace
	elseif(e.other:GetFaction(e.self) < 7 and item_lib.check_turn_in(e.self, e.trade, {item1 = 9230}, 0)) then -- Hand-In: Sealed Panther Fang Pouch
		e.self:Say("Hello again friend. This nice panther fang, here you take this necklace I make you. It imbued with spirit of the cat.");
		e.other:Faction(e.self,1598,10); -- Anchorites of Brell Serilis
		e.other:QuestReward(e.self,0,0,0,0,8257); -- Panther Fang Necklace
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
