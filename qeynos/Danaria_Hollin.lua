function event_waypoint_arrive(e)
	if(e.wp == 5) then
		e.self:Say("I would like an Erudian tart, please.");
		eq.signal(1110,1); -- NPC: Karn_Tassen
	elseif(e.wp == 8) then
		e.self:Say("Time in the pub shall keep them from advancing to the next level of the mind. When will they learn?");
	elseif(e.wp == 26) then
		e.self:Say("A magnificent piece of workmanship! The clock, too.");
	end
end

function event_signal(e)
	e.self:Say("Just get me the tart and put your eyes back in your sockets or I'll pry them out for good!");
end

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then -- need exact faction
			e.self:Say("Greetings! Nice to meet someone with manners. I do not see how you people stand to live in this madhouse of ruffians. I would have left weeks ago if I were not waiting for a delivery. Oh, well. Nice to have met you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end		
	elseif(e.message:findi("delivery")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I am in Qeynos to meet up with a fellow Erudite coming from Freeport. He is two weeks late and I fear the worst. I shall need to hire some lackey to go to Freeport to find him.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end		
	elseif(e.message:findi("find")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Yes, that might work. Please go to Freeport and find him. His name is Palatos Kynarn. Tell him that Danaria has sent you for the painting. And be quick about it! Thank you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end		
	elseif(e.message:findi("donate") or e.message:findi("donation")) then
		e.self:Say("Why would I donate to such an inferior group of brutes? Go away! You will find no pity here.");	
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end