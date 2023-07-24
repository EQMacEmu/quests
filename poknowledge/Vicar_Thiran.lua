--The Magic Pool
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("A dark day to you. New Tanaan has opened its arms to all of Norrath's travelers and scholars alike -- though still I doubt most are worthy of our infinite and unsurpassed knowledge. In any case, we all must uphold the laws of our city, else we become as debased and pathetic as the secular, warring cultures of the material universe. You will find that, despite the medium of our birth or the shadow of faith in our hearts, we are all equally tolerant of each being to approach us. Though I myself am no stranger to the duties of a mentor, I do not think that at this juncture, I would provide any useful assistance to any not of the many clergies associated with the pantheon. If you do indeed serve one of the gods of Nature and Influence, then my services may not prove a waste of our collective time. Search my inventory at your will, and purchase what you wish should you find anything of use to you at this point in your life of service.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 15958})) then--Note From Tarerd
		e.self:Emote("quickly reads the note, and says 'Tarerd wants me to give you that book? I thought he wanted me to keep it secret. Well no matter.' Thiran rummages through the books in front of him. 'Well this is unfortunate. It looks like I loaned my friend the incorrect book. I'm not sure where he's gone off to, here is the book he was looking for. If you happen to run into Jeren Manri anywhere, he'll probably exchange this book for the book on the scrying pools.'");
		e.other:QuestReward(e.self,{itemid = 15959}); --Goblins and Their Religions
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
