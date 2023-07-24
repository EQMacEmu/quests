function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome. Welcome!!  Time to train.  Time to fight.  Time to serve the Iksar Empire.  You will need weapons.  I have the [footman pike] for all new recruits to earn.");
	elseif(e.message:findi("pike")) then
		e.self:Say("A footman pike is what you need.  A footman pike is what you get, but earn it you will.  You must [slay many beasts] to prove to us that you are a true warrior.  Fail and you will be exiled to live with the Forsaken.");
	elseif(e.message:findi("beasts")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Yes.  You will slay or you will be slain.  Take this footman's pack and fill it you will.  Fill it with [weapons of our foes].  When all are combined, the full footman's pack shall be returned to me along with your militia pike.  Do this and earn your footman pike and then we may have a true mission for you.");
			e.other:SummonCursorItem(17027); -- Item: Footmans Pack
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("No Iksar resident will have anything to do with you!");
		else
			e.self:Say("Hiss!  Fool!  Fear the Legion of Cabilis for you are no ally to us.  Leave while you can.");
		end
	elseif(e.message:findi("weapons")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Yes.  You need to know the weapons required.  Fill the pack with javelins.  Froglok bounder and goblin hunter javelins.  Two of each.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("No Iksar resident will have anything to do with you!");
		else
			e.self:Say("Hiss!  Fool!  Fear the Legion of Cabilis for you are no ally to us.  Leave while you can.");
		end
	elseif(e.message:findi("moglok")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("My dear friend, Warlord Hikyg of the Swamp Gate has encountered some difficulty with a Trooper Moglok. He requested that I find a brave soldier to take charge of the situation. Are you willing to [assist Warlord Hikyg]?");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("No Iksar resident will have anything to do with you!");
		else
			e.self:Say("Hiss!  Fool!  Fear the Legion of Cabilis for you are no ally to us.  Leave while you can.");
		end
	elseif(e.message:findi("Hikyg")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Good. Take this note to Footman Moglok of the swamp garrison. He shall instruct you on your mission.");
			e.other:SummonCursorItem(18234); -- Item: A Sealed Note
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("No Iksar resident will have anything to do with you!");
		else
			e.self:Say("Hiss!  Fool!  Fear the Legion of Cabilis for you are no ally to us.  Leave while you can.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "You were instructed to return with the full footmans pack and your militia pike.";	
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12430, item2 = 5131},1,text1)) then
		e.self:Say("Kyg knew you could do it. You will make a fine legionnaire some day but, for now, you shall be a footman. Take the footman pike head plans. Forge the footman's pike. Do so, and then you may have an audience with the War Baron on the subject of his [Memory of Sebilis].");
		e.other:Faction(e.self, 441,5); -- Faction: Legion of Cabilis
		e.other:Faction(e.self, 440,1); -- Faction: Cabilis Residents
		e.other:Faction(e.self, 445,1); -- Faction: Scaled Mystics
		e.other:Faction(e.self, 442,1); -- Faction: Crusaders of Greenmist
		e.other:Faction(e.self, 444,1); -- Faction: Swift Tails
		e.other:QuestReward(e.self,0,0,0,0,12475,500); -- Item: Footman Head Plans
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
