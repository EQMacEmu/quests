function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("has a helm tied to his belt.  He is chewing something.  He spits some shells out and they land on your chest.  'Sorry about that.  Hehe.");
		e.self:DoAnim(12);
	elseif(e.message:findi("helm")) then
		e.self:Emote("grabs the helm and juggles it in front of your face.  'Bet you wish you had one.  I busted some bard's lute for playing Teir'Dal songs.  I told him I would move on to his face unless he had something of value.  This is all he had.  Said he found it in a place some call Sebilis.  I took it even though it is something only a bard would wear.  That's just how I am, a kindly soul. Hehehe...");
		e.self:DoAnim(51);
	elseif(e.message:findi("chewing")) then
		e.self:Say("Can't you tell?!  It's on your chest.  Heh!  What a dim one!  They're flarefire seeds.  Only good thing about this land.  Trackers find 'em in the Field of Bone near some lizard city.");
		e.self:DoAnim(54);
	elseif(e.message:findi("burynai bundt cake")) then
		e.self:Emote("gets excited. What?!! Do you know how to bake a Burynai Bunt Cake. Glinya said she would marry me if I baked one!! She won't let me use her oven so I had search for one. I finally located one in some goblin mine, but I can't find the recipe or bake. Please!! I would give you this bard's helm for a Burynai Bunt Cake.");
		e.self:DoAnim(13);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
