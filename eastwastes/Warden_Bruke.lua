function event_combat(e)
	if(e.joined) then
		Guards = math.random(0,4);
		if(Guards == 4) then
			eq.spawn2(116031,0,0,-381,430,-3,0):CastToNPC():MoveTo(-360,313,15,0,true);
			eq.spawn2(116031,0,0,-373,431,-3,0):CastToNPC():MoveTo(-360,313,15,0,true);
			eq.spawn2(116031,0,0,-355,428,-3,0):CastToNPC():MoveTo(-360,313,15,0,true);
			eq.spawn2(116031,0,0,-343,410,-3,0):CastToNPC():MoveTo(-360,313,15,0,true);
		elseif(Guards == 3) then
			eq.spawn2(116031,0,0,-373,431,-3,0):CastToNPC():MoveTo(-360,313,15,0,true);
			eq.spawn2(116031,0,0,-355,428,-3,0):CastToNPC():MoveTo(-360,313,15,0,true);
			eq.spawn2(116031,0,0,-343,410,-3,0):CastToNPC():MoveTo(-360,313,15,0,true);
		elseif(Guards == 2) then
			eq.spawn2(116031,0,0,-373,431,-3,0):CastToNPC():MoveTo(-360,313,15,0,true);
			eq.spawn2(116031,0,0,-355,428,-3,0):CastToNPC():MoveTo(-360,313,15,0,true);
		elseif(Guards == 1) then
			eq.spawn2(116031,0,0,-373,431,-3,0):CastToNPC():MoveTo(-360,313,15,0,true);
		end
	end
end
