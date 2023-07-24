function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, kind sir! Please rescue me. I am a princess and can give you a generous reward. First, talk with a high elf named Tearon. He should have something for you that will help me to escape.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
