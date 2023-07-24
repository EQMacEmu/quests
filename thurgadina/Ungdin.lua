-- Velium Retreival

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Uuuuhhh, how goes it, " .. e.other:Race() .. "? Oh, I'm doin' jest fine down here, just hanging around... Mining! Yes mining for our fearless leader, the Dain. Yessiree... sssoooooo...");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Hmmm, not sure why you're giving me all this. <cough> 50 pieces <cough> of platinum <cough> Whew, wow, I may be coming down with <cough> and the note <cough> something.";

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1725, platinum = 50},1,text)) then
		e.self:Emote("darts his eyes about the room before retrieving a large box from under the table. He takes the platinum and the note, then hands you the box without a word.");
		e.other:QuestReward(e.self,0,0,0,0,29064);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
