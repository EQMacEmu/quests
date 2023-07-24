--This will start Shaman Epic 1.0
function event_spawn(e)
	eq.set_timer("depop",600000);
end

function event_say(e)
	local randomize = math.random(100);
	
	if(e.other:GetFaction(e.self) < 6) then
		if(e.message:findi("hail")) then --Part of Shaman Epic 1.0
			e.self:Say("Did you take this person's life, shaman?");
		elseif(e.message:findi("yes")) then --Part of Shaman Epic 1.0
			e.self:Say("Why have you taken this person's life, " .. e.other:GetCleanName() .. "? Did he threaten your life? Did you dislike him? Or was his death a profit to you in some way?");
		elseif(e.message:findi("threatened my life")) then --Part of Shaman Epic 1.0
			e.self:Say("I see. It brings me sadness to see another die, but his heart was black and a great nothingness. His body will become the grass now. Thank you for what you have done, shaman.");
		elseif(e.message:findi("what are you") or e.message:findi("who are you")) then --Part of Shaman Epic 1.0
			e.self:Say("What, or who, I am isn't as important as what, or who, WE are. Do you wish to know more, shaman?");
		elseif(e.message:findi("know more")) then --Part of Shaman Epic 1.0
			e.self:Say("That is good, " .. e.other:GetCleanName() .. ". Take this gem. It is a part of us like the clouds to the sky and is a wonderful gift from the grandfather. Take this gem to where the humans gather to spoil the land and water. Some call it a port. There you will find one of us, a shaman like yourself. Give him the gem and perhaps he will tell you more of the spirits.");
			e.other:SummonCursorItem(1665); -- Item: Tiny Gem
		end
	elseif(randomize > 50) then
		e.self:Say("I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.");
	else
		e.self:Say("Oh look, a talking lump of refuse. How novel!");
	end
end

function event_timer(e)
	eq.depop();
end

--Submitted by: Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
