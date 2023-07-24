function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ", as she fiddles absently with the ring on her finger as though it were a gift from someone who meant a great deal to her...");
	elseif(e.message:findi("rifkin")) then
		e.self:Emote("spills her drink as you speak, 'umm, who?  I do not know anyone by that...' she trails off, unable to find the words.  'He... he failed the question.  I didn't have anything to do with it, why would you ask me?  On second thought, nevermind, I would really rather not talk about it thank you very much.  Good day to you " .. e.other:GetCleanName() .. ".");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 1) then
		e.self:Emote("looks around a bit and says, 'I think I need a bit of fresh air.'");
	elseif(e.wp == 14) then
		e.self:Emote("looks into the fountain and sighs, something sad about her, before saying aloud, 'perhaps a short walk will get my mind off of him.'");
	elseif(e.wp == 21) then
		e.self:Emote("wanders aimlessly, something weighing heavily upon her soul.");
	end
end