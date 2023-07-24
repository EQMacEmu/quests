--Tome of Dark Power
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("regards you with narrow eyes, then smiles. 'Greetings. I am Councilman Srethix of Kartis. It is good to see some new visitors to our little corner of the cosmos. I certainly hope you can find what you are looking for here in the Myrist library. Unfortunately, I'm sorry to say that I am quite busy seeking some rare books at the moment, and I do not have much time for light conversation. Otherwise, I believe my aid Garuuk may have some chores he could use help with. That is, if you feel up to it.'");
	elseif(e.message:findi("rare books")) then
		e.self:Emote("glares at Garuuk and turns back to you. 'You are interested in a job seeking knowledge, yes? Very well, I think I may have something suitable for you. I happen to be seeking an ancient tome containing some valuable information about artifacts of power. I have learned this book is somewhere in our very own library but so far Garuuk has been unable to locate it. Find me the Tome of Dark Power and I may see what other jobs I can pass along to you.' ");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28741})) then--Locked Tome of Dark Power
		e.self:Say("Very impressive, this little tome has eluded my aid for quite some time now. How good of you to discover its whereabouts and bring it to me. But from the looks of it, this book has a strong, magically-sealed lock upon its cover. I wonder if Elder Tal Almad would know how to break it? Take this to him in the Plane of Tranquility and let him have a look at it. If he can open it, bring it back to me.");
		e.other:QuestReward(e.self,0,0,0,0,28741); --Locked Tome of Dark Power...yes, he hands it right back.
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 28742})) then--Unlocked Tome of Dark Power
		e.self:Say("It's good to see my instincts about the Elder were correct.' He opens the book, begins thumbing through the pages, and frowns. 'What's this? Some pages are missing, eight of them to be exact. I'm afraid this book will be of no use to me without those pages. You can have it. I wonder what happened to them, whomever had this book before must have removed them for some reason. If you find the missing pages somewhere, be sure to close them up inside the book and return it to me.");
		e.other:QuestReward(e.self,0,0,0,0,17182)--Unfinished Tome of Dark Power
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 28746})) then--Tome of Dark Power
		e.self:Emote("grins wickedly. 'You have done excellently. The tome will now serve my purposes. You may take this as a reward.' He pauses for a moment and continues, 'This task you have performed shows your confidence, patience, and the best of all, determination. Perhaps someday you would consider applying yourself to serve as an aid by my side? I can clearly see you have quite a broad spectrum of usefulness. Much more so than some other attendants I know...'");
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,0,0,0,15790,1000000)--Cloak of the Wise
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
