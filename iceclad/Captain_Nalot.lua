function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("squints at you through one eye, the other covered by a metallic eyepatch. 'Garrr. What `ave we here? Another beller yellied land blubber eh? By the looks of ye someones mudder didnt know when ta throw a bad fish back. HAR HAR!'");
	elseif(e.message:findi("bad fish")) then
		e.self:Say("That means I'm callin ya ugly as a piece o' whale blubber but twice as bad smellin, ya son of a water treadin " .. e.other:Race() .. ". Yer about as smart as the slime we use ta patch our boat hull, aren't ya?");
	elseif(e.message:findi("boat")) then
		e.self:Say("Arrrr. So we ain't got a boat right now. What's that got ta do with anythin'? Just cause we ain't got a boat, or a way to sail the waters, or even know how ta sail, don't mean we aren't crusty and dangerous. Just watch yerself cause we're mean.");
	elseif(e.message:findi("mean")) then
		e.self:Say("Thats right! We're mean, nasty, devious 'n cruel. We'll knock ya down, bite yer knees, and steal yer money. Arrr. We won't always say please and thank you either! Just remember that and don't be tryin' anyhin' funny.");
	elseif(e.message:findi("funny")) then
		e.self:Say("Uh, I dunno what funny stuff. No one's ever asked that one. You know, just be nice ta everyone I guess. Think ya can do that?");
	elseif(e.message:findi("map")) then
		e.self:Say("The map? What map? Oh wait, that thing I made ol' what's-his-name do ta get los... uh adventure. Uh, sure. If yer wantin' we've got a job for ya. If ya do it ya get ta be a real member o' me crew.");
	elseif(e.message:findi("member of your crew")) then
		e.self:Say("That means ya get ta take orders from me and ya get ta use fancy words like bilge hoistin' land blubbing beller yellied, and more. Anyways, we needed a map so me lads would stop gettin' lost, but the lad I sent out ain't come back with it. I even sent out a search party but I ain't heard from them either. If ya find 'im get the map and get back 'ere.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30047}, 0)) then
		e.self:Emote("squints and then knocks hard on the metal half of his face to get his eye back in adjustment.. 'Arrr. This is perfect. Har! Now we can be plannin' our pillagin' and plunderin' all proper like. Good work, " .. e.other:GetCleanName() .. "!' Captain Nalot slaps you on the back and accidentally drops his eyepatch. Being a proper pirate now you conveniently forget to mention it to him.");
		e.other:QuestReward(e.self,0,0,0,0,30008,50000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30040,item2 = 30039})) then -- Rum Box Key and Locked Rum Box
		e.self:Say("Land ho!  That be me rum!  Where did ya get that?  Ah nevermind.  Gimme those things.  Just a bit of a turn here... and a pick there... and a twist... and shes unlocked, har!  Here, take a jug.  It be the least I can do fer ye.  We'll be havin a party tonight lads!");
		e.other:QuestReward(e.self,0,0,0,0,30034,5000); -- Capt. Nalot's Triple Strength Rum
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
