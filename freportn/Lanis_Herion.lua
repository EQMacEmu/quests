function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. "! I hope you are following the teachings of the Queen of Passion, Erollisi Marr. The ways of love are many and shall warm the souls of all.");
	elseif(e.message:findi("heal")) then
		e.self:Say("It is not my duty to see to the wounded. You must seek out Plur Etinu. He is in here somewhere.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end