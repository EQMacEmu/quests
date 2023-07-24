----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Gubkuk (201404)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 6 and e.other:GetLanguageSkill(6) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("You bite-size, me should lick lips and get hungry.  But me not.  Me want good food, me want some of dem roots that me found just outside home.  What good is home if you not allowed to eat the roots?  No one told me what dey was for.  Me only wanted tasty bite...  Nalikor so angry...",6);
        end
    else
        e.self:Emote('does not appear to understand you.');
    end
end
