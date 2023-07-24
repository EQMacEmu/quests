function event_combat(e)
	if(e.joined) then
		if(math.random(2) == 1) then
			e.self:Say("" .. e.other:Race() .. "s like you are better left dead than alive.");
		else
			e.self:Say("You ssssshall know the horror of Cazic-Thule!");
		end
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greeetingsssssssssss. What brings sssssuch asssss you to the heart of the Feerrott? Do you [know fear]?");
	elseif(e.message:findi("know fear")) then
		e.self:Say("Yesssss. I can tassssste the fear in your pitiful heart. I am Roror, High Priessst of Cazic-Thule! I sssseek to sssssspread terror acrossssss all of Norrath! I ssssshall let you live thisss day so you can sssshare the fear that liessss within you.");
	elseif(e.message:findi("know no fear")) then
		e.self:Say("YOU SSSSSSHALL! For I, Roror, High Prissst of Cazic-Thule, I sssshall teach you!");
		eq.attack(e.other:GetName());
	elseif(e.message:findi("hay")) then
		e.self:Say("You sssseek the blesssssssing of the Lord of Fear?! Give me what you have and 66 gold pieces as an offering to Cazic-Thule.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Yesss. But remember, Cazic-Thule demandsssss both the item and 66 gold piecessss assssss an offering.";

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13990,gold = 66},1,text)) then
		e.self:Say("Whatsssss thisssss? You sssseek my blessssssssing? Heh heh heh... Very well... CAZIC-THULE! Take this fruit of Karana into horror'sss dark embrace. Fear and death made manifesssssst. A harvesssst of terror! Here, take your gift of blood and sssstraw. Use its dark powersssss in the name of the Fear Lord!");
		e.other:QuestReward(e.self,0,0,0,0,14320,300); -- Item: Sack of Cursed Hay
	end
	item_lib.return_items(e.self, e.other, e.trade);
end