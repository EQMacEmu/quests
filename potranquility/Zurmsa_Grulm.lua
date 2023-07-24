function event_spawn(e)
	e.self:CastToNPC():SetNoQuestPause(true);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:DoAnim(58);
		e.self:Emote("was humming as you approached.  As you hail her. the humming turns into a surprisingly loud outburst of song!  Her arms flail and fish guts fly. as she dances around with troll-like gracefulness!");
	end
end
