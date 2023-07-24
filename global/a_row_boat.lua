-- Quest to return boats to their spawn points after an hour without use
-- by RealityIncarnate

-- The boat receives a signal (id 0) whenever the server gets a ControlBoat opcode
function event_signal(e)
  eq.stop_timer("respawn");		-- stop any respawn countdown in progress
  eq.set_timer("checkuse", 60);	-- begin checking for use every minute
end

function event_timer(e)
  if(e.timer == "checkuse") then
    if(not e.self:GetTarget()) then		-- if the boat has a target, it's in use.  If not, begin the respawn timer
      eq.stop_timer("checkuse");	-- stop checking for use
      eq.set_timer("respawn",3600); 	-- start the respawn timer at 1 hour
    end
  end
  if(e.timer == "respawn") then
    eq.depop();		-- it hasn't been used for an hour, so respawn the boat		
  end
end