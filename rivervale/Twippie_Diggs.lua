function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What a lovely day it is, " .. e.other:GetCleanName() .. "!  You look rather sunburned!'  Twippie winks at you.  'I've some fine leather armor for sale today, or perhaps I could bend your ear with a little [learning]?");
	elseif(e.message:findi("learning")) then
		e.self:Say("I approve!  A young one with the urge to learn!'  Twippie chuckles, and leans on a crate.  'The Stormreapers, over there on the farm, have been employing me to come up with some [armor] to help defend the Vale!");
	elseif(e.message:findi("armor")) then
		e.self:Say("Three kinds, can I show you, though all similar.  For each, I sew within my special Halfling Sewing Kit.  With an embroidering needle, I take acorn oil, a high quality brute hide, a pattern, an imbued plains pebble and then some [special material], depending upon which armor I wish to make.");
	elseif(e.message:findi("special material")) then
		e.self:Say("All questions, you are!'  He smiles.  'For boned leather, I make boning in the special forge from a small brick of high quality ore, my file, and some [temper].  For woven-in chain, I use a large brick that same temper, and my smithy hammer!  Finally, for woven-in plates, it's just like chainweave, except that I use two large bricks instead of one; easy as pie!");
	elseif(e.message:findi("temper")) then
		e.self:Say("And there's the rub.'  Twippie's eyes look distant as he struggles to remember something.  'I met someone, recently it was, though I cannot for the life of think where or when, or even what he looked like.  All I remember is his voice.  He told me that I'd find a crate of temper in my bank vault and, lo and behold, there it was.  Isn't that strange?  Perhaps you can find someone that knows about it.");
	elseif(e.message:findi("meeka")) then
		e.self:Say("Meeka Diggs is my older sister. She primarily deals with cloth armor.");
	elseif(e.message:findi("kevlin")) then
		e.self:Say("Kevlin is my older brother. Together with my sister, Meeka, we run Kevlin's Gear, the number one dealers in armor in Rivervale. Well, the only armorer in Rivervale. Not counting Sonsa Fromp. Ahh... Beautiful Sonsa Fromp...");
	elseif(e.message:findi("lashinda")) then
		e.self:Say("Lashinda Hoggletop? She is the new bride of my older brother, Kevlin. She works at the Fool's Gold. I don't like her much. I think she is cheating on my brother. I have seen her hanging around a traveling merchant named Lindo. He is a dwarf and frequents the Fool's Gold a lot at night. I could have sworn I saw them holding hands.");
	elseif(e.message:findi("sonsa")) then
		e.self:Say("Sonsa Fromp used to be married to my older brother Kevlin. She accidentally overcharged a customer once and my brother used that as an excuse to take the name of Diggs away from her so he could wed Lashinda Hoggletop. Now poor, beautiful Sonsa must charge a fortune for leather items just to make ends meet.");
	end
end
