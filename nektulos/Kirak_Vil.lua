function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Begone from my sight, whelp! Do not try my patience or I may forget my quest and slay you where you stand. I seek the challenge of a [hypocrite] today.");
	elseif(e.message:findi("hypocrite")) then
		e.self:Say("Need you ask? This day I will slay one of those self-righteous Paladins and earn the rank of Dragoon!");
	elseif(e.message:findi("paladin")) then
		e.self:Say("Bah! I should slay you for your impertinence but instead I will save my Hate for a Paladin.");
	end
end
