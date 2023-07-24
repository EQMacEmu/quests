-- for shaman epic
function event_spawn(e)
	eq.set_timer("depop",2100000);
end

function event_timer(e)
	eq.depop_with_timer();
end

function event_say(e)
	if(e.other:GetFaction(e.self) < 3) then -- need warmly with true spirit.
		if(e.message:findi("hail")) then
			e.self:Say("So, you've come. I suppose my brothers have sent you to lead me back to their flock. Those fools are so blinded by their devotion they know nothing of life. If they only knew the power I've become, the luxuries I've amassed, the pleasures I've known, they too would leave that sour and unrewarding existence in seconds. You know, you could come to know what I have, shaman. You found me, which speaks of your intelligence; we could use you. What do you say, " .. e.other:GetCleanName() .. "? [Will you join] my master Mayong Mistmoore?");
		elseif(e.message:findi("will not join")) then
			e.self:Say("Good shaman, now bare your neck that I may show our master your devotion in death. The more blood you spill upon the grass, the more impressed our Lord Mistmoore will be. Then maybe, just maybe, you will be allowed to scour our kitchen floors in the eternity of unlife. TEAR him to pieces, my wolves!");
			eq.attack(e.other:GetName());
		end
	else
		e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
