-- More Help for Innoruuk
-- Aid Garuuk

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then -- not sure exact faction, indifferent works, threatening doesn't
			e.self:Say("Hail, " .. e.other:GetCleanName() .. ", are ya a follower ob Innoruuk?  I hopes so.  We needs many ta spread His Hate.  None be as bicious as be dem dat follow Him.  We do brings fear and hate ta all dat does sees us.  Dis is well.  He likes it.  Can ya [help]?");
		else
			e.self:Say("You die! Me Darkone!  We no frend to you.  You run now!");	
		end
	elseif(e.message:findi("help")) then
		if(e.other:GetFactionValue(e.self) >= 0) then -- not sure exact faction, indifferent works, threatening doesn't			
			e.self:Say("Me hears orcs nearby are trubble.  Da werd frum Neriak is dey wants us ta kills dem before dey organize.  Dark elf say ta looks for Deathfist Clan.  Say dey called cen-tu-ri-ons.  Dey try ta gets big orc army.  Shows me ya can strike fear and hate inta dem orcs... dey needs be more scared a us den dem humies.  Brings me a Deathfist slashed belt.");
		else
			e.self:Say("You die! Me Darkone!  We no frend to you.  You run now!");		
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13916})) then -- Deathfist Slashed Belt
		e.self:Say("Good job. Dat help lerns um. Takes dis ta help ya lerns how ta do more hateful tings. Ya gots a good starts fer Him ta be prouds a ya");
		e.other:Faction(e.self,237,5); -- Faction: Dark Ones
		e.other:Faction(e.self,308,1); -- Faction: Shadowknights of Night Keep
		e.other:Faction(e.self,251,-1); -- Faction: Frogloks of Guk
		e.other:QuestReward(e.self,0,0,0,0,15272,50); -- Spell: Spirit Pouch -- verified live xp
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 26632, item2 = 26640, item3 = 29921, item4 = 26662})) then -- Aid Garuuk
		e.self:Say("Dis am gud. I see you've been talkin' to Garuuk. Methanks you fer da help. Take dis note back ta Garuuk so he knows you helped me. Tanks again!");
		e.other:Faction(e.self,237,10); -- Faction: Dark Ones
		e.other:Faction(e.self,308,2); -- Faction: Shadowknights of Night Keep
		e.other:Faction(e.self,251,-1); -- Faction: Frogloks of Guk
		e.other:QuestReward(e.self,0,0,0,0,28740,1000); -- Item: Troll Receipt
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
