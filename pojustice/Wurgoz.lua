----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Wurgoz (201337)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("tilts his head and gives a slight twitch of his eyes in quick observation of ".. e.other:GetName() .. ", 'You are free...  you are not a prisoner of this place. Interesting. Perhaps...  perhaps you would care to listen to my tale? Maybe... maybe you can give me some relief from this suffering and ease my conscience if only for a moment.");
    end
end
