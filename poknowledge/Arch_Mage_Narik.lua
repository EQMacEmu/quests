--Willamina's Needles/Planar Armor Exchange/Magician Tomes

function event_say(e)
	if(e.message:findi("Hail")) then
		if(e.other:Race() == "Dark Elf" or e.other:Race() == "Iksar" or e.other:Race() == "Troll" or e.other:Race() == "Ogre" or e.other:Class() == "Shadowknight" or e.other:Class() == "Necromancer") then
			e.self:DoAnim(26);
			e.self:Emote("raises a brow and gives an emotionless stare of objective study toward " .. e.other:GetCleanName() .. ", 'You seem out of place -- perhaps lost. The district of Kartis is not far from here and I believe you would be received more properly among your own kind of the shadows. Do not take offense to this suggestion, for that is merely all it is. Though we of Tanaan are beings of pure and strict neutrality, regarding zealous boasting of both light and darkness to be counter productive to the natural order of knowledge and enlightenment, that does not necessarily mean you are wholly unwelcome among us. However, if you choose on remaining in our district for a time, do be careful when you choose to return to Norrath. The devices here would likely take you to a place of your demise.'");
		else
			e.self:DoAnim(48);
			e.self:Emote("gives a gentle smile and polite bow of respect to " .. e.other:GetCleanName() .. ", 'Greetings and welcome to the district of Tanaan, traveler. This place of neutrality is quite content to have you among us, learning from us what we humbly can teach you. Many adepts who were adventurers not too different from yourself have stepped forward and offered their memories as present lessons to those willing to learn of them. I myself was a master of the elements in my time, though I do not make this declaration as one that craves due respect for the title. Rather, I hope that you may perhaps be of the same path and if you need tutoring in the way of skills, then I would be more than pleased to oblige your needs.'");
		end
	elseif(e.message:findi("jewel")) then
		e.self:Emote("slams his book shut. 'So, the snake has legs after all! Tell Onirelin if he wants this back, he can come here himself and kiss my. . ., no wait. I have a better idea.' He draws closer and whispers, 'Did Onirelin tell you why I took this jewel? I did it in response to him taking my lady love, Elisha Dirtyshoes. We were to be married until she ran off with him. However, she also ran off with my engagement ring I gave to her. It is quite valuable to me, and I would be most happy to have it back. If you can procure it from her, I'll give Onirelin his jewel back. He's suffered long enough, I think.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local count = item_lib.count_handed_item(e.self, e.trade, {1239, 1240, 1241, 1242, 1243, 1244, 1245}); --Apothic Armor
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28087})) then --Narik's Ring
		e.self:Say("This is truly excellent. You have done well recovering this for me. You may take Onirelin's jewel and also tell him never to set foot near me again. Leave me now, I have much work to do.");
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,0,0,0,28088,100); --Onirelin's Jewel
	end
	
	if(count > 0) then
		repeat
			e.self:Say("Thank you, " .. e.other:GetCleanName() .. "."); --Text made up
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),300000); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
			count = count - 1;
		until count == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
