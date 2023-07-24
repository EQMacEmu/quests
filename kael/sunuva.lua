function event_spawn(e)
	eq.set_timer("proxsay",2000);
end

 function event_timer(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	eq.set_proximity(xloc - 14, xloc + 20, yloc - 10, yloc + 10);
	eq.enable_proximity_say();
	eq.stop_timer("proxsay");
 end
 
function event_proximity_say(e)
	local xloc = e.other:GetX();
	local yloc = e.other:GetY();
	local nxloc = e.self:GetX();
	local nyloc = e.self:GetY();
	local xdiff = xloc - nxloc;
	local ydiff = yloc - nyloc;
    if(e.message:findi("hail") and e.other:GetGM()) then -- debug only
        e.self:Say("Your x is ".. xdiff .." and your y is " .. ydiff .." from me!");
    end
	if(e.message:findi("the dain shall be slain for the peace we must obtain")) then
		if(eq.get_entity_list():IsMobSpawnBySpawnID(337949) == false 
		and eq.get_entity_list():IsMobSpawnBySpawnID(337959) == false 
		and eq.get_entity_list():IsMobSpawnBySpawnID(337948) == false 
		and eq.get_entity_list():IsMobSpawnBySpawnID(337960) == false 
		and eq.get_entity_list():IsMobSpawnBySpawnID(337847) == false
		and eq.get_entity_list():IsMobSpawnBySpawnID(337960) == false
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(113260) == false
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(113261) == false
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(113262) == false
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(113263) == false
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(113264) == false
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(113265) == false
		and eq.get_entity_list():IsMobSpawnedByNpcTypeID(113266) == false) then
			eq.unique_spawn(113249,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		end
	end
end
