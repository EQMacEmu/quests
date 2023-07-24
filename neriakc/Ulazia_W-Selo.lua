function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Spires of Innoruuk.  May your destiny be paved with the Words of Innoruuk.  What is it you seek? [Healing]?  [Curing of disease]?  [Curing of poison]?  That is my divine duty.  So commands Master Zexus.");
	elseif(e.message:findi("disease")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Whatever the malady, I can surely rid you of it.  First, you must donate 6 gold coins.  The power of life is not easily acquired when you follow the unholy might of Innoruuk.");
		else
			e.self:Say("No sane member of the Priests of Innoruuk would tolerate your presence. Begone or more than words shall I lay upon thee.");		
		end
	elseif(e.message:findi("poison")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("So, a toxic substance races to your heart?  It is best we stop that at once!  Ah...  But, before I go on, you must pay the required donation of 8 gold coins.");
		else
			e.self:Say("No sane member of the Priests of Innoruuk would tolerate your presence. Begone or more than words shall I lay upon thee.");		
		end
	elseif(e.message:findi("heal")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("So, it is the binding of wounds you desire. I could hardly tell with the smell of sacrifice drifting through the corridors of the Spires of Innoruuk. To be healed, I require a donation of 10 gold coins.");
		else
			e.self:Say("No sane member of the Priests of Innoruuk would tolerate your presence. Begone or more than words shall I lay upon thee.");		
		end
	elseif(e.message:findi("curing")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("So curing is what you have come for! Seek out Mistress Ulazia W'selo.");
		else
			e.self:Say("No sane member of the Priests of Innoruuk would tolerate your presence. Begone or more than words shall I lay upon thee.");		
		end
	elseif(e.message:findi("i.* heal")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("So, it is the binding of wounds you desire. I could hardly tell with the smell of sacrifice drifting through the corridors of the Spires of Innoruuk. To be healed, I require a donation of 10 gold coins.");
		else
			e.self:Say("No sane member of the Priests of Innoruuk would tolerate your presence. Begone or more than words shall I lay upon thee.");		
		end
	elseif(e.message:findi("innoruuk")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You speak the name of the Prince of Hate. He is the higher power who set the Teir'Dal upon this land. All Teir'Dal pay homage to Him. If they do not, they are surely [heretics]. And, if they are heretics, they surely must die!");
		else
			e.self:Say("No sane member of the Priests of Innoruuk would tolerate your presence. Begone or more than words shall I lay upon thee.");		
		end
	elseif(e.message:findi("heretic")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Speak not of Teir'Dal heretics. Those Teir'Dal who do not follow Innoruuk shall be cut down! Master Kerton R'dev of the Spires of Innoruuk is seeing to that.");
		else
			e.self:Say("No sane member of the Priests of Innoruuk would tolerate your presence. Begone or more than words shall I lay upon thee.");		
		end
	elseif(e.message:findi("teir")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I see the ancient language of the elf kind has been neglected. We dark elves are the Teir'Dal, superior to all elves. The high elves are known as the Koada'Dal and the wood elves are the Feir'Dal. There was once another, but that race is now extinct.");
		else
			e.self:Say("No sane member of the Priests of Innoruuk would tolerate your presence. Begone or more than words shall I lay upon thee.");		
		end
	elseif(e.message:findi("master")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("All members of the Priests of Innoruuk look to the unholy might of Perrir Zexus for direction.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Your devotion to the Priests of Innoruuk has yet to be proven to the desired extent.");			
		else
			e.self:Say("No sane member of the Priests of Innoruuk would tolerate your presence. Begone or more than words shall I lay upon thee.");		
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {gold = 6}, 0)) then
		e.self:Say("May the breath of life pass through your failing body and cast its foes from you. Unnngh... Praise Innoruuk!");
		e.self:CastSpell(96,e.other:GetID()); -- Counteract Disease
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {gold = 8}, 0)) then
		e.self:Say("May the breath of life pass through your failing body and cast its foes from you. Unnngh... Praise Innoruuk!");
		e.self:CastSpell(95,e.other:GetID()); -- Counteract Poison
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {gold = 10}, 0)) then
		e.self:Say("May the breath of life pass through your failing body and cast its foes from you. Unnngh... Praise Innoruuk!");
		e.self:CastSpell(12,e.other:GetID()); -- Healing
	end
	item_lib.return_items(e.self, e.other, e.trade)
end