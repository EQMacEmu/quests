function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hrmm? Oh, hello there, " .. e.other:GetCleanName() .. ". I have to say, Norrath getting closer lately has been pretty to watch, but now that thrill has worn off, it really gets in the way of seeing the stars behind it. Trying to divine the will of spirits from astral patterns and nebular activity is a lot easier without a planet in your face,");
	elseif(e.message:findi("drop of moonlight")) then
		e.self:Say("'Under normal circumstances I am happy to sell a drop of moonlight- it is one of the few ways for an Astrologer to make any money,' she chuckles. 'Problem right now is that my telescope is out of commission and trying to harness a drop of moonlight without a telescope is rather akin to trying to catch a fish with your bare hands, know what I mean?' Laughing heartily at her own joke, she continues, 'Anyway, if you want, I would be happy to trade you a fresh drop of moonlight for a new reflective shard. You may need to head to the Geerloks in Katta for one though, I do not believe anyone sells them locally.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 16860})) then
		e.self:Emote("inspects the shard, 'This is perfect, " .. e.other:GetCleanName() .. ", thank you. I will fit this into my telescope as soon as I get home, here is the drop of moonlight that I promised you. Good luck, my friend' she says with a bow.");
		e.other:QuestReward(e.self,0,0,0,0,5992);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
