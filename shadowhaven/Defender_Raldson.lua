-- Daksins' Vampyre Antidote

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day to you " .. e.other:GetCleanName() .. ". A fine day it is today in the Haven. I hear the bazaar is full of great deals today. I'd love to go and check them out for myself unfortunately I'm stuck here worrying about my friend [Daksins].");
	elseif(e.message:findi("daksin")) then
		e.self:Say("Well I know that he told me he was going to the Tenebrous Mountains to try to acquire the blood of one of the cursed vampyres there. A very brave gnome he is, but also sometimes not very aware of what he is getting himself into. He told me that he needed to bring it to Zimloro so that a potion could be made to cure his sick sister.  She was attacked by one of the cursed not too long ago. Perhaps you could go [lend him a hand] so that he could return sooner.  His family is very worried about him.");
	elseif(e.message:findi("lend him a hand")) then
		e.self:Say("That is very nice of you, " .. e.other:GetCleanName() .. ". I'm sure his family will be very grateful. He should not be there alone and we fear the worst for him. If you are to go search for him, please bring him this note from Zimloro that contains further instructions Please seek him out and do your best to convince him to come home.");
		e.other:SummonCursorItem(4764); -- Item: A List of Potion Components
	end
end

function event_combat(e)
	if(e.joined) then
		eq.set_timer("combatsay",300000);
	else
		eq.stop_timer("combatsay");
	end
end

function event_timer(e)
	e.self:Say("A fool you are indeed to test your fighting skills to mine!  You shall now die by my blade!");
end

function event_death_complete(e)
	eq.stop_timer("combatsay");
end
