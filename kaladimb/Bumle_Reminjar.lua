function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, " .. e.other:GetCleanName() .. ". The Cathedral of Underfoot welcomes all good persons. May you find peace from the dangers of Butcherblock within these walls. The paladins of this holy place are very much aware of the evils outside Kaladim. The threat of goblins and [birdmen] has increased.");
	elseif(e.message:findi("birdmen")) then
		e.self:Say("The birdmen I speak of are the aviak krags. These vile creatures have desecrated our land. They have dared to perch upon our great statue. The king has instructed all noble paladins in this order to [destroy the krag chicks].");
	elseif(e.message:findi("chicks")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Yes. You are known to have aided our cause. You shall continue by returning any aviak chick talons to me. I will reward you for the return of no fewer than four at a time. Go, and serve the will of the king!");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Clerics of Underfoot have yet to see your faith directed towards our wills. Perhaps you should assist Master Gunlok Jure in the crusade against the undead.");
		else
			e.self:Say("How dare you approach a member of the Clerics of Underfoot?!  Dogs such as you lie in the same bed as aviaks and ogres!")
		end
	elseif(e.message:findi("elders")) then
		if(e.other:GetFactionValue(e.self) >= 500) then -- need kindly for response
			e.self:Say("The krag elders are the strongest of the aviaks. Their might has been well-documented by our order. Our high ranking paladins are ordered to slay the eagles. If you are with us, return four aviak talons to me and a fine reward shall be yours. Perhaps even our cathedral tailors and scribes may donate to your quest.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Clerics of Underfoot have yet to see your faith directed towards our wills. Perhaps you should assist Master Gunlok Jure in the crusade against the undead.");
		else
			e.self:Say("How dare you approach a member of the Clerics of Underfoot?!  Dogs such as you lie in the same bed as aviaks and ogres!")
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I shall reward you for no less than four aviak chick talons.";
	local text1 = "There is only a reward for the return of four aviak talons.";
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12157, item2 = 12157, item3 = 12157, item4 = 12157},1,text)) then
		e.self:Say("You have done well. Your deeds shall be recorded within our journals. Here, then, is your reward. May you strive to serve us to the full extent of your powers. The [elders] must also die.");
		-- faction from ZAM post -- verified live xp
		e.other:Faction(e.self,227, 5);  --Clerics Of Underfoot
		e.other:Faction(e.self,274, 5); --Kazon Stormhammer
		e.other:Faction(e.self,293, 3); --Miner's Guild 249
		e.other:QuestReward(e.self,math.random(0,5),math.random(0,5),math.random(0,3),0,eq.ChooseRandom(2113,2114,2115,2116,2117,2118,2119,2120,2121,2122,2123,2124,5045,6041),5000); -- Item(s): Small Patchwork Tunic (2116), Small Patchwork Sleeves (2120), Small Patchwork Pants (2123), Small Patchwork Boots (2124), Small tattered and patchwork set, tarnished long sword, cast-iron warhammer
	elseif(e.other:GetFactionValue(e.self) >= 500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12158, item2 = 12158, item3 = 12158, item4 = 12158},1,text1)) then -- need kindly
		e.self:Say("Fine work! You shall be known for your great deeds. Take this and may it aid you in your defense of Kaladim. Hail King Kazon!");
		-- confirmed live faction
		e.other:Faction(e.self,227, 10);  --Clerics Of Underfoot
		e.other:Faction(e.self,274, 10); --Kazon Stormhammer
		e.other:Faction(e.self,293, 7); --Miner's Guild 249
		e.other:QuestReward(e.self,math.random(0,5),math.random(0,5),0,0,eq.ChooseRandom(2113,2114,2115,2116,2117,2118,2119,2120,2121,2122,2123,2124,5082,6041,6042,6046,7032),10000); -- small tattered and patchwork set, random cast-iron weapons.
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
