function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What do you want?! Can't you see I am busy drinking here? You don't even look like you belong here. You can have my seat when I am good and ready to leave, which won't be for a while yet. If I were you, I would get lost before I got myself hurt.");
	elseif(e.message:findi("tunare") or e.message:findi("stormhammer") or e.message:findi("eye")) then
		e.self:Say("Listen, buddy!  I do NOT know what you are babbling about!  If you know what's good for you, then you'd best leave.");
	end
end
