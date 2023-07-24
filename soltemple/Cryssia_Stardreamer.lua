-- Quests for Bard Lambent armor

function event_say(e)
	if(e.other:GetFactionValue(e.self) >= 0) then	
		if(e.message:findi("hail")) then
			e.self:Say("Well met " .. e.other:GetCleanName() .. ". I am Cryssia Stardreamer of the Temple of Solusek Ro, protector of a powerful armor that will aid any bard in their journey across Norrath.  Are you a bard that desires this armor?");
		elseif(e.message:findi("no")) then
			e.self:Say("Very well then.");
		elseif(e.message:findi("yes")) then
			e.self:Say("Very well. I can craft a special type of bardic armor called lambent.  I can craft for you a set of [bracers], a [breastplate], a [helm], and [vambraces]. I require a special kind of lambent stone for each of my armor pieces.  Find my friends Orstorm, Genni, Gardern, and Vilissia within the temple and they will help you create them.");
		elseif(e.message:findi("bracers")) then
			e.self:Say("Alright, I will be needing some items. Return to me with them and I will craft your bracers. I will be needing a Dark Boned Bracelet, a Griffenne Charm, and a Lambent Fire Opal.");
		elseif(e.message:findi("breastplate")) then
			e.self:Say("This is the most difficult piece to make. In order for me to craft it I will be needing a Basalt Carapace, a Gypsy Lute, and a Lambent Ruby. Return to me with these and I will craft your breastplate.");
		elseif(e.message:findi("helm")) then
			e.self:Say("In order to craft the helm, I will be needing a Mudwater Rune, an Opoline Helm, and a Lambent Star Ruby. Give these items to me and I will craft your helm");
		elseif(e.message:findi("vambraces")) then
			e.self:Say("Very good, get me some Fiery Vambraces, the top portion of the Rune of the One Eye, and a Lambent Sapphire.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Wait, " .. e.other:GetCleanName() .. ", are you not forgetting something?";

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10564, item2 = 10563, item3 = 10128}, 1, text)) then
		e.self:Say("Good show, " .. e.other:GetCleanName() .. ", here is your lambent bracer");
		e.other:Faction(e.self,415,10); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,4156,1000); --bracers
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 4100, item2 = 10565, item3 = 10118}, 1, text)) then
		e.self:Say("Exceptionally well done, " .. e.other:GetCleanName() .. ", here is your lambent breastplate. Wear it with pride.");
		e.other:Faction(e.self,415,10); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,4154,1000); --breastplate
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10559, item2 = 4099, item3 = 10117}, 1, text)) then
		e.self:Say("Well done, " .. e.other:GetCleanName() .. ", here is your lambent helm. Wear it with the praises of the League of Antonican Bards.");
		e.other:Faction(e.self,415,10); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,4153,1000); --helm
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 4113, item2 = 10560, item3 = 10119}, 1, text)) then
		e.self:Say("Excellent, " .. e.other:GetCleanName() .. ", you have proved yourself most resourceful. Here are your lambent vambraces.");
		e.other:Faction(e.self,415,10); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,4155,1000); --vambraces
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
