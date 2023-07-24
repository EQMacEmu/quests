----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Lasiya (201362)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 23 and e.other:GetLanguageSkill(23) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("" .. e.other:Race() .. "...'  She tucks her long, beautiful hair behind her ears and meets your gaze.  In her eyes you see...  desire?  'The Dark Tower always has need for new...  blood.   Come closer, little " .. e.other:Race() .. ".  Lasiya won't hurt you, not a bit.  Come and lose yourself in my arms...   I can guarantee you an eternity from which you will never wish to escape...",23);
        end
    else
        e.self:Emote('does not appear to understand you.');
    end
end
