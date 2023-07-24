function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to our blacksmithing establishment, " .. e.other:GetCleanName() .. ". I have a few assorted tool molds should you need them.  If you're searching for other supplies, please ask some of my fellow workers.");
	end
end
