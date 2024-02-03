-- enchanted clay quest/refined mithril blade -- ranger epic

function event_spawn(e)
	eq.set_timer("chant",math.random(1800000,2700000));
end

function event_timer(e)
	e.self:Say("Mud, rock, crystals, gems, metal. Arrrrrr!");
end

function event_say(e)--indifferent or better
	if(e.other:GetFaction(e.self) < 6) then
		if(e.message:findi("mud")) then
			e.self:Say("Eh? Oh, the clay. Arrr. Lots o' that mud round 'ere. Mostly, a good dwarf not be needin' somethin' so soft 'n squishy but the womenfolk, you know, the elves come lookin' fer it. If ye be one o' those pansy elves wantin' some mud fer workin' into fairy statues, flashy trinkets, 'n pig sticker arrers then I can get it for ye. Course I'd be lowerin' meself, a good dwarf, ta be diggin' that kinda mush outta the ground, but I can do it fer ya.");
		elseif(e.message:findi("do it for me")) then
			e.self:Say("Arrr. Shaddap. I ain't doin' it til ya bring me somethin'. A fee, I guess ye'd call it, fer lowerin' meself ta elf woman work. Go get me a good strong axe and I'll do it fer ye. Mebbe somethin' with a good tinted polish on it. I got plenty o' axes but no tinted ones. Har har! Colored axe. Somethin' to go with the color left on the blade after I be crackin open a gobbo head.");
		elseif(e.message:findi("ancient")) then
			e.self:Say("The ancient smiths, for what I think yer askin' about, ain't been around fer a long time, laddy. Last anyone heard o' the ancients was 'fore my time even. There be more than a few tales about 'em.");
		elseif(e.message:findi("tales")) then
			e.self:Say("There be some who talk about how the ancient smiths went down to work fer the Duke o' Below, sayin' he be needin' some fine dwarven smiths fer makin' some castle or some such. There be tales that the ancients were so good at smithin' that the Duke took 'em down and made 'em head smiths over his minions. There's even tales that some o' the smiths' souls were trapped in their hammers, stuck there by some necromancer or somethin', as punishment or retribution.");
		elseif(e.message:findi("hammer")) then
			e.self:Say("Aye. Some says their souls were bound into their hammers by an Erudite necromancer and enchanter. They say they used the power of the hammers ta profit by makin' ships, boats, and houses better than any other merchants. Sad tale, if'n it be true.");
		elseif(e.message:findi("necromancer") or e.message:findi("enchanter")) then
			e.self:Say("I'm not knowin' more about the story, lad. Everythin' I know is already in what I said. Aye, Erudites. I suppose if yer wantin' ta run after shortbeard tales ya can look over on that plague island they call Odus.");
		elseif(e.message:findi("rock") or e.message:findi("gem") or e.message:findi("metal")) then
			e.self:Say("Aye, good stuff ta be workin' with.");
		elseif(e.message:findi("arr.*")) then
			e.self:Say("Har, har!  Ooooo!  Arrrrrr!");
		end
	else
		e.self:Emote("will not speak to you.");
	end
end

function event_trade(e)
	local item_lib = require("items");--indifferent or better
	if(e.other:GetFaction(e.self) < 7 and item_lib.check_turn_in(e.self, e.trade, {item1 = 5664},0)) then
		e.self:Say("Arrrrr. Ooooo. Arrrrrr... Yah, now that's what I be callin' a good lookin' axe. I be crackin' a few skulls with this one. Oh, here's yer block o' mud. Our priests o' Brell use the mud pit fer relievin' themselves after really hard ale blessin' ceremonies, so ya ain't got ta be enchantin' it in holy water or anythin' cause they already have. Har har!");
		e.other:QuestReward(e.self,0,0,0,0,20455);
	elseif(e.other:GetFaction(e.self) < 7 and item_lib.check_turn_in(e.self, e.trade, {item1 = 20478},0)) then
		e.self:Emote("examines the hammer respectfully, admiring its craftsmanship. He strikes it against his anvil and winces as a howl fills the air. 'This is one of the ancients' hammers? I can almost, well, almost hear it callin ta me. It's strong, that's fer sure, lad. I don't know how ye got it, but aye, a dwarf could make a mighty blade with this. It's lookin like this thing still has its owner inside it though. I'm not knowin how, and not wantin to know, but fer yer own good ye better find some way ta get 'im out.'");
		e.other:QuestReward(e.self,0,0,0,0,20478);
	elseif(e.other:GetFaction(e.self) < 7 and item_lib.check_turn_in(e.self, e.trade, {item1 = 20485},0)) then
		e.self:Emote("looks at the hammer and nods once before slamming the head against his anvil, and shattering the head. In a cloud of dust, another dwarf appears from the cloud and tosses you a hunk of metal. Kinlo stares in awe.");
		e.other:QuestReward(e.self,0,0,0,0,20482);
		eq.spawn2(67089,0,0,-189.5,346.8,1.8,34.5); -- NPC: Usbak_the_Old
	elseif(e.other:GetFaction(e.self) < 7 and item_lib.check_turn_in(e.self, e.trade, {item1 = 20482},0)) then
		e.self:Say("Erm. Well, I ain't never worked with this stuff but here's what I got for ya. It ain't bad, pretty much like the one ye got there. I suppose ye should take the one the ancient made and show it ta yer friend.");
		e.other:QuestReward(e.self,0,0,0,0,20483);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
