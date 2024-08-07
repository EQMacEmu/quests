function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What are you doing in here? I requested no room service. Now leave, quickly, before Mistress Anna comes!");
	elseif(e.message:findi("anna")) then
		e.self:Say("Mistress Anna is my lover. She will wed me as soon as she is through mourning the loss of her ex-lover. Until then, I shall continue to keep her well. She assures me she will be over it soon. I am sure she loves me. She meets with me often. 'At 9 in 6,' she always says.");
	elseif(e.message:findi("princess lenya")) then
		e.self:Say("What was that about Princess Lenya? You know her? I feel sorry for her. I wish I had the courage to help her. I made the key for her special shackles. Maybe you can rescue her. Tell you what, I have always wanted to venture to Qeynos to buy a silk evening tunic for Mistress Anna. You go and get me it and I shall give you the key to Princess Lenya's shackles.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13352})) then -- Silk Evening Tunic
		e.self:Say("Ahh!! The silk evening tunic. Mistress Anna will look stunning in this. Here is the key to Princess Lenya's cell. Good luck, hero!");
		e.other:Faction(e.self,331, 5,0); -- Merchant of Highpass
		e.other:Faction(e.self,332, 5,0); -- Highpass Guard
		e.other:Faction(e.self,329, 5,0); -- Carson McCabe
		e.other:QuestReward(e.self,0,0,0,0,20008,500); -- Brass Key
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
