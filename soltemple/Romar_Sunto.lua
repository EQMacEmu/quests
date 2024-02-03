function event_say(e)
	if(e.other:GetFactionValue(e.self) >= 0) then
		if(e.message:findi("hail")) then
			e.self:Say("I am Romar Sunto, servant of Solusek Ro.  I am searching for the [coin] of the mighty enchanter [Tash] - if you are interested in helping me acquire it, I will [reward] you with a powerful spell.  I am also a dispenser of the Staff of Ro, sometimes also called [darkwood staves].");
		elseif(e.message:findi("darkwood stave")) then
			e.self:Say("Bring me a lambent stone from a hill giant, a sand giant or a griffon and I will give you a darkwood staff.");
		elseif(e.message:findi("tash")) then
			e.self:Say("Tash was a mighty enchanter and a master jewelcrafter.");
		elseif(e.message:findi("reward")) then
			e.self:Say("I will reward you with a scroll for the spell Tashania. For personal use, of course.");
		elseif(e.message:findi("coin pouch")) then
			e.self:Say("I will gladly lend you this coin pouch - put all 10 antique silver coins into it and combine them into the Coin of Tash.");
			e.other:SummonCursorItem(17511); -- A coin pouch - to combine the coins in
		elseif(e.message:findi("what.* coin")) then
			e.self:Say("Tash had a collection of ten antique silver coins that were left in different cities around the world.  If you were to collect all 10 coins, I would give you a [coin pouch] that would let you combine them into the master coin of Tash.  If you are interested, I will sell you a copy of the Tome of Tash, detailing where the coins were reportedly left, for a mere 50 gold.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10000})) then
		e.self:Say("A stone for a staff - very well.");
		e.other:Faction(e.self,415,1,0); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1,0); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,6048,1000); -- Darkwood Staff
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10793})) then -- Radiant Coin of Tash
		e.self:Say("The Coin of Tash - fully enchanted! I am in your debt. Here is the scroll of Tashania that was promised to you.");
		e.other:QuestReward(e.self,0,0,0,0,15678,20000); -- Spell: Tashania
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10790})) then -- Coin of Tash
		e.self:Say("The Coin of Tash. It is of no use to me like this. You must take the coin to Tarn Visilin in High Keep to get it enchanted.");
		e.other:QuestReward(e.self,{itemid = 10790}); -- Coin of Tash
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {gold = 50})) then -- 50 gold
		e.other:Say("Once you combine the coins within the pouch, you must take the Coin of Tash to Tarn Vislin in the HighKeep library to get it enchanted.  Give him the coin and he will enchant it for you.");
		-- confirmed live faction
		e.other:Faction(e.self,415,1,0); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1,0); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,18032,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
