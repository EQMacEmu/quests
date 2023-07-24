function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("wipes his hands on his trousers leaving a fresh streak of grease. 'Ye come ta see my collection of machinery supplies, have ye, swabby?'");
	elseif(e.message:findi("yes")) then
		e.self:Say("Well then get ta lookin', pegleg! I've got stuff ye canna get anywhere else!");
	elseif(e.message:findi("stuff") or e.message:findi("where")) then
		e.self:Say("You're startin' ta ask too many questions, pal.");
	end
end
