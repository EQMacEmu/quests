function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". I am Mignah, a humble acrylia specialist. If you have a form of acrylia that merchants will not buy please hand it to me and I will pay you whatever it may be worth.");
	elseif(e.message:findi("acrylia slate")) then
		e.self:Emote("pulls a smoldering piece of forged acrylia from a nearby oven and, before you can react, presses your hand into the still soft metal. 'This may hurt a bit, but it'll heal.' He then etches your name and the date into the slate and plunges it into a bucket of water before placing it into your stinging palm.");
		e.other:SummonCursorItem(2876); -- Acrylia Slate
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
