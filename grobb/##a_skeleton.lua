function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Here I stand high and above, a minstrel supreme, my words offer love. Love between all, troll and ogre alike. I sing to all, except Tabaz, so take a hike!");
	elseif(e.message:findi("back to the closet")) then
		if(e.other:GetFactionValue(e.self) >= 200) then -- requires mid amiably	
			e.self:Say("Back to the closet?! Not until I can get an instrument. You get me... hmm, I know. Get me a lizardman scout fife. Not just one, but four. Then my friends can also play along with me. Do this and I promise you I shall return.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You're going to have to prove yourself a stronger aid to my masters, the Darkones.");
		else
			e.self:Say("I would like to assist you, but my masters say you are no friend of the Darkones and would rather see you dead.");
		end	
	end
end

function event_trade(e)
	local item_lib =require("items");
	local text = "I want FOUR lizardman scout fifes.";
	
	if(e.other:GetFactionValue(e.self) >= 200 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12198, item2 = 12198, item3 = 12198, item4 = 12198},1,text)) then --Lizardman Scout Fife
		e.self:Say("All right! I was kinda hoping the lizards would finish you off and I could stay free, but a deal is a deal. Let's go.");
		e.other:QuestReward(e.self,0,0,0,0,12216,25); --The Minstrel
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end