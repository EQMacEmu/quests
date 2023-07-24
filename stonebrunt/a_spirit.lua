function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("flares brightly as you attempt to speak with it. By listening very closely you're brely able to make out it's frantic whispering. It keep refering to one of the Kejekans, one that apparently slew him as he attempted to cleanse the land of them. It wants nothing more than to destroy who killed him, but it cannot in this [form].");
	elseif(e.message:findi("form")) then
		e.self:Emote("flares brightly again as it explains there isn't enough time for it to explain. It then begins to whisper again, telling you that it commands you the aid it in it's revenge. You make out, through the barely audible whispering, that if you do help it, you will be rewarded.");
	elseif(e.message:findi("revenge")) then
		e.self:Emote("whispers that he will need to become whole again before he can defeat the fool animal that slew him. The spirit admits to one mistake before coming here to wipe the Kejekans. In an earlier campaign, he lost a very powerful weapon. That weapon would enable him to take on a form likened to his former self. If you return this weapon to the spirit, and then help him to defeat his enemy, the reward will be yours.");
	elseif(e.message:findi("campaign")) then
		e.self:Emote("seems hesitant to go into details and reacts harshly when asked further. He does say that he went to enlist an army of lesser beings to do it's bidding, but they refused. The spirit scoffs and says they believed the lord they shared favored them more than it. It goes on, explaining their utter foolishness and eventual demise in great detail. ");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2100}, 0)) then -- Grimy Lance
		e.self:Say("Yes, the lance!' and begins to glow as it draws power from the lance, which now floats in mid air next to the spirit. The form of the spirit expands and takes on a humanoid shape. The air itself then seems to condense about the spirit as bits of matter appear within the glowing form. The bits soon take the shape of bones and ropes of muscle. Within minutes, an emaciated Erudite male stands before you. Despite his frail appearance, he stands upright and strong, a fierce red light burning in his eyes.");
		e.other:QuestReward(e.self,0,0,0,0,2297,1000); -- Idol of Fear
		eq.unique_spawn(100017,7,0,-70,474,509,33.5); -- Ridossan_the_Unliving
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
