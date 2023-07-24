function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. " .. e.other:GetCleanName() .. ".  You have found the only place to purchase liquor in this fine city.  It seems that many of my countrymen do not appreciate liquor as I do.  Fear not if you spill. I have plenty of [skeletal servants] to clean up the mess.");
	elseif(e.message:findi("skeletal servants")) then
		e.self:Say("Can't you see. child?  These dead servants of mine are bussing tables and dancing!  They work incredibly cheaply.  Heh.  Don't try to harm them. though. they don't like that very much. Say. would you like to see something interesting?");
	elseif(e.message:findi("interest")) then
		e.self:Emote("removes a satchel from under the counter. He opens it up to reveal a collection of strange looking tools.  You have never seen their likeness anywhere on Norrath. The Bartender says, 'A traveling merchant sold these to me a while ago. They belonged to one of the ancient Vah'Shir before they were.. removed. They're worth thousands of platinum based on their historical significance alone, but I'll part with them for only 1000. Some collector's item, eh?'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {platinum = 1000}, 0)) then
		e.self:Emote("beams the brightest smile you've ever seen in this dark place at you when you tell him you accept his offer. He quickly hands you the satchel and takes the platinum eagerly. As you leave, you swear you hear chuckle at something.");
		e.other:QuestReward(e.self,0,0,0,0,17062); -- Kejekan Tool Kit
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
