function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, traveler. If you are headed through these gates you should be aware that there are many [dangers] you may encounter.");
	elseif(e.message:findi("dangers")) then
		e.self:Say("Recently there have been numerous [brigand] encounters. the [Shak Dratha] have also taken arms against our people.");
	elseif(e.message:findi("shak dratha")) then
		e.self:Say("Very little is known about the Shak Dratha. They appeared shortly after the explosion heard in the thicket. Although they are not really our enemies. they have been known to attack when those unknown to them approach.");
	elseif(e.message:findi("brigand")) then
		e.self:Say("The brigands arrived shortly after the disappearance [Loda Kai.] Although it shames me to say it. I believe he may in some way be involved with these attacks. I can not bear to think about such an atrocity. Nevertheless there is a bounty on the brigands.");
	elseif(e.message:findi("loda kai")) then
		e.self:Say("[Loda Kai] was a strong member of the Taruun. he was off to investigate the spirit deaths in shadeweavers thicket when a strong explosion was felt throughout the thickets. He has not been seen since. It was around the time of his disappearance that the brigands began to raid our trade route to shadow haven.");
	elseif(e.message:findi("assigned")) then --Quest: Beetle Eyes
		e.self:Say("Thank you for coming to assist. We are always looking for hungry new soldiers. Young soldiers get old much too fast these days. Just look at me.' He smiles at this comment. 'Do this old soldier a favor and go down there and gather up a handful of rhino beetle eyes', he says and looks at the mass of crawling creatures that wait below. 'Beetle eyes not only taste good... they keep your fur shiny as well.");
	elseif(e.message:findi("spirit")) then
		e.self:Say("Elder spiritist Grawleh has felt numerous spirits call to him in anguish. He fears they are dying and we do not know why.");
	elseif(e.message:findi("barkhem")) then
		e.self:Say("A finer smith has never put hammer to anvil.  We are all lucky to have Master Barkhem forge and maintain our equipment.");
	elseif(e.message:findi("training camp")) then
		e.self:Say("The training camp is located on the cliff behind the Royal Palace.  Younger citizens are encouraged to go there if they wish to build their skills and combat proficiency.  Just find the sergeant and sign up.");
	elseif(e.message:findi("where.* barrel")) then
		e.self:Say("I know many of the taverns and eateries have their own barrels, but you may want to try Jakhal and Kahala's Brewery.  You can find it in the southwestern section of the Merchant's Quarter, or Corridor of Heroes, as I like to call it.");
	elseif(e.message:findi("where.* bank")) then
		e.self:Say("The bank is in the south-eastern end of the Merchants' Quarter.");
	elseif(e.message:findi("where.* merchant.* quarter")) then
		e.self:Say("The Merchants' Quarter lies in the middle of the city just east of the Royal Palace.");
	elseif(e.message:findi("where.* food")) then
		e.self:Say("Take a look around.  If you're hungry, just follow your nose... or look around one of the barracks in either the South or North Gate districts.");
	elseif(e.message:findi("where.* arena")) then
		e.self:Say("You can find the arena in the east side of the city, but it is rarely used these days.  It stands opposite of the pool in the Merchants' Corridor.");
	elseif(e.message:findi("where.* drink")) then
		e.self:Say("If you're looking for a good drink, just look around.  The Taruun tend to frequent Rawlf's Place in the North Gate district of town.  I prefer the busier taverns.  Try the Trail's End just inside the South Gate district.  It is always packed with soldiers moving back and forth to combat.");
	elseif(e.message:findi("where.* forge")) then
		e.self:Say("Hmm... I know that the Khala Dun are fond of smithing. Try looking near their barracks in the western section of the North Gate district.  You can use the forge in Barkhem's shop as well. It's in the Merchants' Quarter.");
	elseif(e.message:findi("corridor.* hero")) then
		e.self:Say("The Corridor of Heroes is the section of town that houses many of our finest establishments.  That area also houses our arena and Hall of Heroes.  The Corridor of Heroes is also known as the Merchants' Quarter.  I hope that I did not confuse you with the name.  Its proper name stems from the fact that you must have served in combat to act as proprietor of a shop in that area.");
	elseif(e.message:findi("hall.* hero")) then
		e.self:Say("The Hall of Heroes was built overlooking the Arena.  The Arena is rarely used these days, but you can almost always find activity in the Hall.  Our greatest leaders and heroes gather there to direct the battle against the Grimling hordes.");
	elseif(e.message:findi("where.* pottery")) then
		e.self:Say("Pottery and other Jharin supplies are located in the northeastern section of the Corridor of Heroes.");
	elseif(e.message:findi("where.* hollowshade")) then
		e.self:Say("The Hollowshade is the moor located just outside of the North Gate. There have been a lot of grimling attacks around that area. Coupled with deadly owlbears and rhino beetles, you had best not go unprepared for a tough battle.");
	elseif(e.message:findi("where.* north gate")) then
		e.self:Say("The North Gate district lies between the Northern Bridge and the inner corridors of our city.  That district houses our many Khala Dun barracks, Officers' quarters, and larger meeting halls.  The North Bridge leads to the Hollowshade Moor.");
	elseif(e.message:findi("where.* south gate")) then
		e.self:Say("The South Gate district lies between the Southern Bridge and the inner corridors of our city.  Many of our Scouts, Animists, and Taruun, live in that district. The South Bridge leads to the Shadeweaver's Thicket.");
	elseif(e.message:findi("the pit")) then
		e.self:Say("We call the crater that was formed around our city during the Shifting, the Pit.  It is full of all sorts of nasty little creatures.  Veteran guards watch the area closely and use it as a place to train our new recruits.");
	elseif(e.message:findi("where.* loom")) then
		e.self:Say("Many of our town's seamstresses and tailors can be found working together on the top floor of the general mercantile.  I'm sure that you can find a loom there.");
	elseif(e.message:findi("where.* mercantile")) then
		e.self:Say("The general mercantile can be found on the southern side of the Corridor of Heroes.  Just look for the sign.");
	elseif(e.message:findi("royal corridor")) then
		e.self:Say("The area surrounding the Royal Palace is known as the Royal Corridor.");
	elseif(e.message:findi("where.* library")) then
		e.self:Say("We have two libraries.  The Library of War History and Related works is located on the southern side of the Royal Corridor and the Library of Spiritual and Natural Studies is located on the northern side.");
	elseif(e.message:findi("where.* arrow")) then
		e.self:Say("If you are looking to purchase arrows, perhaps you should check the South Gate district.  The vendors in that area carry goods that appeal to the Taruun and other scouts that live in that district.");
	elseif(e.message:findi("guildmaster") or e.message:findi("guildhall") or e.message:findi("guild master") or e.message:findi("guild hall")) then
		e.self:Say("We have Guildhalls in several areas.  You can find the Khala Dun under the Arena. The Jharin are housed near the stage above the Royal Palace.  The Taruun, Dar Khura, and Khati Sha are housed near each other in under the Royal Palace.");
	elseif(e.message:findi("who.* khura")) then
		e.self:Say("The Dar Khura guide us with their wisdom. They are the ones who speak with the spirits and heal our wounds. They are named in honor of Dar Khura who taught us that we were brought here for a purpose.");
	elseif(e.message:findi("who.* khati")) then
		e.self:Say("He was a great hero among our people. It was he who learned to speak with the beasts. Khati Sha was the greatest of explorers who brought Acrylia to us. With these mystical stones, we have built our beloved city. Those who walk with the beasts are named in his honor.");
	elseif(e.message:findi("who.* khala")) then
		e.self:Say("The Khala Dun are the king's warriors. They are charged with defending the city of Shar Vahl and commanding any offensives necessary. They are named after Khala Dun who was King Vah Kerrath's protector during the times of the shifting. You can find their guild within the Arena Complex in the merchants quarter.");
	elseif(e.message:findi("who.* taruun")) then
		e.self:Say("The Taruun bring food for our city. They are among the most cunning of our people. The Taruun watch us and protect us from within the shadows. They are named in honor of Taruun, the lost orphan who lived and flourished among our people despite his shy nature. Taruun taught us the importance of stealth with honor. The location of their guild is in the heart of the city. To find it, you must find the delicate balance between honor and battle.");
	elseif(e.message:findi("raja")) then
		e.self:Say("King Raja Kerrath is our beloved and most noble king. He is the son of King Vah Kerrath and the grandson of our most honorable prophet Kejaan.");
	elseif(e.message:findi("ragnar")) then
		e.self:Say("Spiritist Ragnar has an alchemy shop within the Merchants' Quarter. He is a master of Alchemy and a knowledgeable shaman. You cannot miss his shop, it is located right next to the bank.");
	elseif(e.message:findi("shifting")) then
		e.self:Say("These were the troubled times when we were ripped from our world and brought to this soil. Our leader and beloved King Vah Kerrath led us to rebuild this great city and so we have taken his name in his honor.");
	elseif(e.message:findi("grimling")) then
		e.self:Say("The grimlings are the beings who attack our people around the Acrylia mines. They have the ability to use magic against us. Be careful if you wish to travel north. We have been waging war in that area.");
	elseif(e.message:findi("acrylia")) then
		e.self:Say("Acrylia is the magical ore found in the mines to the north. We use this ore to build our homes and weapons. It has been very difficult lately to mine for these stones due to the grimling attacks on our miners.");
	elseif(e.message:findi("shadow haven")) then
		e.self:Say("Shadow Haven is the great city that lies beneath the ground. We have many trading relationships with the houses that form the groundwork of Shadow Haven politics. Use caution when traveling there, although the haven houses many honest merchants, it is also a home to smugglers, bandits, and thieves.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	--Quest: Beetle Eyes (End)
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14587, item2 = 14587, item3 = 14587, item4 = 14587})) then
		e.self:Emote("tosses the beetle eyes into his mouth & attempts to say something to the effect of 'here is your payment.' The sound of crunching gristle & popping eyeballs prevents him from saying it properly.");
		e.other:QuestReward(e.self,3,3,0,0,0,1000);
	end
	-- takes repair order from master Barkhem
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29803})) then
		e.self:Say("Outstanding! Nothing like a sharp-looking shield to scare off the undesirables. And if you bring it back full of food I wouldn't complain either,");
		e.self:Emote("laughs, flashing a mischievous grin your way.");
		e.self:Say("Just kidding! You have much to do and Barkhem would have my hide if I kept you from your studies.");
		e.other:QuestReward(e.self,0,0,0,0,29813);
	end
	-- You receive Bokh's Dented Shield. Take the dented shield and place it into a forge with your Vah Shir Apprentice Mallet. This creates Bokh's Immaculate Shield (the mallet will be returned). Give this shield back to Jasir to receive Bokh's Work Order.
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29814})) then
		e.self:Say("Well done, shiny enough to eat off of. My compliments to you " .. e.other:GetCleanName() .. ", Barkhem would be most pleased.");
		e.other:QuestReward(e.self,0,0,0,0,29815);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
