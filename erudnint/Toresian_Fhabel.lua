-- Inert Potion

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome. my friend! We are the Craftkeepers. We study the circle of magic called enchantment. What circle do you [study]?");
	elseif(e.message:findi("study enchantment")) then
		e.self:Say("Then I welcome you into our circle. It is good to see new blood.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(23078) == false or eq.get_entity_list():IsMobSpawnedByNpcTypeID(23001) ==  false) then
			eq.unique_spawn(eq.ChooseRandom(23078,23001),0,0,575,683,-12.13,78); -- NPC(s): Slansin (23078), Slansin (23001)
		end
	elseif(e.message:findi("study wizard")) then
		e.self:Say("Then you should visit with the Crimson Hands. They are also found within the Palace of Erud.");
	elseif(e.message:findi("study magic")) then
		e.self:Say("The ways of magic are not ours. You should speak with the Gatecallers. They will assist you.");	
	elseif(e.message:findi("study heretic")) then
		e.self:Say("What?! Do not jest. Every Erudite knows better than to speak of the forbidden black arts. Do not contemplate studying those arts. You do not want to go the way of the black-hearted heretics.");	
	elseif(e.message:findi("assist")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
			e.self:Say("Ahhhhh " .. e.other:GetCleanName() .. ". Slansin used to have need of those potions, however he mysteriously disappeared long ago. The only person I know of who still wants them is a cleric of the Church of Marr in Freeport.");
			e.other:SummonCursorItem(13983); -- Item: Inert Potion
		elseif(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("You are most welcome to the circle of the Craftkeepers, but I require more service before we can discuss such things.")		
		else
			e.self:Say("You are lucky to be standing. Leave here immediately or suffer grave consequences! You are not welcome amongst the Craftkeepers.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnint  ID:23073 -- Toresian_Fhabel