function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("What I wouldn't do for a [Legion Lager] right now.");
	elseif(e.message:findi("lager")) then
		e.self:Say("It's my favorite drink, and the Legion took it away from me. They said it was becoming a problem amongst the guards. Maybe you can ask the bartender in East Cabilis about it. If you find me one, I'd be forever grateful!");
	end
end

function event_trade(e)
	local item_lib = require("items");	
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12463})) then --Handin: Legion Lager
		e.self:Emote("begins to weep. 'My favorite ale! Oh what a happy day! Please take this for your troubles.");
		e.other:Faction(e.self,441,5); -- +Legion of Cabilis
		e.other:Faction(e.self,440,2);  -- +Cabilis Residents
		e.other:Faction(e.self,445,2); -- +Scaled Mystics
		e.other:Faction(e.self,442,2);  -- +Crusaders of Greenmist
		e.other:Faction(e.self,444,2); -- +Swifttails
		e.other:QuestReward(e.self,math.random(0,9),math.random(0,9),0,0,eq.ChooseRandom(4270,4271,4272,4273,4274,4275,4276,4277,4279,4280,4281),500); -- Item(s): Curscale Skullcap (4270), Curscale Snout Mount (4271), Curscale Choker (4272), Curscale Tunic (4273), Curscale Shawl (4274), Curscale Cape (4275), Curscale Belt (4276), Curscale Sleeves (4277), Curscale Gloves (4279), Curscale Leggings (4280), Curscale Boots (4281)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end