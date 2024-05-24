function event_say(e)
	if(eq.is_the_shadows_of_luclin_enabled()) then
		if(e.message:findi("hail")) then
			e.self:Say("It's nice to meet you " .. e.other:GetCleanName() .. ". Allow me to introduce myself. I am Lendel Deeppockets master Assassin of Rivervale. I am personally in charge of all [training] we have the new recruits go through before they are sent out on specific missions.");
		elseif(e.message:findi("stanos")) then
			e.self:Say("Stanos is an old... <cough>... buddy of mine.  If yer looking for work, ya could take a message from me to him.  Just tell him I sent ya, and see what he wants.  But I gotta warn ya, he has more than a few fellers what want him dead, and anyone around him, too.  Other side of the coin, he pays well and is fair, and looks after his own.  Yer choice, you want the job or not?");
		elseif(e.message:findi("want.* job")) then
			e.self:Say("You're a spunky one, eh, " .. e.other:Race() .. "!  Ok, first off, you gots to find him.  Just tell him I sent you to help, and he should take it from there.  Ya might want to check the Karanas, I think he's been spotted around there lately.");
		elseif(e.message:findi("training")) then
			e.self:Say("There are many steps that a young rouge must take on the road to stealth. The most important part of your training is learning how to use the tools around you such as the forge. From the looks of you I can tell you could use some more [enchanted armor] as well so I think this would be a good learning experience.");
		elseif(e.message:findi("enchanted armor")) then
			e.self:Say("I am pleased to hear that you are interested in making your own armor " .. e.other:GetCleanName() .. ". I have some instructions for you so please listen closely. First, I will present you with your Dusty Mail Assembly kit when you are ready. After that, simply tell me what piece of Slickfinger Chainmail you [want] to craft and I will give you a pattern along with a recipe for  [Coifs], [Bracers], [Sleeves], [Boots], [Legplates], [Gauntlets] and [Tunics]. The recipe I will give you for specific items will need to me combined in the assembly kit to create the magical material necessary. Once you have this material and pattern that I gave you when you told me what item you wanted to craft, put both in the nearest forge to create the armor piece you asked for. Here is your Dusty Mail Assembly Kit.");
			e.other:SummonCursorItem(17247); -- Dusty Mail Assembly Kit
		elseif(e.message:findi("coifs")) then
			e.self:Say("Protecting the ole noggin is probably the smartest move you will make young " .. e.other:GetCleanName() .. ". Here is your pattern, once you have combined 2 Bricks of Crude Iron Ore, 2 Ruined Thorn Drakeling Scales and 1 Carrot in your kit place it in a forge along with this pattern to create your Slickfinger Chainmail Coif.");
			e.other:SummonCursorItem(22671); -- Enchanted Coif Pattern
		elseif(e.message:findi("bracers")) then
			e.self:Say("Go out into the thicket and seek out 1 Brick of Crude Iron Ore, 1 Shattered Warbead, 1 Large Yellowjacket Sternite and 1 Milk. Once you have combined them in your kit to fashion the bracer material take it to a forge along with this pattern to create your Slickfinger Chainmail Bracer.");
			e.other:SummonCursorItem(22672); -- Item: An Enchanted Bracer Pattern
		elseif(e.message:findi("sleeves")) then
			e.self:Say("If sleeves are what you wish to craft you will need to collect 3 Bricks of Crude Iron Ore, 3 Honeycombs, 2 Thorn Drakeling Scales and 2 Grapes then combine them in your kit to fashion the necessary material. Take this pattern to the nearest forge with that material to create your Sleeves of the Slickfinger.");
			e.other:SummonCursorItem(22673); -- Item: An Enchanted Sleeves Pattern
		elseif(e.message:findi("boots")) then
			e.self:Say("Boots you say " .. e.other:GetCleanName() .. "? Well I think I heard you right but I had to check. Make sure you only wear your boots in case of emergency. All other times you should showcase your feet to the world with pride. You will need to combine 2 Bricks of Crude Iron Ore, 2 Fire Beetle Eyes and 2 Giant Thicket Rat Skulls in your kit to fashion your Slickfinger Boot Material. Once you have done this take the material to a forge along with this pattern to create your Slickfinger Chainmail Boots.");
			e.other:SummonCursorItem(22674); -- Item: An Enchanted Boots Pattern
		elseif(e.message:findi("legplates")) then
			e.self:Say("I must say that pants are a good idea young " .. e.other:GetCleanName() .. ". Please gather 4 Bricks of Crude Iron Ore, 2 Spiderling Eyes, 2 Large Wood Spider Tarsus, 1 Bottle of Kalish and 1 Ruined Wolf Pelt then combine them in your kit to create your Legplates Material.");
			e.other:SummonCursorItem(22675); -- Item: An Enchanted Legplates Pattern
		elseif(e.message:findi("gauntlets")) then
			e.self:Say("Your gauntlets may possibly be the most important part of armor. One should always be sure that their hands are not exposed, because taking a blow to the hand is a lot worse then getting hurt anywhere else! To create the gauntlet material please collect 3 Bricks of Crude Iron Ore, 2 Bixie Wings, 1 Large Snake Skin and 1 Red Wine.");
			e.other:SummonCursorItem(22676); -- Item: An Enchanted Gauntlets Pattern
		elseif(e.message:findi("tunic")) then
			e.self:Say("I'm happy to see that your training is coming along so well " .. e.other:GetCleanName() .. ". I have no doubt in my mind that you are ready to craft your tunic. Please collect 5 Bricks of Crude Iron Ore, 1 Giant Wood Spider Femurs, 1 Embalming Dusts, 1 Dark Elf Skin and 1 Giant Yellowjacket Thorax. Come back after you are finished. I have a [job] for you.");
			e.other:SummonCursorItem(22677); -- Item: An Enchanted Tunic Pattern
		elseif(e.message:findi("job")) then
			e.self:Say("Orcs is the job " .. e.other:GetCleanName() .. ". Plain and simple I cannot stand these homewreckers. They have moved into our land and continue to storm our front gate. I seek out bone fragments and fractured jawbones from these nasty Orcs. Once we have 1 of each we will be able to create a weapon for you to use.");
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("It's nice to meet you " .. e.other:GetCleanName() .. ". Allow me to introduce myself. I am Lendel Deeppockets master Assassin of Rivervale."); -- made up text
		elseif(e.message:findi("stanos")) then
			e.self:Say("Stanos is an old... <cough>... buddy of mine.  If yer looking for work, ya could take a message from me to him.  Just tell him I sent ya, and see what he wants.  But I gotta warn ya, he has more than a few fellers what want him dead, and anyone around him, too.  Other side of the coin, he pays well and is fair, and looks after his own.  Yer choice, you want the job or not?");
		elseif(e.message:findi("want.* job")) then
			e.self:Say("You're a spunky one, eh, " .. e.other:Race() .. "!  Ok, first off, you gots to find him.  Just tell him I sent you to help, and he should take it from there.  Ya might want to check the Karanas, I think he's been spotted around there lately.");	
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18732})) then -- Tattered Note
		e.self:Say("HA! I asked that fool Denry to send me a professional, and this is what I get?!? Oh diddlepicks! That crotchety old coot never liked me anyway. And after all I've done for him! Hrrmf! Ah well, let's get you started and see what ya got, huh, kid? Here, wear this. Maybe I'll have Toelia break you in, huh? Yeah, that'll work! Go find her, and she'll put you to work. Just remember, we all earn our keep around here, or else it's back to hay farm for you! Oh yeah, tell her you're the [new dishwasher] so she knows you are on the level.");
		e.other:Faction(e.self,241,100,0); -- Deeppockets
		e.other:Faction(e.self,223,5,0); -- Circle of Unseen Hands
		e.other:Faction(e.self,292,-5,0); -- Merchants of Rivervale
		e.other:Faction(e.self,336,5,0); -- Coalition of Tradefolk Underground
		e.other:Faction(e.self,329,5,0); -- Carson McCabe
		e.other:QuestReward(e.self,0,0,0,0,13539,20); -- Old Brown Vest*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 22693,item2 = 22694})) then -- missing quest reward dialogue?
		e.other:Faction(e.self,241,10,0); -- Deeppockets
		e.other:Faction(e.self,223,1,0); -- Circle of Unseen Hands
		e.other:Faction(e.self,292,-1,0); -- Merchants of Rivervale
		e.other:Faction(e.self,336,1,0); -- Coalition of Tradefolk Underground
		e.other:Faction(e.self,329,1,0); -- Carson McCabe
		e.other:QuestReward(e.self,0,0,0,0,22695,20); -- Dirk of the Slickfinger
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	e.self:Say("Find somebody to go see what he wants. I don't like the idea of making Hanns mad at us, but I also don't like the idea of looking over my shoulder for Stanos. He is not somebody I would care to dance with, and I DO owe him.");
end

-- END of FILE Zone:rivervale  ID:19066 -- Lendel_Deeppockets
