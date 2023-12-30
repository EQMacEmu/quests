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
    if(e.gridid == 17 and e.wp == 12) then
        eq.spawn_condition("butcher",4,0);
        eq.spawn_condition("timorous",6,1);
        eq.debug("Shuttle to timorous (4) has reached its destination! Name is: " .. e.self:GetName() .. " Time is: " .. hour ..":" .. minute .. "", 1);
        eq.get_entity_list():ForeachClient(
            function(ent)
                ent:Signal(2);
            end,
            function(ent)
                local px = ent:GetX();
                local py = ent:GetY();
                local boat_id = ent:GetBoatID();
                local diff_boat_check = boat_id == 846 or boat_id == 848 or boat_id == 849;
                -- bounding box of Shuttle_II
                local valid_pos_check = px >= 3567 and px <= 3655 and py >= 440 and py <= 464;
                -- Server thinks we're on Shuttle_I, Shuttle_III or Shuttle_IV and are about to zone.
                if(diff_boat_check and valid_pos_check) then
                    return true;
                end
                return false;
            end
        );
        eq.get_entity_list():ForeachClient(
            function(ent)
                ent:MovePC(96, -7580, 3580, 19, 72);
            end,
            function(ent)
                local px = ent:GetX();
                local py = ent:GetY();
                -- bounding box of Shuttle_II
                local valid_pos_check = px >= 3567 and px <= 3655 and py >= 440 and py <= 464;
                if(ent:GetBoatID() == 847 and valid_pos_check) then
                    return true;
                end
                return false;
            end
        );
    end
end