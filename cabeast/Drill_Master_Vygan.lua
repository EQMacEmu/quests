function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am a Drill Master of the Legion of Cabilis.  I have no time for idle chitchat.  Be off if you were not summoned to this fortress!  Find that guild which was chosen for you as an egg.");
	elseif(e.message:findi("militia pike")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("The pike is the prime weapon of Cabilis warriors. It can be upgraded, too, such as from the partisan pike to the militia pike and beyond. All these pikes may be slung on one's back when your hands are needed for other pursuits. To upgrade a pike is something that is learned, but it can never be performed without a [geozite tool]. Do you [desire to upgrade the partisan pike]?");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("No Iksar resident will have anything to do with you!");
		else
			e.self:Say("Hiss!  Fool!  Fear the Legion of Cabilis for you are no ally to us.  Leave while you can.");
		end
	elseif(e.message:findi("upgrade the partisan pike")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("It seems as though a traitor is among our people. Someone has smuggled shackle keys to the slaves. The froglok slaves have been escaping into the swamplands and there we can hear the whistle of their contact who escorts them to freedom. We must put a stop to this! I desire three things. Your partisan pike, the head of the Iksar traitor and the whistle of the escort. Bring these to me and I shall give you the militia pike.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("No Iksar resident will have anything to do with you!");
		else
			e.self:Say("Hiss!  Fool!  Fear the Legion of Cabilis for you are no ally to us.  Leave while you can.");
		end
	elseif(e.message:findi("what geozite tool")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("The Geozite Tool is used to sharpen the pikes of the Legion of Cabilis. Only it can produce the serrated edges necessary for these deadly weapons. They are not handed out to just any broodling. The tool is only given to warriors who serve the legion. Do you [want a geozite tool]?");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("No Iksar resident will have anything to do with you!");
		else
			e.self:Say("Hiss!  Fool!  Fear the Legion of Cabilis for you are no ally to us.  Leave while you can.");
		end
	elseif(e.message:findi("want a geozite tool")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Then take this satchel and go to the outer walls of Cabilis and seek out large scorpions. When you can fill and combine the satchel with scorpion pincers, then you shall prove to me that you are truly a warrior and I shall send you off on your true test.");
			e.other:SummonCursorItem(17993); -- Item: Pincer Satchel
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("No Iksar resident will have anything to do with you!");
		else
			e.self:Say("Hiss!  Fool!  Fear the Legion of Cabilis for you are no ally to us.  Leave while you can.");
		end
	elseif(e.message:findi("true warrior of the legion")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("If you are you will have proof; else you will have the wrath of the Legion upon you for such a claim.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("No Iksar resident will have anything to do with you!");
		else
			e.self:Say("Hiss!  Fool!  Fear the Legion of Cabilis for you are no ally to us.  Leave while you can.");
		end
	elseif(e.message:findi("partisan of cabilis")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Bah! You are but a broodling!  Report to the other Drill Masters and pray that they can help you overcome your incompetence.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("No Iksar resident will have anything to do with you!");
		else
			e.self:Say("Hiss!  Fool!  Fear the Legion of Cabilis for you are no ally to us.  Leave while you can.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "You shall wield no militia pike until I have the head of the traitor, the fife of the escort and the partisan pike.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18203})) then --Guild Summons
		e.self:Say("I see they have begun to draft younger broodlings? Hmmph!! No matter. We Drill Masters shall make a warrior of you. Here is your partisan's pike and some coin as your wages. Be sure that you begin your training in blacksmithing and report to the other Drill Masters for any tasks they may have for you. Let them know you are [a partisan of Cabilis]. Perhaps soon you shall be rewarded the [militia pike].");
		e.other:Faction(e.self,441,100); 	--Legion of Cabilis
		e.other:Faction(e.self,440,25); 	--Cabilis Residents
		e.other:Faction(e.self,445,25); 	--Scaled Mystics
		e.other:Faction(e.self,442,25);		--Crusader of Greenmist
		e.other:Faction(e.self,444,25); 	--Swift Tails
			-- Confirmed Live Experience and Faction
		e.other:QuestReward(e.self,{copper = math.random(0,5),silver = math.random(0,2),itemid = 5130,exp = 500});	--Partisan's Pike
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12675, item2 = 12677, item3 = 5130},1,text1)) then
		e.self:Say("You have perfomed just as expected. I bestow upon you the rank of militiaman. Here is your new pike. Past this, you shall require the [geozite tool] to upgrade your future pikes and mancatchers. We see much promise in you, militiaman. Go forth to serve the realm.");
		e.other:Faction(e.self,441,10); 	--Legion of Cabilis
		e.other:Faction(e.self,440,2); 	--Cabilis Residents
		e.other:Faction(e.self,445,2); 	--Scaled Mystics
		e.other:Faction(e.self,442,2);		--Crusader of Greenmist
		e.other:Faction(e.self,444,2); 	--Swift Tails
		e.other:QuestReward(e.self,0,0,0,0,5131,200); -- Item: Militia's Pike
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12658})) then
		e.self:Say("You are a true warrior of Cabilis. You obviously are aware that in order to upgrade your pike you shall need a [geozite tool]. Take this note to the Lord of the outer gates. He desires a young warrior for a small task. Do this and he is instructed to reward you with the tool.");
		e.other:Faction(e.self,441,5); 	--Legion of Cabilis
		e.other:Faction(e.self,440,1); 	--Cabilis Residents
		e.other:Faction(e.self,445,1); 	--Scaled Mystics
		e.other:Faction(e.self,442,1);		--Crusader of Greenmist
		e.other:Faction(e.self,444,1); 	--Swift Tails
		e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(3),0,eq.ChooseRandom(18213,18211,18210),200); -- Item(s): Note to Iksar Lord (18213), Note to Iksar Lord (18211), Note to Iksar Lord (18210)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
