function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Good day, " .. e.other:GetCleanName() .. "!  You look cold indeed; come and warm yourself by the forge.  Frostbite is a cruel foe for the unprepared!'  Maggie winks at you, 'Tell me, do you much about our special [Halas armor]?");
	elseif(e.message:findi("halas armor")) then
		e.self:Say("Oh, Uncle Kevan has been making Northman armor since the dawn of time, it seems.  He's ancient!'  She lowers her voice, so that only you can hear, 'Well, recently, he's been experimenting with some [new types] over the Northman forge, though he refuses to tell anyone else but me.");
	elseif(e.message:findi("new types")) then
		e.self:Say("You're a curious one!'  She laughs, and begins to whisper in your ear.  'He's been telling me about [ringmail], [platemail] and [boned leather] armor.  April saw him talking to a strange fellow in a dark, hooded robe recently, she thinks that may be from where Uncle's inspiration has come.");
	elseif(e.message:findi("ringmail")) then
		e.self:Say("With a smithy hammer, large patchwork or tattered armor piece, frost temper, the appropriate large chainmail pattern, a little magical ivory and some [infused rings], he's been making some strange ringmail.");
	elseif(e.message:findi("infused ring")) then
		e.self:Say("With velium rings, I saw him work in a large brick of medium quality ore with him smithy hammer.  He used a strange temper that I've not seen before.  April thinks that she overheard the Dark Stranger mention Celestial Temper.  I don't know what it may be, but it makes good armor!");
	elseif(e.message:findi("platemail")) then
		e.self:Say("What heavy armor this was!  Even Uncle looked to have a hard time lifting it.  He used his smithy hammer, some [jointing], frost temper, a large plate mold and some [infused rings].  I think I saw leather padding, and some magical ivory too.");
	elseif(e.message:findi("jointing")) then
		e.self:Say("Everyone knows how to make jointing!  Uncle was using medium quality rings, which he used his smithy hammer and file upon, and a little water.");
	elseif(e.message:findi("boned leather")) then
		e.self:Say("Uncle gave this armor to Peppes - you know, the roaming beastlord that has been entertaining everyone here in town recently?  He made it in the same way as he made the [ringmail], except with some [special boning] instead of rings.");
	elseif(e.message:findi("special boning")) then
		e.self:Say("With velium boning, he worked in a small brick of medium quality ore, using some of that curious new temper, and his smithy hammer.  It seemed to glow with an inner light, it really is odd stuff.  What can it be?");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
