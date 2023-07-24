function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("stares at you through bleary eyes.  'I get enough conversation from my wife.  If ya want water or biscuits, buy em!  Otherwise, leave me alone!'");
	elseif(e.message:findi("conversation")) then
		e.self:Say("Since ya like talkin', then fine. You wanna do me a favor? Go get me some wolf fur earmuffs so I don't gotta listen to ya, or her, any more.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 25104}, 0)) then
		e.self:Say("Uhhh, thank you... Now I can uhh... work on fixing some things around... 'seems to nod off for a moment as he drops a small note on the ground.'");
		e.other:QuestReward(e.self,0,0,0,0,20474);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30037}, 0)) then -- Wolf Fur Earcovers
		e.self:Emote("stares at you and then laughs before putting on the earmuffs.  As he moves around, blissfully protected from noise, a fine chain slips from his coat.  'Hey!  Look at that!  What a fine chain.  It looks familiar but I can't tell how.  Oh, well, you can have it.  It looks like it could be used to fill gaps or if needed to repair another similar metal object.  I can do that if ya ever find need.'");
		e.other:QuestReward(e.self,{itemid = 30038}); -- Fine Gold Chain
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30057,item2 = 30038})) then -- Golden Broken Key and Fine Gold Chain
		e.self:Emote("puts a tiny eyeglass up to his eye and studies the key and chain.  'Aye.  This looks like the perfect metal to fix this key.  Gimme just a moment.'  He uses fine and minute tools to pick and push the chain and key over a fire.  'Ha!  Don't say I ain't never done anythin' for ya.  There ya go, " .. e.other:GetCleanName() .. ".'");
		e.other:QuestReward(e.self,{itemid = 30040}); -- Rum Box Key
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
