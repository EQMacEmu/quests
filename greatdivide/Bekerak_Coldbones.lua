function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Just another boring day waiting for supplies.  I wonder when they will arrive.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("supplies")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("We are supposed to receive a shipment of supplies each month from Kael Drakkel.  This months seems to be late.  I hope Wenglawks has not forgotten us.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 25106}, 0)) then -- Bekerak's New Spear
		e.self:Say("Well, well, I see Wenglawks finally got around to sending me my new spear. I hope it's not as shoddy as the last one. Your payment? Bahaha, did Wenglawks not tell you? Payment was to be a giant icewurm tooth carved into an amulet. Come now, little one. I will find an ice wurm for us to slay together. Then you can pull one of its teeth out for me and I will fashion the talisman for that greedy merchant.");
		eq.spawn2(118016,0,0,-2776,-3011,255.5,65.5):AddToHateList(e.other,1); -- Spawn: #an_angry_shardwurm (x:-2776 y:-3011 z:255.5 heading:65.5)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25191}, 0)) then -- Giant Shard Wurm Tooth
		e.self:Emote("pulls out a large knife and begins to carve at the tooth. After a few minutes he pulls out a length of rope and fashions it into a very large necklace. 'Here is his payment. Tell him the spear is fine, and that I might reconsider his last offer to me. He will know what I mean.'");
		e.other:QuestReward(e.self,0,0,0,0,25130); -- Summon: Giant Icewurm Talisman
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 25266}, 0)) then -- Giant Sack of Supplies
		e.self:Say("Supplies from Svekk?  Where are the rest of them little one!  There must be more, we are here pushing the Coldain back into their hole in the wall and Svekk sends a " .. e.other:Race() .. " to deliver a small portion of supplies.  Take this note back to that fool.  Leave quickly before I take my rage out upon you.");
		e.other:Faction(e.self,419,1); -- Kromrif
		e.other:Faction(e.self,448,1); -- Kromzek
		e.other:Faction(e.self,406,-1); -- Coldain
		e.other:Faction(e.self,430,-1); -- Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,25267,250);	-- 	Bekerak's Letter to Svekk
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 25269}, 0)) then -- Large Supply Sack for Bekerak
		e.self:Say("I am in your debt, " .. e.other:Race() .. ".  These supplies will help our effort to destroy the Coldain.  I wish I had more to give than what I do.'  Bekerak pulls a strange looking totem on a string from one of his pockets and hands it to you.  'May Lord Rallos smile upon you, " .. e.other:GetCleanName() .. ".'");
		e.other:Faction(e.self,419,1); -- Kromrif
		e.other:Faction(e.self,448,1); -- Kromzek
		e.other:Faction(e.self,406,-1); -- Coldain
		e.other:Faction(e.self,430,-1); -- Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,25268,250);	-- 	Kromrif Battle Totem
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
