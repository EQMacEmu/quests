----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Captain Nyra (201350)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("glares coldly upon ".. e.other:GetName() .. ", a seemingly deadened emotion of hate briefly resurrected in her gaze, 'Move along, traveler. We are nothing for your interests -- merely prisoners. Stay and observe us if you will -- perhaps one day, you will join us.");
    end
end
