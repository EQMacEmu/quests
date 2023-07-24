function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks up at you with sad eyes and says, 'Hail there, " .. e.other:GetCleanName() .. ".");
	elseif(e.message:findi("sad")) then
		e.self:Emote("sighs and says, 'Oh well, the mines been overrun with nasty critters, so I'm outta work. What's a dwarf who can't mine? Like a fish outta water. Hopefully, the Dain'll send in some troops to clear 'em out. I'm not holdin' me breath though, he's got lots of other things to take care of, I guess.");
	elseif(e.message:findi("mine")) then
		e.self:Say("Well, I mine velium, and sometimes I kin pull some iron outta the stone round here. Well I used to. The only one down there now is crusty ol' Normon, he ain't all there. They say he been down there so long he eats rocks, no one ever sees 'im but we all know he's down there.");
	end
end
