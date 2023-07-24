function event_say(e)
	if(e.message:findi("stanos")) then
		e.self:Say("Come over here, bub. Listen to me, and don't say a word. That name is one that can get you killed. Hanns wants Stanos dead, Renux wants to please Hanns, and everyone else wants to keep their spinal column intact, you know? So, " .. e.other:GetCleanName() .. ", now you can speak. Where did you hear that name, or did you actually see Stanos somewhere?");
	elseif(e.message:findi("highpass")) then
		e.self:Say("Good, you are smarter than you look, " .. e.other:GetCleanName() .. ".  Forget the whole affair.  It's old family business anyway, and you should know better than to get mixed up in family spats; they can be deadly.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
