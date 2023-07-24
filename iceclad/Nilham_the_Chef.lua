function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ahoy, " .. e.other:GetCleanName() .. ". Welcome ta the brig. I didn't get ta the 'B' section of my piratisms manual so I'm not sure what a brig is but I'm guessin' it means 'really small place without enough food or water.' So, ya here ta stay or just visitin'?");
	elseif(e.message:findi("cat")) then
		e.self:Say("That was a nasty cat.  I dun think it was after us, though. I think it just smelled the fresh chunk of wooly rhino jerky I had.  It didn't do anythin' but knock us over.  I guess that's what it likes, walrus.  After it knocked us over it slipped away towards the bridge island like a ghostly mist.  I'm thinkin' I saw a glimmer in its maw while it was runnin' off.");
	elseif(e.message:findi("crate")) then
		e.self:Say("I'll be an aft port if I think anyone will ever see the crate and key again. If by some act o' Prexus you do, then take them ta the Cap'n. I'm sure he'd be thrilled to see it. Just don't remind him I'm here cause he might let me go and make me work again.");		
	elseif(e.message:findi("stay")) then
		e.self:Emote("grins.  'Not sure what ya did ta have ta stay but take a seat.  There's a good starin' wall right over there.  Don't hurt yerself with excitement.");	
	elseif(e.message:findi("piratism")) then
		e.self:Say("Aye.  We all got a pirate grammar manual from the good cap'n.  We were supposed ta learn how ta talk like proper pirates from all the books Cap'n Nalot read but I never had time cause I used ta be the cook and was too busy.  That's really the only bad thing about this brig thing really.");	
	elseif(e.message:findi("bad thing")) then
		e.self:Say("I don't have anythin' ta read.  No books here at all.  I don't mind bein kept in here cause I don't have ta cook or work anymore but it'd be great ta have somethin' ta read.  I still wanna learn more words.");
	elseif(e.message:findi("learn more words")) then
		e.self:Say("That's how we decide who gets ta do what.  Who can use the most pirate words.  Cause I only got to the 'A' section of the book, I'm pretty low on the list.  Thats why I'm the chef.  I can only say things like 'Arrr', 'Avast yer afts' and 'Ahoy those afts!'.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18962}, 0)) then
		e.self:Emote("looks at you with a gleam in his eye.  'Wow.  Ya actually got one.  Thanks, mate!  Here, you can have my cuffs.  I'm tired of 'em and they're startin' ta chafe.'  He flips through the book with a grin.  'B - Bilgewater.  Barnacle brained blunderhead.  Blast yer ballast...' Nilham happily reads through the book.");
		e.other:QuestReward(e.self,0,0,0,0,30041,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
