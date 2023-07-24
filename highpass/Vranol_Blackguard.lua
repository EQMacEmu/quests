function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFaction(e.self) > 5) then -- requires indifferent
			e.self:Say("I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.");
		else
			e.self:Emote("curls his lip, his sharp and regally handsome features twisting into a glare of pure disgust, 'Pathetic little worm. How easily I could strip your flesh from your very bones and pry out your teeth and fingernails one-by-one -- all whilst you continued to breath. All whilst you continued to see and feel. Aaaah, and what marvelous treasures my darling symblings and children could make of your putrid remains. Perhaps a lovely gown of silk-embroidered flesh to sell to a fair maiden, and I am quite sure such an item would fetch a lovely price -- for my family's talents are so great that even the grotesque hide upon your bones they could turn into a fabric more elaborate than even a queen's finest velvet. Aaaah...' The regal, wicked man flashes an eerie smile, 'perhaps you had best leave before you tempt me further and such thoughts reach into the realm of reality.");
		end
	end
end
