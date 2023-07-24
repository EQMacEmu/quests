function event_spawn(e)
	eq.set_timer("depop",390000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Where am I? Oh god no, please let this be a simple nightmare. Please don't hold my withering soul here any longer!  Who are you? Why have you freed me? Please tell me it is over!");
	elseif(e.message:findi("soul")) then
		e.self:Emote("looks about the corridor, paranoia gelaming in his ghostly eyes. He stammers out, 'she's trapped me soul here in her acursed tower. Don' speak too loudly or she'll hear ye. When me mad form is destroyed i am free fer a short time, only to remember me life as it once was and the fate i now endure. unfortunately i be doomed to this existence forever. Tell me before i am pulled away again, why have ye freed me?");
	elseif(e.message:findi("arcanum of rosh")) then
		e.self:Say("I can never give up the Arcanum. It's bound to me, is a part of me now. It represents the sacrifice I made to me friends.  It be the only thing that brings me any sliver of happiness. Only if ye kin replace it with somethin' of sentiment to me will I hand over the book.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1711}, 0)) then -- Lock of Dwarven Hair
		e.other:QuestReward(e.self,0,0,0,0,1712,1000); -- Arcanum of Roth
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	e.self:Emote("suddenly clasps his hands over his ears and wails. he begins to fade away until all that is left is the echo of his tormented screams.");
	eq.depop();
end