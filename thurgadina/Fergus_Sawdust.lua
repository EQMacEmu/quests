function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Can I help you with something? If you want anything to do with carpentry, somethin' I grew up with and was raised on, I can't help ya. Nope.");
	elseif(e.message:findi("carpentry")) then
		e.self:Say("Well, good citizen Argash, that patriot to the Coldain people, pushed me out of my business by lining the pockets of the council with his money. Now the council and Argash sit pretty while I can barely feed meself. Somethin's rotten in the state o' Thurgadin.");
	elseif(e.message:findi("rotten")) then
		e.self:Say("I don't know. I've never met the Dain, never even really seen 'im. But what's goin' on ain't right and somethin' needs to be done about it. But who would stand against Brell's own chosen? Times are a changin', " .. e.other:GetCleanName() .. ".");
	end
end
