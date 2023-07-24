function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh. HI! Hey, you're an adventurer aren't you? Yeah I thought so from your worn clothes and weapons. Wow, is that a real bloodstain? Some day I'll be adventuring out there too, some day, they'll see...");
	elseif(e.message:findi("they")) then
		e.self:Say("Ooohh, everyone at work. They always say I'll never do it, that I don't have the guts. Well, I do. They'll see. We'll see who's laughing when I pack up and go on a grand quest to win my fortune and glory. <sigh>");
	elseif(e.message:findi("quest")) then
		e.self:Say("Well, I haven't figured out that part yet. I guess I'll slay a dragon, maybe save a princess or two. You know, the normal stuff. I don't want to get too crazy, heheh, you know... like calculate which weapon is the most efficient and debate over it in public forums to no end.");
	end
end
