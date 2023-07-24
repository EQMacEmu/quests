function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. "! Have ye come to train?  I train all warriors. All Wolves o' the North must be strong warriors and swift as well. Are ye a young wolf, then? If so, maybe ye can [assist Renth] with his wee problem, eh?");
	elseif(e.message:findi("dangerous matter") and e.other:GetFaction(e.self) < 5) then
		e.self:Say("A murder was done in Halas recently. A couple were killed by a pair o' rogues fer a mere pouch o' copper. The shaman gave chase and the main rogue, Paglan, fell beneath an ice floe. One got away. We must [hunt the murderer]. Will ye help?");
	elseif(e.message:findi("hunt the murderer") and e.other:GetFaction(e.self) < 5) then
		e.self:Say("Twas good old Dok whose brother and wife were slain. Speak with him at his shop. Ask him if he has [any information about the crime]. Return the head of the murderer and I'll give ye a [Langseax].");
	elseif(e.message:findi("langseax") and e.other:GetFaction(e.self) < 5) then
		e.self:Say("The Langseax was crafted to be wielded by a warrior only.  Tis a one-handed slashing weapon with great balance to assist the warrior who masters it.");
	elseif(e.message:findi("assist") and e.other:GetFaction(e.self) < 5) then -- requires amiably
		e.self:Say("I was ordered by Kylan O'Danos to personally escort a young warrior sent to fetch the remains of his cousin, Ivan McMannus. I forgot and spent me greater time testing out the fine spirits. Now I must find the courier and the remains. Will ye [search fer the courier]?");
	elseif(e.message:findi("the courier") and e.other:GetFaction(e.self) < 5) then -- requires amiably
		e.self:Say("Thank ye, " .. e.other:GetCleanName() .. "! Go to Everfrost Peaks and seek out Arnis McLish. Ask him where Megan, the courier, is. Once ye find Megan, would ye ask her where Ivan's remains are? Please go, at once!");
	elseif((e.message:findi("dangerous matter") or e.message:findi("hunt the murderer") or e.message:findi("langseax")) and e.other:GetFaction(e.self) == 5) then
		e.self:Say("The Wolves o' the North show ye no ill will, but there's much ye must do t' earn our trust.  Perhaps ye should speak with Lysbith and inquire o' the [gnoll bounty].");
	elseif((e.message:findi("assist") or e.message:findi("the courier") or e.message:findi("dangerous matter") or e.message:findi("hunt the murderer") or e.message:findi("langseax")) and e.other:GetFaction(e.self) > 5) then
		e.self:Say("Run while ye still can!! The Wolves o' the North will not tolerate yer presence!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13246})) then
		e.self:Say("Good work!! Kylan will never know o' me negligence. I owe ye one, young warrior. Let's call it even with this. Twas found by one of our foraging parties. It is still useful. And... I believe ye can assist with a more [dangerous matter] as well");
		-- Confirmed Live Factions
		e.other:Faction(e.self, 320, 20); -- Faction: Wolves of the North
		e.other:Faction(e.self, 327, 4); -- Faction: Shamen of Justice
		e.other:Faction(e.self, 328, 5); -- Faction: Merchants of Halas
		e.other:Faction(e.self, 311, 1); -- Faction: Steel Warriors
		e.other:QuestReward(e.self,math.random(5),0,0,0,eq.ChooseRandom(17009,17001,8008),2000); -- Item(s): Purse (17009), Wrist Pouch, Throwing Axe
	elseif(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13249, item2 = 13248, item3 = 13247, item4 = 13233})) then
		e.self:Say("Thank ye, " .. e.other:GetCleanName() .. "! I knew ye could do it. It is a sad thing, but at least now he can rest in peace. Here is something for your efforts. If ye are interested, there is a [dangerous matter] that needs to be looked into.");
		e.other:QuestReward(e.self,0,0,8,0,0,3000);
	elseif(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12227})) then -- Barbarian Head (Basil's Head)
		e.self:Say("Fine work! We've avenged our fellow Northmen and ye've earned yer Langseax. Wield it in the name o' Halas!");
		--shows neg faction hit on live.   possibly to avoid exploits
		-- Confirmed Live Factions
		e.other:Faction(e.self, 320, -10);	-- Wolves of the North
		e.other:Faction(e.self, 327, -2); -- Faction: Shamen of Justice
		e.other:Faction(e.self, 328, -2); -- Faction: Merchants of Halas
		e.other:Faction(e.self, 311, -1); -- Faction: Steel Warriors
		e.other:QuestReward(e.self,0,0,math.random(9),0,5367,10000); -- Item: Langseax
	elseif(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12225})) then
		e.self:Say("Nice work " .. e.other:GetCleanName() .. "! Paglan has always been an outcast of sorts. I'm glad to see you were able to stop him. Here is a Langseax of the Wolves for your efforts.");
		e.other:Faction(e.self, 320, -20); -- Faction: Wolves of the North
		e.other:Faction(e.self, 327, -4); -- Faction: Shamen of Justice
		e.other:Faction(e.self, 328, -4); -- Faction: Merchants of Halas
		e.other:Faction(e.self, 311, -2); -- Faction: Steel Warriors
		e.other:QuestReward(e.self,0,0,0,0,5368,12000); -- Item: Langseax of the Wolves
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
