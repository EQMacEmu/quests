function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings child, what business do you have here? I'm sorry but I will only deal with Clerics that are willing to prove their loyalty to Innoruuk. I cannot deal with every single heathen that feels it is necessary to bid me a good day. If you are a [Cleric of Innoruuk] I might be able to aid you in your training.");
	elseif(e.other:GetClass() == 2 and e.other:GetRace() == 6) then
		if(e.message:findi("cleric of innoruuk")) then
			e.self:Say("Is that so " .. e.other:Race() .. " " .. e.other:GetCleanName() .. ". Well from the looks of you I wouldn't say you are much of anything yet. However, if you have the willingness and determination to serve your God then there might just be more hope for you then I would have thought. Obviously, to move forward in your training, you will need to shield yourself from your enemies and from the elements. I believe I have something that could help you if you are still [interested in proving yourself]");
		elseif(e.message:findi("interested in proving myself")) then
			e.self:Say("Well I must say that I am impressed by your eagerness to learn, however, you are not the first and will not be the last I am sure that has sworn devotion to our Lord Innoruuk. Lets just hope you don't end up in the burial grounds where many promising young ones before you have found their resting place. If you are ready to begin gathering items to fashion your very own Initiate Darkpriest Armor then I will present you with a [magical relic].");
		elseif(e.message:findi("magical relic")) then
			e.self:Say("I have a box that I have been keeping for quite some time and have been waiting to present it to someone like yourself. Someone that I had faith would be strong enough to use it's power to their benefit. This magical box can be used to refine certain metals into a magical compound that is used in crafting Initiate Darkpriest armor pieces. I have the molds necessary to craft Initiate Darkpriest [Helms], [Bracers], [Boots], [Armguards], [Greaves], [Gauntlets] and [Breastplates]. However there are some [important items] that you will need to collect before the molds will be of any use to you. One thing to keep in mind is that I suggest you craft your Breastplate last due to the difficulty of obtaining the items needed for that specific recipe.");
			e.other:SummonCursorItem(17245); --Dark Blessed Box
		elseif(e.message:findi("important item")) then
			e.self:Say("There are certain items that will need to be gathered in our great city of Neriak along with many different things gathered outside in the Forest of Nektulos, where most of your training will take place. The most important component that you will need to collect while adventuring in the forest are Helms that are only worn by Priests of Rodcet Nife. These vile creatures have set up camp in the forest from what I have heard and it is your responsibility to find and execute them. These helms will be your most important component that you will gather because it is used in all [armor recipes] as the metal that you will forge your armor with.");
		elseif(e.message:findi("armor recipe")) then
			e.self:Say("Ah of course, I almost forgot that you will need to know what items to combine in the Dark Blessed Box that I presented you with. Simply tell me the armor piece that you wish to craft and I will give you the list of items that you will need to combine, along with the applicable mold. For example, should you want to craft a Helm first you would say, I want to craft a Initiate Darkpriest`s Helm. Please remember that the exact items must be combined in exact quantities in the box or the infusion will not take place. After you have combined together the items necessary to infuse your metal the correct way, you will need to take the Refined sheet of Holy Metal to the nearest forge and combine it with the correct mold to yield your armor piece.");
		elseif(e.message:findi("armguard")) then
			e.self:Say("Excellent " .. e.other:GetCleanName() .. "! To create the correct compound in your Dark Blessed Box that will be need to be placed into a forge with this mold to craft your Initiate Darkpriest's Armguards you will need to collect and combine the following items. 3 Helms of the Lifebringer, 1 Garter Snake Tongue, 2 Ash Drakeling Scales and 2 Grapes.");
			e.other:SummonCursorItem(22613); --An Enchanted Armguard Mold
		elseif(e.message:findi("boot")) then
			e.self:Say("I would definitely agree that you will need some decent Boots if you wish to last long in any extreme climates like Lavastorm! Combine 2 Helms of the Lifebringer, 2 Fire Beetle Legs and 2 Flasks of Water to fashion the correct Refined sheet of Holy Metal. Once you have done this place the Refined sheet of Holy Metal along with this mold in any forge to craft your Initiate Darkpriest's Boots.");
			e.other:SummonCursorItem(22612); --An Enchanted Boot Mold
		elseif(e.message:findi("bracer")) then
			e.self:Say("To fashion your own Initiate Darkpriest's Bracer you will need to collect 1 Helm of the Lifebringer, 1 Orc Scalp, 1 Snake Egg and 1 Red Wine. Combine these in your box to create the correct Refined sheet of Holy Metal that you will place in any forge along with this mold to craft your Initiate Darkpriest`s Bracer.");
			e.other:SummonCursorItem(22611); --An Enchanted Bracer Mold
		elseif(e.message:findi("breastplate")) then
			e.self:Say("So, the time has come for you to gather the items necessary for your most important piece of Armor Branaddar. You will need to combine 5 Helms of the Lifebringer, 1 Deathfist Templar Scalp, 1 Embalming Dust, 1 Matted Halfling Hide and 1 Woven Grass Amulet. Once you have prepared this final Refined sheet of Holy Metal place it in a forge along with this mold to craft your Initiate Darkpriest's Breastplate. After you have done this return to me when you are ready for your final test of loyalty.");
			e.other:SummonCursorItem(22616); --An Enchanted Breastplate mold
		elseif(e.message:findi("gauntlet")) then
			e.self:Say("To fashion your own Initiate Darkpriest's Gauntlets you will need to collect 3 Helms of the Lifebringer, 1 Halfling Blood, 1 Leatherfoot Raiders Skullcap, 1 snake scales and 1 glass shard. Combine these in your Box to create the correct Refined sheet of Holy Metal that you will place in any forge along with this mold to craft your Initiate Darkpriest's Gauntlets.");
			e.other:SummonCursorItem(22615); --An Enchanted Gauntlet Mold
		elseif(e.message:findi("greave")) then
			e.self:Say("Take this mold " .. e.other:GetCleanName() .. ". You will need to place this in a Forge along with the correct Refined sheet of Holy Metal to craft your Initiate Darkpriest's Greaves. The correct Refined sheet of Holy Metal for these greaves can be fashioned by combining 4 Helms of the Lifebringer, 2 Spiderling Eyes, 2 Deathfist Legionairre Scalps and 1 bottle of kalish.");
			e.other:SummonCursorItem(22614); --An Enchanted Greave Mold
		elseif(e.message:findi("helm")) then
			e.self:Say("A Helm you say " .. e.other:GetCleanName() .. "? This should be a good test for you to see if you are able to gather the correct items and annihilate those disgusting clerics that follow that worthless God Rodcet Nife. Seek out 1 Helm of the Lifebringer, 1 Low Quality Wolf Skin, 1 Black Mamba Skin and 1 Short Ale. After you have combined these in your Dark Blessed Box take your Refined sheet of Holy Metal along with this mold to the nearest forge to craft your very own Initiate Darkpriest`s Helm.");
			e.other:SummonCursorItem(22610); --An Enchanted Helm Mold
		elseif(e.message:findi("final test")) then
			e.self:Say("Well, I must say that I did not expect you to progress in your training at the rate you have. I also knew there was something that separated you from our other initiates. For your final test, I will need you to collect journal pages from the Ultricle. Provide me with three journal pages to receive your reward. You have come too far to fail me now. I hope to see you soon...alive, that is.");
		end
	else
		e.self:Say("I'm sorry but I will only deal with Clerics that are willing to prove their loyalty to Innoruuk.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 22617, item2 = 22618, item3 = 22619})) then
		e.self:Say("Let it be known that on this day " .. e.other:GetCleanName() .. ", you have proven both your devotion to I Alexandriana High Priestess of Neriak and the dark Lord Innoruuk. Pride yourself in being one of the youngest clerics that is able to draw the power of Innoruuk to call the dead back to where they have fallen. Take this mace " .. e.other:GetCleanName() .. ", you have most certainly earned it.");
		e.other:QuestReward(e.self,0,0,0,0,22698); --Mace of the Darkpriest
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
-- Quest by Blaz - Dark Elf Cleric Newbie Armor quests

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
