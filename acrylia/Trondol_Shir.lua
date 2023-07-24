function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks around frantically, 'What are you doing here? You'll be killed! Do not waste your time trying to help me. Save yourself and leave at once!'");
	elseif(e.message:findi("help you")) then
		e.self:Emote("shakes his head in frustration, 'I am beyond help. The key to my shackles is held by the grunts' high priest, curse him. I feel his dark magic pulling at my soul. I am doomed to join the legion of our fallen people that serve their twisted master here.");
	elseif(e.message:findi("key")) then
		e.self:Emote("opens his mouth as if to speak, but lacks the strength to form words");
	elseif(e.message:findi("high priest")) then
		e.self:Emote("speaks slowly between shallow, labored breaths, 'Through some kind of dark magic, the grunts steal away the spirit energy from their victims. I know not what they do with this energy once they procure it. When the victim is all but drained of life, the high priest forces them to walk to the end of the platform over there. He then performs some sacrificial ritual that hurls the prisoner into the pit. Shortly thereafter, the bones of the fallen are collected and reanimated, destined to serve the grunts forever. I have seen this a dozen times now, and now my time is near.'");
	end
end