----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Moobik (201297)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 7 and e.other:GetLanguageSkill(7) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("Vengeance!'  He bellows and looks about as if he has misplaced his weapon.  'The Avatar of my God fell to my axe, and you shall be next!  There are no Gods, only victors in battle!",7);
        end
    else
        e.self:Emote('does not appear to understand you.');
    end
end
