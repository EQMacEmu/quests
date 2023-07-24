-- Rogue Epic NPC/Guildmaster -- Founy_Jestands

function event_say(e)
	if(e.message:findi("stanos")) then
		e.self:Say("Um, er.. <looks around nervously> Have you actually seen Stanos? How.. is he? Um, I have things I should be doing. I've got to figure out how this pottery wheel got stuck on my foot, for one thing. Er, I really don't have anything to tell you about Stanos, really, I swear it.");
	elseif(e.message:findi("note") or e.message:findi("letter") or e.message:findi("parchment")) then
		e.self:Say("I don't know what you're talking about, if you know what I mean.' Founy fingers his belt pouch. 'You should leave now, if you know what's good for you. Don't make me sic the crew on you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end


--Quest by: Solid11
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
