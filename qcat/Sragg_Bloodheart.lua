function event_signal(e)
	e.self:Say("I will hear no more excuses, Tovax!  Enjoy eternal pain and suffering!");
	eq.attack_npc_type(45040); --Tovax Vmar
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18706})) then --Stained Cloth Note
		e.self:Say("Ah, another would-be soldier for the army of the Plaguebringer. Unmuz has just lost a few of his men, he'll have plenty of work for you. I'm sure. Begone!");
		e.other:Faction(e.self,221,100); --Bloodsabers
		e.other:Faction(e.self,262,-15); --Guards of Qeynos
		e.other:Faction(e.self,296,10); --Opal Dark Briar
		e.other:Faction(e.self,341,-25); --Priest of Life
		e.other:Faction(e.self,230,5); --Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,13598,20); --Ruined Training Tunic*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18802})) then --A Sealed Letter (Letter to Opal)
		e.self:Say("What have you brought me, worm? Hmm... This is disappointing. That Tovax has failed us for the last time. Your loyalty to Bertoxxulous and the Bloodsabers has been noted. Now, if you will excuse me a moment...");
		e.other:Faction(e.self,221,50); -- Faction: Bloodsabers
		e.other:Faction(e.self,262,-7); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,296,5); -- Faction: Opal Dark Briar
		e.other:Faction(e.self,341,-12); -- Faction: Priests of Life
		e.other:Faction(e.self,230,2); -- Faction: Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,14007,100); -- Potion of Light Healing
		eq.unique_spawn(45040,0,0,-321,415,-38,64); -- NPC: Tovax Vmar
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
