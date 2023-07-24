function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("flips through a few pages of a small book, reading intently before answering you. 'Ye scurvy dog. I'll strike yer colors 'fore ya can put me on a gibbet. Take that, ya crimp!' She flips through a few more pages then smiles at you. 'Arrrr!'");
 	elseif(e.message:findi("scurvy dog")) then
		e.self:Say("Hey, that's pretty good. You did it without a book too. Nice to meet you. I'm the bosun here.");
	elseif(e.message:findi("bosun")) then
		e.self:Say("Yup. I think it means I'm in charge of the flag cause that's what the Cap'n told me to take care of. I'm the one who made our symbol, so I get to protect it. I even got my own copy of the grammar manual so I can practice my pirate speech.");    
	elseif(e.message:findi("grammar manual")) then
		e.self:Emote("nods and shows you the book for a moment. 'We don't have many of them and usually we share. My book is missing a chapter, though.'");
	elseif(e.message:findi("chapter")) then
		e.self:Emote("nods. 'A mate of mine borrowed the P Chapter to draw a map on but then he went and got himself lost. I've memorized the rest of the book but that chapter. Oh, well, I guess I can get by with what I have. Walk the mizenmast and batten down the boom!' She looks at you proudly. 'Good, eh? I'm one of the best pirates we have.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30042}, 0)) then
		e.self:Emote("bounces excitedly. 'Oh! I've been needing this!' She reads over the pages intently. 'Uh. Pirate - A sea robber.' She scratches her head. 'I totally forgot we were supposed to be robbing people. Put down yer weapons and hand over yer platinum and gold ya port side bilge suckers! Heh. This is great. Thank you, " .. e.other:GetCleanName() .. "' She grins and goes back to reading.");
		e.other:QuestReward(e.self,0,0,0,0,18962,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

