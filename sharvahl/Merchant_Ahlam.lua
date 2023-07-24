--Art of Vah Shir Brewing
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello " .. e.other:GetCleanName() .. ". would you care for a drink?  Or perhaps you're the one they sent to help me?  If you've come to help please show me your acrylia slate.");
	elseif(e.message:findi("interested")) then
		e.self:Say("Is that so? I suppose I would be willing to teach you a few things about brewing, but you'll have to show me one of my seals before I begin your instruction.");
	elseif(e.message:findi("purify water")) then
		e.self:Say("Take a bottle to Gamali in Hollowshade Moor. You'll find her somewhere around the Grimling fishing huts if I had to guess. She'll fill the bottle with water for you. Take this water and combine it with the Acrylia sand purifer. That will yield the purest water you ever did drink.");
	elseif(e.message:findi("gravel leaf tea")) then
		e.self:Say("To make the tea you'll need a flask of crystal clear water and some gravel pit leaves. Boil the water in a brew barrel and add the leaves when it's hot. That makes for the strongest dose of the sedative qualities of the tea.");
	elseif(e.message:findi("hollow palm tea")) then
		e.self:Say("You'll need some Crystal water, just as you do with all of our teas, and some Hollow palm roots. You can find Hollow palms out in the moors, watch out for the grimlings though. Once you find the roots just use the strainer to control the flow of water over the leaves. If you do it correctly you'll create a very potent brew. When you get it right bring the strainer back to me with a sample of your work.");
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
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2877})) then
		e.self:Say("Ah good I was hoping you'd be along soon. I need you to collect some Gravel tea leaves from below the city. I need these leaves to make some tea for the guards under the arena. I need 10 of these leaves to brew enough tea for the guards. Take this pouch and fill it with leaves and return it to me.");
		e.other:QuestReward(e.self,{items = {2877,17098}});
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31764})) then
		e.self:Say("Many thanks " .. e.other:GetCleanName() .. ", I'll be going to brew this tea up for the guards now. Take this seal as proof of your helping me. You wouldn't happen to know anyone who would be [interested] in learning the art of Vah Shir Brewing would you? I could really use the help in these hard times, I can barely keep up with all the demand.");
		e.other:QuestReward(e.self,0,0,0,0,31774);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31774})) then
		e.self:Say("Well done, it is now time to start down the path of learning the art of Vah Shir brewing. You'll need a steady hand if you are to master the brew barrel. The first thing you'll need to learn is how to purify the water we use for all our finest brews. Take this Acrylia filter and use it to [purify water]. Bring me 4 flasks of crystal clear water and I'll teach you how to make the tea from the gravel tea leaves.");
		e.other:QuestReward(e.self,0,0,0,0,31760);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31762, item2 = 31762, item3 = 31762, item4 = 31762})) then
		e.self:Say("Very good " .. e.other:GetCleanName() .. ", this water is perfect for making Gravel leaf tea. I've just received a message from Guard Jabbar under the arena needs a shipment of [Gravel leaf tea] to help sedate the prisoners. Fill a crate with bottles of Gravel leaf tea and take it to Guard Jabbar.");
		e.other:QuestReward(e.self,0,0,0,0,17099); -- Item: An Empty Crate
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31775})) then
		e.self:Say("Very good " .. e.other:GetCleanName() .. ", the guards had been waiting for that tea all day. I think you're ready to move on to something a bit more challenging now. Take this strainer, it will allow you to create some very potent brews from some of the more rare herbs to be found near the city. You'll want to start by making some [Hollow palm tea] to get used to how the strainer works.");
		e.other:QuestReward(e.self,0,0,0,0,31768,2000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31769, item2 = 31768})) then
		e.self:Emote("sips the tea. A bit of a glazed look comes across his face. Ahlam says, 'Mmmmm, I do so love Hollow palm tea. This is a bit mild for Hollow palm tea though, you might want to try adding some spices next time for a bit more flavor. Here's your strainer back, I etched some runes into that should add to the potency of your brews. I hear the grimlings make a very potent sort of tea from the grimroot out in the forest, but the thought of drinking anything made from grimroot makes my stomach churn. At any rate, tinker a bit with that strainer and don't be afraid of trying some new brews with it. If you create anything interesting that you think I might like bring it to me so I can taste it.'");
		e.other:QuestReward(e.self,0,0,0,0,31771,2000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31772})) then
		e.self:Say("Great job, here is my seal of approval.  Hand that back in along with your stainer for an upgrade.");
		e.other:QuestReward(e.self,0,0,0,0,31776);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31776, item2 = 31771})) then
		e.self:Say("Here is the Acrylia Handled Strainer.  Use it with regular water to replace the crystal clear water.");
		e.other:QuestReward(e.self,{items = {31776,31777},exp = 2000});
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
