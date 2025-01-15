function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the shrine of the Dismal Rage.  May [Innoruuk] guide your every move in life.  Here, we will teach you to release your rage unto the world.  My priests are at your disposal.");
	elseif(e.message:findi("innoruuk")) then
		e.self:Say("You do not even know the name of the Prince of Hate! That is a crime in here. Our god Innoruuk speaks with Pietro Zarn himself. It was Innoruuk who told him to create the Dismal Rage. You should speak with our family. Perhaps someone will help you better understand our beliefs.");
	elseif(e.message:findi("bayle list")) then
		if(not eq.is_content_flag_enabled("Classic_OldWorldDrops")) then
			e.self:Say("Oh. You must be the shadowknight who is to return the list to [Pietro Zarn]. The Bayle List is actually three scrolls with coded words. Alone they are nonsense. Together they can be decoded and tell something of value. Antonius Bayle had them created and gave them to three of his most trusted friends. Of these, I know Lady Shae, his old love. Then there is Captain Linarius Grafe, captain of the outer Qeynos Guards. Lastly, there is Frenway Marthank, Antonius Bayle's oldest friend. He is a resident of the Jaggedpine. When you recover the scrolls, you must take them to Rathmana Allin. He is a master scribe. He will decode the scrolls for us. He can be found in the deserts of South Ro. Now you'd best be off, before some other finds the scrolls. You must get there first and return the decoded list to Pietro Zarn.");		
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18744})) then -- A tattered note
		e.self:Say("Here we find a new follower.. Here we find a tunic of the Dismal Rage. Put the two together and let the hate grow. Let it be known from now on that your soul belongs to the Prince of Hate, Innoruuk. It is his power which flows within you. Destroy all those who oppose us. Please introduce your hate to the others in this shrine.");
		e.other:Faction(e.self,271,100,0); -- Dismal Rage
		e.other:Faction(e.self,281,-15,0); -- Knights of Truth
		e.other:Faction(e.self,296,20,0); -- Opal Dark Briar
		e.other:QuestReward(e.self,0,0,0,0,13561,20); -- Faded Crimson Tunic
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

