function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey, what do ye think yer lookin' at, ugly? Yeah, that's right. I called ye ugly. You gonna make somethin of it, " .. e.other:Race() .. "? Yeah, I didn't think ye would. The last guy that looked at me wrong took me fist right in his mouth, laid him out flat on the ground! He been drinkin' an' all but he woulda been laid out flat even if he hadna been.");
	elseif(e.message:findi("drink")) then
		e.self:Say("Oh, I don't know what he was drinkin' but I'm sure it were a woman's drink. Me, I like me a nice big barrel o' fish wine. It don't do much fer yer breath but it'll kick ya in the behind if ye're not careful. Hmmm, boy, I could sure go fer one right now. <cough>");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13040}, 0)) then
		e.self:Emote("accepts the drink and gulps it down. 'Thanks, lad! Ye know, I guess ye're all right");
		e.other:QuestReward(e.self,0,0,0,0,0,50);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end