function event_spawn(e)
    local zone_time = eq.get_zone_time();
    local hour = zone_time["zone_hour"];
    local minute = zone_time["zone_minute"];
    eq.debug("Boat spawned! Name is: " .. e.self:GetName() .. " Time is: " .. hour ..":" .. minute .. "", 1);
    eq.start(21);
end

function event_signal(e)
    if(e.signal == 1) then
        eq.start(17);
    end
end

function event_waypoint_arrive(e)
    local zone_time = eq.get_zone_time();
    local hour = zone_time["zone_hour"];
    local minute = zone_time["zone_minute"];
    if(e.gridid == 21 and e.wp == 11) then
        eq.stop();
        eq.move_to(3158, 836, -13, 65.27, true);
    end
    if(e.gridid == 17 and e.wp == 11) then
        eq.spawn_condition("butcher",4,0);
        eq.spawn_condition("timorous",6,1);
        eq.debug("Shuttle to timorous (4) has reached its destination! Name is: " .. e.self:GetName() .. " Time is: " .. hour ..":" .. minute .. "", 1);
        eq.get_entity_list():ForeachClient(
            function(ent)
                ent:MovePC(96, -7580, 3580, 19, 72);
            end,
            function(ent)
                if(ent:GetBoatID() == 847) then
                    return true;
                end
                return false;
            end
        );
    end
end