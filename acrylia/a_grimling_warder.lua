function event_combat(e)
	if(e.joined) then	
		e.self:Say("A fine sacrifice you make! Say hello to the master!");
		
		if ( e.other:IsClient() ) then
			-- teleport to statue pit
			e.self:CastSpell(2857, e.other:GetID()); -- BetaAcrylia
		else
			-- for charm pets that aggro
			e.self:CastSpell(1792, e.other:GetID()); -- Abolish Enchantment
		end
		e.self:WipeHateList();
	end
end
