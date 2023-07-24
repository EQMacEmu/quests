function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ", make yourself at home. We really appreciate all that you newcomers are doing to protect us.");
	elseif(e.message:findi("fort") or e.message:findi("throne")) then
		e.self:Say("Oh they can call this place whatever they want to call it really. I'm just happy that we have those nice paladins here to protect us. As long as I'm safe they can call this place whatever they want to call it. It doesn't change anything anyway.");
	end
end