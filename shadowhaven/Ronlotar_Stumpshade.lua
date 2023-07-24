function event_signal(e)
	if(e.signal == 1 ) then
		e.self:Say("Oh hi there General! Ah can't complain me gots a lot of new customers coming to the shop as of late, but not all of them are rightsizers, ya know? So I tend to lose some sales simply because those big folks come in ere and I just simply don't make shoes dat big!");
	elseif(e.signal == 2) then
		e.self:Say("Will do General, see you soon. Good luck with your rounds.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I makes da boots. Aye.");
		else
			e.self:Say("You seem like a nice enough stranger but I am afraid all newcomers must see the Patriarch first before we are able to offer our great deals to them.");
		end
	end
end
