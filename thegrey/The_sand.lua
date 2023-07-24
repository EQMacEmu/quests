-- scripts to randomly spawn one of these npc : a_Xakra_Shah or a_Xakra_Sei

function event_combat(e)
	if(e.joined) then
		e.self:Emote("at your feet explodes into violent motion!");
		eq.spawn2(eq.ChooseRandom(171001,171003),0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
end
