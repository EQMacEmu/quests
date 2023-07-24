function event_waypoint_arrive(e)
	if(e.wp == 1 or e.wp == 2) then
		eq.spawn2(161020,0,0,-50,-308,10,0):AddToHateList(e.self,1);
	elseif(e.wp == 3 or e.wp == 4) then
		eq.spawn2(161015,0,0,-41,-93,7,0):AddToHateList(e.self,1);
	elseif(e.wp == 5 or e.wp == 6) then
		eq.spawn2(161020,0,0,-38,206,11,0):AddToHateList(e.self,1);
	elseif(e.wp == 9) then
		eq.spawn2(161004,0,0,-114,467,2,0):AddToHateList(e.self,1);
		eq.spawn2(161004,0,0,-116,469,2,0):AddToHateList(e.self,1);
	elseif(e.wp == 10) then
		eq.spawn2(161004,0,0,-114,467,2,0):AddToHateList(e.self,1);		
	elseif(e.wp == 14) then
		eq.unique_spawn(161009,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		e.self:Say("Whew, we are finally here.  If you will give me the contract I will keep up with my part of the bargain.");
		eq.depop();
	end
end