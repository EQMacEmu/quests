function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. " - my how you've grown!  Would you perhaps care to see my cloth armor for sale?'  Her eyes twinkle.  'Maybe you'd like to hear a little about the traditional halfling craft of [bagmaking]?");
	elseif(e.message:findi("bagmaking")) then
		e.self:Say("Ah yes, we're reknowned for our bags!  Halflings are the travelers of the land, usually in search of fine pipeweed and a good ale.'  She grins at you.  'We sew together a number of patches of [wolf fur], and some special [thread], and use a little acorn oil to keep it water-tight, all in the special Halfling Sewing Kit.");
	elseif(e.message:findi("wolf fur")) then
		e.self:Say("Well, you'll need to be a traveler, like me!  You can sew together three tufts of dire wolf fur to make a patch of it, using an embroidering needle in your Halfling Sewing Kit.  You can then sew three of those patches into a big weave!  The weave is used in the bagmaking.  The more you use, the bigger the bag!");
	elseif(e.message:findi("thread")) then
		e.self:Say("This is the touch of magic that makes halfling bags the finest in the world!  In the special Halfling Forge, roast a little platinum thread with some special [temper].  Whatever you put in the bags becomes so light as to be almost non-existent!");
	elseif(e.message:findi("temper")) then
		e.self:Say("Oh, um..'  Meeka looks a little worried, and leans towards your ear to whisper.  'You'd best ask my husband, Twippie, about that.  It's a bit of a mystery, to be sure.");
	elseif(e.message:findi("twippie")) then
		e.self:Say("Twippie Diggs is my younger brother. He sells armor also. His specialty is leather armor.");
	elseif(e.message:findi("kevlin")) then
		e.self:Say("Kevlin is my brother. Our family has been in the armor business for many years.");
	elseif(e.message:findi("lashinda")) then
		e.self:Say("She is my brother Kevlin's bride. She is very nice. She works at the Fool's Gold, but when she has time she will help out with the shop by cleaning up or taking the day's profit over to the vault in the Guardian Stronghold.");
	elseif(e.message:findi("sonsa")) then
		e.self:Say("Oh, my! Do not mention that name to me! She used to be wed to my older brother, Kevlin. All I can say about her is that she would make a better rogue than a tailor.");
	end
end