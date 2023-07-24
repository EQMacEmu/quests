function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail " .. e.other:GetCleanName() .. ".' With a concerned look, Krystiana motions you to come closer.  'It is my husband, Draan - he has recently been suffering terrible [nightmares].");
	elseif(e.message:findi("nightmare")) then
		e.self:Say("He sweats in his sleep, and shivers as if freezing.  I dare not wake him when this mood takes him, it is all I can do to keep his forehead cool with a damp cloth.  He has begun to [talk] whilst asleep recently, too, though sometimes barely coherent.");
	elseif(e.message:findi("talk")) then
		e.self:Say("Though he can remember nothing upon waking, save for mixed feelings of excitement and fear.  He talks of a Dark Stranger, a figure in black robes the face of whom he cannot see.  As I can tell, he appears to be..' Krystiana shakes her head, unbelievingly, '... [learning]?");
	elseif(e.message:findi("learning")) then
		e.self:Say("He speaks at great length sometimes, in a voice which is barely his own, about new forms and styles of [armor].  He is Neriak's master smith, as you may know.");
	elseif(e.message:findi("armor")) then
		e.self:Say("At first, he talked of [infused rings].  I listened so intently, and commited them to memory.  He seems to understand none of this upon waking, and tells me not to be so foolish.  Later he talked of [velium sheets], and eventually of [chainmail] and [platemail], from the Teir'dal Forge.  What shall I do?");
	elseif(e.message:findi("infused ring")) then
		e.self:Say("Poor Draan.  He speaks of infusing velium rings by using large bricks of enchanted adamantite and something he called Celestial Temper, with his teir'dal smithy hammer.");
	elseif(e.message:findi("velium sheet")) then
		e.self:Say("This was something about making velium sheets from blocks of velium, with velium temper and a smithy hammer.  He then muttered about infusing these velium sheets by hammering in a large enchanted block of adamantite ore, using Celestial Temper and his tier'dal smithy hammer.");
	elseif(e.message:findi("chainmail")) then
		e.self:Say("Using his teir'dal smithy hammer, some silk, shadow temper, a chain pattern and some of the [infused rings], he mentioned suits of gleaming chainmail.'  Krystiana sighs, 'I don't know what to make of it.  He even mentioned imbuing them with the power of the Dark Lord.");
	elseif(e.message:findi("platemail")) then
		e.self:Say("With a teir'dal smithy hammer, enchanted adamantite chain jointing, shadow temper, leather padding, a small plate mold and the infused [velium sheets] he muttered about legions of King Thex's guards wearing this new armor.  Imbuing this platemail was possible, he said.  What can it mean?");
	end
end