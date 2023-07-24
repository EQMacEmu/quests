function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("turns to speak to you, you notice his face is very pale. 'You must leave me alone. I must get back to Sanctus Seru immediately. I have much [work] to do.'");
	elseif(e.message:findi("work")) then
		e.self:Emote("moves in quick bursts of speed and starts to attack, his screams of torment reveal sharp fangs. 'Argh! I said leave me be!'");
		eq.attack(e.other:GetName());
	end
end
