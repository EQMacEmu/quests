function event_spawn(e)
	eq.set_timer("fishing",94000);
end

function event_say(e)
	if(e.message:findi("pot of gold") or e.message:findi("pot o gold")) then
		e.self:Say("Pot o` gold? Bwahahahaha! Only pot around is them ones I warsh my clothes in. Gotta be careful though, one time I dropped one of dem woids of wealth in and BADABING no clothes jus a stinkin coin that wouldn't buy me a fishin grub.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6876}, 0)) then
		e.self:Say("Nice work kid. Now I'm feelin lucky. So's ya say ya wanna learn about cards right? Lemme tell ya. Them cards are nice but lets have some REAL fun. Yer resourceful, I like that. What say we take over this joint fer ourselves? Ol' Bristle's gettin soft, ya know? Wadda ya say? Man or mouse?");
		e.other:Faction(e.self,437,2); -- Faction: Denizens of Mischief
		e.other:QuestReward(e.self,0,0,0,0,0,100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if(e.timer == "fishing") then
		e.self:Say("I'm fishing fishing fishing. I fish the whole week through. Just fishing fishing fishing. It's what I always do.");
	end
end
