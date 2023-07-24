function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What ye want? A torch? I be puttin' that torch some place fer ya if that's what ye want. Right there in that satchel o' yers if I do say meself. Got the best prices, I do, even fer ya outlanders. Mebbe ye should take a gander round me store, ye may be openin' that coin purse then, eh?");
		e.self:DoAnim(48);
	end
end
