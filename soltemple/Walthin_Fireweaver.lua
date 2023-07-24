-- Quests for Bard Lambent Armor

function event_say(e)
	if(e.other:GetFactionValue(e.self) >= 0) then
		if(e.message:findi("hail")) then
			e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". I am Walthin Fireweaver of the Temple of Solusek Ro. I am the protector of an ancient armor invented by long dead bards of the temple. This armor will help any bard in their journey across Norrath. Are you a bard that would desire to own some of this armor?");
		elseif(e.message:findi("no")) then
			e.self:Say("Very well.");
		elseif(e.message:findi("yes")) then
			e.self:Say("Very well. I craft a type of bardic armor that I invented called Lambent Armor. I can craft for you [boots], [gauntlets], and [greaves]. My friend Cryssia Stardreamer will craft for you the other pieces. I require a special kind of lambent stone for each of my armor pieces.  Find my friends Orstorm, Genni, Gardern, and Vilissia within the temple and they will help you create them.");
		elseif(e.message:findi("boots")) then
			e.self:Say("Alright, I will require some items. Go and get me some Firewalker Boots, a Lambent Sapphire, and the middle piece of the Rune of the One Eye. Return to me with these items and I will craft your boots.");
		elseif(e.message:findi("gauntlets")) then
			e.self:Say("Alright, I need you to retrieve for me some Black Silk Gloves, a Lambent Star Ruby, and Shin Gauntlets. Return to me with these and I will craft your gauntlets.");
		elseif(e.message:findi("greaves")) then
			e.self:Say("Very well, return to me with these items and I will craft them. A set of Icy Greaves, a Lambent Fire Opal, and Shin Greaves.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Wait, " .. e.other:GetCleanName() .. ", are you not forgetting something?";
	
	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 2318, item2 = 10119, item3 = 10561},1,text)) then
		e.self:Say("Quality boots for a quality bard. Well done, " .. e.other:GetCleanName() .. ".");
		e.other:Faction(e.self,415,10);        -- Temple of Solusek Ro better
		e.other:Faction(e.self,416,-1);       -- Shadow Men worse
		e.other:QuestReward(e.self,0,0,0,0,4159,1000); --boots
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 2319, item2 = 10117, item3 = 4114},1,text)) then
		e.self:Say("Well done, " .. e.other:GetCleanName() .. ", you have justly earned your pair of lambent gauntlets.");
		e.other:Faction(e.self,415,10);        -- Temple of Solusek Ro better
		e.other:Faction(e.self,416,-1);       -- Shadow Men worse
		e.other:QuestReward(e.self,0,0,0,0,4157,1000); --gauntlets
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 4115, item2 = 10128, item3 = 4116},1,text)) then
		e.self:Say("I always knew that you would earn these lambent greaves, " .. e.other:GetCleanName() .. ", you just had that look about you. Well done!");
		e.other:Faction(e.self,415,10);        -- Temple of Solusek Ro better
		e.other:Faction(e.self,416,-1);       -- Shadow Men worse
		e.other:QuestReward(e.self,0,0,0,0,4158,1000); --greaves
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
