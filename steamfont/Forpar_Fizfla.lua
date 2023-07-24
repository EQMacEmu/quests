--Zone: Steamfont Mountains
--Short Name: steamfont
--Zone ID: 56
--
--NPC Name: Forpar Fizfla
--NPC ID: 56130
--Quest Status: finished

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Get out you pesky " .. e.other:Race() .. "! I don't need any " .. e.other:Race() .. " germs! Out, ye filthy beast!");
	elseif(e.message:findi("mystical instrument")) then
		e.self:Say("I have made many mystical instruments in the past. Each one seemed to be better then the last. I have always had a dream of building the world's best lute, but I have yet to find someone brave enough to gather the components needed to make the instrument.");
	elseif(e.message:findi("components")) then
		e.self:Say("To make a mystical lute I will first need to make several pieces. If you bring me the backbone of an ancient fishman, a strong tentacle from one of the long lost amalgyms, and a petrified skull of a lycanthrope I may be able to create the head and neck of the instrument. If you go out and gather these things, make sure to bring me the note I gave you or I might forget who you are. I am getting quite old, you know.");
	elseif(e.message:findi("next pieces")) then
		e.self:Say("The next pieces are a little harder to come by than the last set. To make the body of an instrument that will last for ages to come, I need something very special. The scales of a big red dragon and the scales of a big white dragon will make it unbreakable, as well as giving it a unique look. Some metal bits will allow me to hold the body together. Please, if you gather up these things, bring them to me as soon as possible. I have not felt this good in years!");
	elseif(e.message:findi("to go")) then
		e.self:Say("The lute has a head and body. The only thing missing is a set of strings that will never break! I have heard rumors of a living dead poison dragon in the lands of Kunark. If your were somehow able to get your hands on his guts, I could finish the lute. You would have to bring me the head, the body and the undead dragon gut for lute strings!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20378}, 0)) then --Note to Forpar Fizfla
		e.self:Say("So you know Vedico! How is the lass? If Vedico would give you the time of day, you must be something special. What can I do for you? I hope you have not come to have me make another [mystical instrument].");
		e.other:QuestReward(e.self,0,0,0,0,20380); -- Forpar's Note to Himself
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20380, item2 = 20524, item3 = 20525, item4 = 5520})) then --Forpar's Note to Himself, Kedge Backbone, Petrified Werewolf Skull, Amygdalan Tendril
		e.self:Say("Wow! I didn't think a " .. e.other:Race() .. " like you would be able to gather all of those things. Forpar rambles around and works with small tools for a good ten minutes before handing you a very fine looking lute head. 'Now, do you want to gather the next pieces for me?");
		e.other:QuestReward(e.self,0,0,0,0,20535); --Mystical Lute Head
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 11602, item2 = 11622, item3 = 16905})) then --White Dragon Scales, Red Dragon Scales, Metal Bits
		e.self:Say("Wooooooo! You are doing a wonderful job, " .. e.other:GetCleanName() .. ". I wish I could go out and gather these things myself.' Forpar sits back down at his desk and pulls several very strange looking tools out. Eventually he looks up at you and says, 'The body is done! Only one more piece to go!");
		e.other:QuestReward(e.self,0,0,0,0,20536); --Mystical Lute Body
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20535, item2 = 20536, item3 = 20526})) then --Mystical Lute Head, Mystical Lute Body, Undead Dragongut Strings
		e.self:Say(" 'Goodness! I can hardly contain myself! This will be my greatest creation ever!' Forpar sits down, slides the lute head into place and screws it together. After a few minutes, he begins to string the lute with the gut strings of the poison dragon. A wonderful sound fills the air as he strums the lute once and hands it to you.'I hope you find a good use for that! I bet you could play it from the mountaintops and the people below would hear you. Thank you, " .. e.other:GetCleanName() .. ", for making my lifelong dream come true!'");
		e.other:QuestReward(e.self,0,0,0,0,20538); -- Mystical Lute
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:steamfont  ID:56130 -- Forpar_Fizfla

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
