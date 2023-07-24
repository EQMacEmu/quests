function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well, hello there, my good fellow. I see you've somehow found your way into my private quarters, very adventurous. Normally I'd have you removed but it's refreshing to see someone with guts like you have. Too many people in this cit... err ... world have no guts. No initiative. Someday that will change, though.");
	elseif(e.message:findi("guts")) then
		e.self:Emote("chuckles as he thinks back on days of old. He says, 'Oh yes, back when I wore a scabbard as you do, I saw more than my share of guts. Ahh, but I am retired now, although I still negotiate contracts for specific services now and again.");
	elseif(e.message:findi("contract")) then
		e.self:Say("Unfortunately, I have none currently, but I'll let you know if I do get some in. Farewell, " .. e.other:GetCleanName() .. ".");
	end
end
