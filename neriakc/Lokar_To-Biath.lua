--Lokar_To-Biath.pl
--Red Wine (Part of Tome of Ages)

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I am the Scribe of Innoruuk. If you do not have business with me, begone!");
		else
			e.self:Say("Your reputation precedes you. You are no friend to the Dark Bargainers.");		
		end
	elseif(e.message:findi("scribe of dal")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Scribes of Dal? All of them are long since [dead].. or at least most would say that.");
		else
			e.self:Say("Your reputation precedes you. You are no friend to the Dark Bargainers.");		
		end
	elseif(e.message:findi("dead")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Perhaps, perhaps not. I cannot remember, but perhaps Innoruuk would help me remember should you tithe him a bottle of red wine from the Blind Fish.");
		else
			e.self:Say("Your reputation precedes you. You are no friend to the Dark Bargainers.");		
		end
	elseif(e.message:findi("vow")) then
		if(e.other:GetFactionValue(e.self) >= 0) then			
			e.self:Say("Break the vow? She might. Were you to tithe 70 gold to your god, Innoruuk, he might aid you.");
		else
			e.self:Say("Your reputation precedes you. You are no friend to the Dark Bargainers.");		
		end
	elseif(e.message:findi("innoruuk")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I am his scribe, and He is our god.  There is nothing else to be said.");
		else
			e.self:Say("Your reputation precedes you. You are no friend to the Dark Bargainers.");		
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	local Red_Wine = item_lib.count_handed_item(e.self, e.trade, {13030}); -- Red Wine
	
	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {platinum = 7})) then
		e.self:Say("Take this note to the Scribe of Dal, and perhaps she will break her vow.");
		-- confirmed live factions
		e.other:Faction(e.self,236, 10);--Dark Bargainers		
		e.other:Faction(e.self,370, 1);--Dreadguard Inner
		e.other:Faction(e.self,334, 1);--Dreadguard Outer
		e.other:QuestReward(e.self,0,0,0,0,18200); --a note (renounce the D'al, Text: TomeOfAges1)
	elseif(Red_Wine > 0) then
		repeat
			e.self:Say("Ah, yes, let me pray to our god.. Yes, Innoruuk has given me wisdom. A Scribe of Dal still exists, disguised as a barkeep in the Blind Fish. This information will not help you though, for she has sworn a [vow] of silence and will not speak of the Dal.");
			-- confirmed live factions and exp data
			e.other:Faction(e.self,236, 10);--Dark Bargainers			
			e.other:Faction(e.self,370, 1);--Dreadguard Inner
			e.other:Faction(e.self,334, 1);--Dreadguard Outer
			e.other:QuestReward(e.self,0,0,0,0,0,100);
			Red_Wine = Red_Wine - 1;
		until Red_Wine == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
	e.self:Say("The death of a Dark Bargainer never goes unnoticed!");
end
