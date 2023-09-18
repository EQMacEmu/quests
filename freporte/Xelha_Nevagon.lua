function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("A new recruit to our cause.  Just what I have been waiting for! How would you like to serve the great Xelha Nevagon? I need an apprentice necromancer to [assist the great Xelha].");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("assist the great xelha")) then	
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Fantastic. Stick with me and you shall ascend in our ranks quickly. I am in need of some components for new spells.  Will you collect them for me?  I shall need four each of the following - fire beetle eyes. bone chips and spiderling silk.  Fetch these items for me at once. Well..? Did not you hear the great Xelha? Begone!");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "Do not flame beetles have two eyes?!! This will do me no good. I will not reward you until I have two pairs!!";
	local text2 = "Oh wonderful!! A few strands of spiderling web. Aren't you quite the hunter... Despite your obviously great skills, you managed to only kill one spiderling?! Get your cowardly hide out there and get me a few more spiderling silks!.";

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13099, item2 = 13099, item3 = 13099, item4 = 13099},1,text2)) then -- Spiderling Silk
		e.self:Say("Let's see here. One.. two.. three.. and.. four. Great!! Just enough for my needs. You are serving Xelha well. I give you Xelha's Sparkler. It is not much, but neither are you. You know what I really need is a cyclops eye. That would be worthy of a great reward.");
		-- HK confirmed live factions
		e.other:Faction(e.self,271,10); -- Dismal Rage
		e.other:Faction(e.self,281,-1); -- Knights of Truth
		e.other:Faction(e.self,296,2); -- Opal Dark Briar
		e.other:QuestReward(e.self,math.random(9),math.random(7),0,0,12247,250); -- Xelha's Sparkler
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10307, item2 = 10307, item3 = 10307, item4 = 10307},1,text1)) then -- Fire Beetle Eye
		e.self:Say("This is a good sight. I needed these to complete the current mixture. Bah!! I shall reward you for this small, very small, deed!! I pass on to you the knowledge of summoning. The more you serve, the more your faith in Innoruuk grows.");
		-- HK confirmed live factions
		e.other:Faction(e.self,271,10); -- Dismal Rage
		e.other:Faction(e.self,281,-1); -- Knights of Truth
		e.other:Faction(e.self,296,2); -- Opal Dark Briar
		e.other:QuestReward(e.self,math.random(9),math.random(7),0,0,eq.ChooseRandom(15338,15331),225); -- Spell: Cavorting Bones, Spell: Reclaim Energy
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13073, item2 = 13073, item3 = 13073, item4 = 13073})) then -- Bone Chips -- worked at appre
		e.self:Say("Excellent work! You are quite the little helper. Here you go, then. A little something for your little work. Your service to me has caused Innoruuk to look upon you favorably. Your faith in our group has grown. Continue the work.");
		-- HK confirmed live factions
		e.other:Faction(e.self,271,5); -- Dismal Rage
		e.other:Faction(e.self,281,-1); -- Knights of Truth
		e.other:Faction(e.self,296,1); -- Opal Dark Briar
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,math.random(9),0,0,0,0,250);		
	elseif(e.other:GetFactionValue(e.self) >= 500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13927})) then -- Cyclops Eye
		e.self:Say("A cyclops eye!! You are stronger than I believed. You will rise in the ranks of the Dismal Rage quickly with acts such as this!! I am most appreciative! Here, take this. It was lying around my shelves, just gettingg all dusty. I hope you can use it. And watch yourself in your journeys, the aura of your faith in Innoruuk surrounds you like a shroud. Our enemies will surely see you for what you are.");
		-- HK confirmed live factions
		e.other:Faction(e.self,271,25); -- Dismal Rage
		e.other:Faction(e.self,281,-3); -- Knights of Truth
		e.other:Faction(e.self,296,5); -- Opal Dark Briar
		e.other:QuestReward(e.self,0,0,math.random(9),math.random(7),eq.ChooseRandom(15036,15491),500); -- Spell: Gate, Spell: Leering Corpse
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freporte -- Xelha_Nevagon.pl


