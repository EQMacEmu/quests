-- anti-cheat: these should not be able to enter Solusek Ro's chamber
function event_combat(e)
	if ( e.self:GetZ() > 240 and e.self:Charmed() ) then
		e.self:BuffFadeByEffect(22);
		e.self:ModifyNPCStat("mr", "200");
	end
end
