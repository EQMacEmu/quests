function event_say(e)
	fac = e.other:GetFaction(e.self);
	
	if(fac < 7) then
		if(e.message:findi("hail")) then
			e.self:Say("What business do you have here?!! Trying to keep safe? Expecting us to fight your battles? Bah!!");
		elseif(e.message:findi("chalice of conquest")) then
			e.self:Say("Looking for the chalice, are you? Ha!! I don't know where it is, but I know a [lost soul] who does and he could lead you right to it. He had a taste of it and now he can't get enough. He is sort of under the weather, or do I mean under the ground? Ha!!");
		elseif(e.message:findi("lost soul")) then
			e.self:Say("The orc named Captain Klunga knows where it's buried. Unfortunately, his time on Norrath has passed. I happen to know two things... one, he is buried somewhere in this territory and two, I can [raise Klunga] and he can show you where the chalice is.");
		elseif(e.message:findi("raise klunga")) then
			e.self:Say("I can raise Captain Klunga if I have a portion of his blood, an item he once owned and the most important part, 100 gold coins!! Hehe!! A gnome's got to make a living, you know?");
		end
	else
		e.self:Say("You dare to speak to a member of the Eldritch Collective!! You had best leave before you find your soul displaced from your body.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "The deal was - an article of Klunga's and his blood along with my fee of 100 gold coins and you will have his resurrection."

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12280,item2 = 18946,gold = 100},1,text)) then
		e.self:Say("Biggily boo, biggily borc.. Raise that stinky orc!! Bamm!! Okay!! It's done. Now all you have to do is find him in the spot where his soul left him and give him an orc shovel. Oh!! I didn't mention that? Oh, well. I'm sure you can find one.. somewhere. Now, get lost before I turn you into a toad!");
		-- verifed live faction
		e.other:Faction(e.self,245, 5,0); -- Faction: Eldritch Collective
		e.other:Faction(e.self,238, -1,0); -- Faction: Dark Reflection
		e.other:Faction(e.self,239, -1,0); -- Faction: The Dead
		e.other:Faction(e.self,255, 1,0); -- Faction: Gem Choppers
		e.other:Faction(e.self,333, 1,0); -- Faction: King Ak'Anon
		e.other:QuestReward(e.self,0,0,0,0,0,18000);
		eq.unique_spawn(70072, 0, 0, -2133, -726, 156, 0); -- NPC: Captain Klunga
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_signal(e)
	e.self:Say("Ha!! One like that one stands no chance within this realm. The goblins shall skin him alive!!");
	eq.signal(70005, 5); -- NPC: Elmion_Hendrys
end

-- EOF Ghilanbiddle Nylwadil
