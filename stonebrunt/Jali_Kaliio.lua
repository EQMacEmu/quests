function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Say("Greetings outsider. I trust you have [peaceful intentions] while visiting our village?");
		else
			e.self:Say("You have done much to anger the spirits thus you are not accepted by our people.");
		end
	elseif(e.message:findi("peaceful intention")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Say("That is good to hear. Those filthy kobolds have caused enough trouble. We do not need more enemies.' Jali turns around and glances at another Kejekan. This one seems somewhat ill. Her fur is coming out in patches and strange sores cover her body. 'That is my wife, Yuio. She has come down with a sickness, no doubt caused by those accursed kobolds.' Anger wracks Jali's face as he speaks. 'I would ask you for [help] but you are a stranger and owe us nothing. Of course if you did assist me, I would be forever grateful.");
		else
			e.self:Say("You have done much to anger the spirits thus you are not accepted by our people.");
		end
	elseif(e.message:findi("help")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Say("Oh thank you. You are most kind. I fear that there is not much time left for my dear Yuio. Please speak to [Khonza Ayssla]. She is most wise and perhaps can find some cure for this affliction.");
		else
			e.self:Say("You have done much to anger the spirits thus you are not accepted by our people.");
		end
	elseif(e.message:findi("khonza ayssla")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Say("Khonza Ayssla is the village's High Shaman. She teaches the ancient ways of Okanjo and is most wise. If she cannot assist you I do not know who can. I would go myself but I am too worried to leave my dear wife behind. When you find Khonza, tell her that Jali sent you. Please hurry, friend!");
		else
			e.self:Say("You have done much to anger the spirits thus you are not accepted by our people.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= -200 and item_lib.check_turn_in(e.self, e.trade, {item1 = 6976}, 0)) then
		e.self:Say("Khonza Ayssla gave this to you? We must try it at once then.' Jali opens the vial and gently tilts back Yuio's head. He pours the liquid into her mouth and waits. Miraculously, Yuios fur begins to take on a healthy sheen and the sores begin to disappear! Yuio falls into Jali's arms then goes slack, passing out. 'She needs much rest. I cannot begin to thank you enough for helping us. Please accept this as a reward. It is not much but it should be of some use. You are indeed a friend of ours and if you ever need shelter from the wilds, please visit us again.");
		e.other:Faction(e.self,5011,5); -- Faction: Kejek Village
		e.other:Faction(e.self,298,1); -- Faction: Peace Keepers
		e.other:QuestReward(e.self,0,0,0,0,6952,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
