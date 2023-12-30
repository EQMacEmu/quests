function event_spawn(e)
    -- enable Shuttles on initial zone start
    eq.spawn_condition("butcher",3,1);
    eq.spawn_condition("butcher",4,1);
    eq.spawn_condition("butcher",5,1);
    eq.spawn_condition("butcher",6,1);
end

function event_signal(e)
    if(e.signal == 1) then
        e.self:Shout("The Maiden's Voyage has departed the outpost at Firiona Vie. Please be ready to board the shuttles shortly, if you desire to make the journey to Kunark.");
    end

    if(e.signal == 2) then
        e.self:Shout("The Maiden's Voyage is now ready to be boarded. Please form an orderly line to the shuttles, and remember, no pushing!");
        eq.signal(846, 1);
        eq.signal(847, 1);
        eq.signal(848, 1);
        eq.signal(849, 1);
    end
end