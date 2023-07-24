function event_say(e)
	if(e.other:GetFaction(e.self) < 6) then
		if(e.message:findi("hail")) then
			e.self:Say("Greetings, " .. e.other:GetCleanName() .. ".  I am Svekk, a humble servant of Wenglawks.  It is my job to keep track of the supplies here.  I also sell mundane wares.");
		elseif(e.message:findi("supplies")) then
			e.self:Say("We have all kinds of supplies!  Normally we deliver them to the giants who live outside Kael.");
		elseif(e.message:findi("giant")) then
			e.self:Say("There are several encampments in the eastern wastes that barter for supplies with us monthly.  The great divide also has a small outpost of Kromrif who strive to beat the Coldain back into their city of Thurgadin and of course the outposts in the wakening lands.  Our last batch of deliveries did not reach their intended targets.  The runners have not been heard from since they were dispatched either.");
		elseif(e.message:findi("eastern waste")) then
			e.self:Say("The Kromrif of the Eastern wastes are more savage than those who dwell within Kael Drakkel.  Normally they can fend for themselves but recently Fjloaren of the Icebane clan has requested we help them with a shipment of supplies.  We have yet to receive payment for the supplies but you are more than welcome to purchase supplies for them and deliver them.  It has been a most unforgiving season upon the wastes I believe.");
		elseif(e.message:findi("wakening land")) then
			e.self:Say("Korzak Stonehammer is the name of the man whom we usually deliver to in the Wakening Land.  His men are attempting to expand Kael further into that accursed forest.  If you buy a pack of supplies and deliver it to him I am sure he would repay you handsomely.  A single pack will only cost you a mere five hundred pieces of gold.");
		elseif(e.message:findi("great divide")) then
			e.self:Say("If you wish to deliver supplies to the warriors in the great divide that is wonderful. One small problem arises.   I do not know you, " .. e.other:Race() .. ".  I would not trust you as far as I could throw a dragon.  If you pay for the supplies and deliver them the men at the fortress will surely repay you.  A pack of basic supplies only costs a meager five hundred gold pieces.  If you choose to purchase the supplies and deliver them take them to a man named Bekerak Coldbones at the outpost.");
		elseif(e.message:findi("klezendian")) then
			e.self:Say("Klezendian crystals can be found in the Crystal Caverns beneath the eastern wastes.  The Rygorr orcs mine Velium and various metals from its rich walls.  Be warned though, the crystal caverns are not a safe place, nameless beasts and even some Coldain call It their home.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself."));
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) < 6) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 25278}, 0)) then -- Velium Torque
			e.self:Say("Ahh, a Velium torque!  Here, I'll give you one hundred pieces of gold for that!'  Svekk places the torque in his pocket and drops some coins at his feet.");
			e.other:Faction(e.self,448,10); -- Faction: Kromzek
			e.other:Faction(e.self,419,2); -- Faction: Kromrif
			e.other:Faction(e.self,429,2); -- Faction: King Tormax
			e.other:Faction(e.self,430,-5); -- Faction: Claws of Veeshan
			e.other:QuestReward(e.self,0,0,0,15,0,250);
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25267}, 0)) then -- Bekerak's Letter to Svekk
			e.self:Say("This is unbelievable!  The fool is asking for things I don't even have in stock!  Listen, " .. e.other:GetCleanName() .. ", you're the one that wanted to help them out, I'm just here working for Wenglawks.  I can get most of these supplies ready but I have no source for Klezendian Crystals.  I will start bundling the more mundane items Bekerak wants.  If you find any Klezendian return to me with the crystal and this voucher.");
			e.other:Faction(e.self,448,10); -- Faction: Kromzek
			e.other:Faction(e.self,419,2); -- Faction: Kromrif
			e.other:Faction(e.self,429,2); -- Faction: King Tormax
			e.other:Faction(e.self,430,-5); -- Faction: Claws of Veeshan
			e.other:QuestReward(e.self,0,0,0,0,25270,250); -- Supply Voucher
		elseif(item_lib.check_turn_in(e.self, e.trade, {copper = 50000}, 0)) then
			e.self:Emote("heaves a large pack from a pile in the corner and sets it before you.  'I wish you luck in your endeavor, " .. e.other:Race() .. "'");
			e.other:QuestReward(e.self,0,0,0,0,25266); -- Giant Sack of Supplies
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25270,item2 = 25271})) then -- Supply Voucher / Klezendian Crystal
			e.self:Say("Did you travel to the crystal caverns to get that crystal, " .. e.other:GetCleanName() .. "?  You are quite brave for a " .. e.other:Race() .. ".  I have the other supplies ready for your trip, they are quite heavy but I think you will get by.");
			e.other:Faction(e.self,448,10); -- Faction: Kromzek
			e.other:Faction(e.self,419,2); -- Faction: Kromrif
			e.other:Faction(e.self,429,2); -- Faction: King Tormax
			e.other:Faction(e.self,430,-5); -- Faction: Claws of Veeshan
			e.other:QuestReward(e.self,0,0,0,0,25269,250); -- Large Supply Sack for Bekerak
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
			
