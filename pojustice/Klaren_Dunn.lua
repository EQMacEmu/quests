----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Klaren Dunn (201295)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 5 and e.other:GetLanguageSkill(5) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("Allfather's blessings to you, ".. e.other:GetName() .. ".  You dress mighty odd for a " .. e.other:Race() .. ", I must say.'  She regards you with great interest.  'A prayer to Surrilis himself for your health.  You look as if you're right bursting at the seams to talk, so you are.  Have you brought word from one of my friends?",5);
        end
    else
        e.self:Emote('does not appear to understand you.');
    end
end
