function event_spawn(e)
	eq.set_timer("worry",120000);
end

function event_timer(e)
	if(e.timer == "worry") then
		e.self:Emote("sees you come into the room but looks just past you, 'Shainai is that you?'");
	end
end

function event_signal(e)
	if(e.signal==1) then
		eq.spawn2(155340,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
end

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello there, " .. e.other:GetCleanName() .. ". I do not suppose you have seen a little girl running around with a box of [buttons]? I sent [Shainai] over to Master Barkhem's place so I can finish these uniforms I am working on.");
	elseif(e.message:findi("Shainai")) then
		e.self:Say("Shainai is my little girl. While I am [inactive] I would like to see her as much as possible so I brought her with me here. I am starting to worry that she may have gotten lost near the palace. If you see her and have the time to escort her back here I would be indebted to you, friend.");
	elseif(e.message:findi("buttons")) then
		e.self:Say("I need the buttons to finish making uniforms for the officers that live upstairs.  When I was injured in the field, this was the best way for me to help out.  My mum used to make uniforms for the Royal Khala Dun when I was a child and I guess I picked up a thing or two.  Still, it will be nice when I am able to get back out there and fight.");
	elseif(e.message:findi("inactive")) then
		e.self:Emote("averts his eyes, 'I was on a raid in the forest that went bad.  That was when we lost Shainai's mother.  Truth be told, as much as I am eager to get back out in the field, the opportunity to spend this little bit of extra time with Shainai is priceless.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4460})) then
		e.self:Emote("looks at what you handed him as his face turns to rage, 'What is... this... this is the box I sent Shainai out with!  Where is she?  What have you done?  You stole from my little girl!!  Maybe worst!!!!!'");
		e.other:Faction(e.self,1513,-1); --Guardian of Shar Vahl
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
