function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ahh, hello there, " .. e.other:GetName() .. ".  I am a trader from Sanctus Seru trying to make my way to Shadowhaven for some dealings.  I have come this far with the aid of guards from Sanctus Seru, but they have turned back and left me to go on my own.  I hear there are many terrible [creatures] here lurking in the shadows, leave it to the guards of the Hand to leave me unprotected.");
	elseif(e.message:findi("creatures")) then
		e.self:Say("What I was told is that this pass is filled with small horrible creatures with no eyes.  Perhaps you could [help by providing safe passage] to the other side?");
	elseif(e.message:findi("safe passage")) then
		e.self:Say("Great!  If I can get safely to the other side I will give you a small trinket that I was going to sell.  Getting safe passage for the rest of my goods is worth more than the item in itself.  Surely you know a good deal when you hear one.  Take this note, if you agree to the conditions that I get across safely before you get payment return it to me and we will be on our way.");
		e.other:SummonCursorItem(5982);
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5982}, 0)) then
		e.self:Say("Let us go then, please be alert throughout the cavern.  Once we get to the other side safely give me the signed agreement and you will have your payment.");
		e.other:QuestReward(e.self,0,0,0,0,5983);
		eq.unique_spawn(161008,43,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
