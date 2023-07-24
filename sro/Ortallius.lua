-- DEVELOPER: KOVOU
-- DEVELOPER: UNKOWN Gem Turn in text was already present

-- *** NPC INFORMATION ***

-- NAME: Ortallius
-- ID: 35036
-- ZONE: sro
-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the lands of Ro. Stand and fight with me. We shall fight to reclaim the desert in the name of Solusek Ro. Death to all [dervish cutthroats]!!");
	elseif(e.message:findi("dervish cutthroats")) then
		e.self:Say("The dervish cutthroats are the vile scum who inhabit the desert. They are rogues who assault wayward travelers. Solusek Ro has commanded their extermination!! Do you wish to [join the crusade]?");
	elseif(e.message:findi("join the crusade")) then
		e.self:Emote("grins enthusiastically. 'The scum rarely wander far from their camps. Hunt them down and I will reward you for every three insignia rings you bring as proof of their deaths.");
	elseif(e.message:findi("solusek")) then
		e.self:Say("Solusek Ro is the Burning Prince.  He watches over this land which He created.  He will soon come to burn the evil from the desert.  He has chosen Ortallius to begin His crusade.  He has bestowed upon me the power of righteousness,  I am His paladin!  All shall fall before His greatness!");
	elseif(e.message:findi("rathmana")) then
		e.self:Say("Rathmana is a great wizard.  He is also my best friend.  [Solusek] sent him to save me from the savage desert when I was but a child in my dying mother's arms.  He saved me from being captured by the [dervish cutthroats].");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I was instructed to wait for two gems.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12348, item2 = 12349},1,text)) then -- 2 Gems
		e.self:Say("You serve the Burning Prince as I do. The Redeemed has instructed me to give you this reward upon completion of your test. Practice your arts and prepare yourself. Evil approaches our realm. Long live Ro!!");
		e.other:Faction(e.self,415,25,0);	-- faction better: 'Temple Of Sol Ro'
		e.other:Faction(e.self,416,-1,0);	-- faction worse: 'Shadowed Men'
		e.other:QuestReward(e.self,0,0,0,4,7041);	-- Burning Rapier
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1903,item2 = 1903, item3 = 1903})) then
		e.self:Say("You will make a fine addition to the crusade. Continue the cleansing of the desert. Let it be known that the Defenders of Ro are here to challenge the evils of the desert. I call upon the righteousness of all paladins to assist me.");
		e.other:Faction(e.self,415,5,0);		-- faction better: 'Temple Of Sol Ro'
		e.other:Faction(e.self,416,-1,0);		-- faction worse: 'Shadowed Men'
		e.other:QuestReward(e.self,8,4,0,0,eq.ChooseRandom(5013,5014,5015,5016,5019,5020,5020,5021,5022,5023,5024,5025,5013,5014,5015,5016,5019,5020,5020,5021,5022,5023,5024,5025,5013,5014,5015,5016,5019,5020,5020,5021,5022,5023,5024,5025,3040,3042,3043,3044,3046,3047,3048,3049,3050,3051,4778,5028,5032,7012,5031,5027,6017,6019,7015,7013,6023,5034,5035),7500); -- Item(s): Rusty Short Sword (5013), Rusty Axe (5014), Rusty Scythe (5015), Rusty Broad Sword (5016), Rusty Long Sword (5019), Rusty Battle Axe (5020), Rusty Battle Axe (5020), Rusty Scimitar (5021), Rusty Bastard Sword (5022), Rusty Two Handed Sword (5023), Rusty Halberd (5024), Rusty Two Handed Battle Axe (5025), Rusty Short Sword (5013), Rusty Axe (5014), Rusty Scythe (5015), Rusty Broad Sword (5016), Rusty Long Sword (5019), Rusty Battle Axe (5020), Rusty Battle Axe (5020), Rusty Scimitar (5021), Rusty Bastard Sword (5022), Rusty Two Handed Sword (5023), Rusty Halberd (5024), Rusty Two Handed Battle Axe (5025), Rusty Short Sword (5013), Rusty Axe (5014), Rusty Scythe (5015), Rusty Broad Sword (5016), Rusty Long Sword (5019), Rusty Battle Axe (5020), Rusty Battle Axe (5020), Rusty Scimitar (5021), Rusty Bastard Sword (5022), Rusty Two Handed Sword (5023), Rusty Halberd (5024), Rusty Two Handed Battle Axe (5025), Blackened Iron Coif (3040), Blackened Iron Collar (3042), Blackened Iron Mail (3043), Blackened Iron Spaulder (3044), Blackened Iron Waistband (3046), Blackened Iron Armplates (3047), Blackened Iron Bracers (3048), Blackened Iron Gloves (3049), Blackened Iron Legplates (3050), Blackened Iron Boots (3051), Bronze Weapons
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
