function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings to you brother. Did [Keven] send you?");
	elseif(e.message:findi("keven")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- not verified as exact
			e.self:Say("Very well, then let us begin. We are at home in the wilderness and thus it is important that we learn all we can about our surroundings. Now is the time of your learning. You are to venture out, hunt and learn about Everfrost. Return to me with a White Wolf Skin as proof of your successful hunt. We will then continue your training.");
		else
			e.self:Say("Hmmm... I don't know if I believe that.");		
		end
	elseif(e.message:findi("the land")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- not verified as exact
			e.self:Say("There is a bounty waiting for us in the wilderness for those with the wisdom to use it. Your next task is to find that wisdom within yourself and to use it. I shall task you with the creation of a few simple items from the materials available to us all. Go forth and harvest silk to make thread. Then when you feel you have learned enough, make a cap for yourself from the pelt of a bear. Return three Silk Thread and a Large Tattered Skullcap to me and I shall reward you.");
		else
			e.self:Say("Hmmm... I don't know if I believe that.");		
		end
	elseif(e.message:findi("fight")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- not verified as exact
			e.self:Say("That's the spirit! No doubt you know by now that our people are under constant attack by the goblins that infest our lands. Go out and fight against our enemies and bring justice to our people. Return to me with four Goblin Ice Necklaces and you shall have your just reward.");
		else
			e.self:Say("Hmmm... I don't know if I believe that.");		
		end
	elseif(e.message:findi("challenge")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- not verified as exact
			e.self:Say("Your zeal for justice is indeed a virtue. You make us all proud. Very well, venture out and into the home of those accursed dogs. Go to Blackburrow the home of the gnolls. There you are to fight against them and to retrieve the weapons of our mortal enemies. Return to me with a Gnoll Fang, a Giant Snake Fang and a Hunting Bow. I shall give you a weapon suitable for one such as yourself.");
		else
			e.self:Say("Hmmm... I don't know if I believe that.");		
		end
	elseif(e.message:findi("favor") or e.message:findi("willing")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- not verified as exact
			e.self:Say("I thank you for your willingness to help. Many of our people hunt the mighty mammoth and the cougar out in the vast and frigid plains. Aside from the risk of injury that often comes from hunting such fearsome and mighty creatures, there is the added risk of being attacked by the terrible snow orcs. Go and protect our people hunting in the plains of Everfrost, fight against the snow orc and return to me with a Wrath Orc Wristband. Surely the spirits will forever guide you.");
		else
			e.self:Say("Hmmm... I don't know if I believe that.");		
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13768})) then	--White Wolf Skin
		e.self:Say("Very good! I am sure by now you are learning much about your local surroundings. It is now time for you to learn to [live off the land].");
		e.other:Faction(e.self,327, 3);      							-- Shamen of Justice
		e.other:Faction(e.self,328, 1);      							-- Merchants of Halas
		e.other:Faction(e.self,223, -1);      							-- Circle Of Unseen Hands
		e.other:Faction(e.self,336, -1);       							-- Coalition of Tradefolk Underground
		e.other:Faction(e.self,244, -1);     							-- Ebon Mask
		e.other:QuestReward(e.self,0,0,0,0,7365,250); --Field Priest's Bracer
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 16486, item2 = 16486, item3 = 16486, item4 = 2125})) then 					--Silk Thread x 3, Large Tattered Skullcap
		e.self:Say("I see your wisdom grows, as does your skill. Wear this cap I have made for you. I believe you are now skilled enough to begin to pursue justice and to fight against our enemies. Are you [willing to fight]?");
		e.other:Faction(e.self,327, 1);      							-- Shamen of Justice
		e.other:Faction(e.self,328, 1);      							-- Merchants of Halas
		e.other:Faction(e.self,223, -1);      							-- Circle Of Unseen Hands
		e.other:Faction(e.self,336, -1);       							-- Coalition of Tradefolk Underground
		e.other:Faction(e.self,244, -1);     							-- Ebon Mask
		e.other:QuestReward(e.self,0,0,0,0,7366,400); --Field Priest's Cap
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13897, item2 = 13897, item3 = 13897, item4 = 13897})) then	--Goblin Ice necklacess x 4
		e.self:Say("I see you have brought many of our enemies to justice. You have done an excellent job and should be proud. No doubt your efforts saved lives. It is now time for you to venture out and fight stronger foes. Are you [up to the challenge]?");
		e.other:Faction(e.self,327, 5);      							-- Shamen of Justice
		e.other:Faction(e.self,328, 1);      							-- Merchants of Halas
		e.other:Faction(e.self,223, -1);      							-- Circle Of Unseen Hands
		e.other:Faction(e.self,336, -1);       							-- Coalition of Tradefolk Underground
		e.other:Faction(e.self,244, -1);     							-- Ebon Mask
		e.other:QuestReward(e.self,0,0,0,0,7367,600); --Field Priest's Kilt
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13915, item2 = 7005, item3 = 8011})) then 									--Gnoll Fang, Giant Snake Fang, Hunting Bow
		e.self:Say("You truly have justice in your heart. The spirits know this too. No doubt you are now beginning to hear their faint whispers. Soon you shall hear them clearly and you shall no longer need my guidance. I have one more [favor] to ask of you if you are [willing].");
		e.other:Faction(e.self,327, 10);      							-- Shamen of Justice
		e.other:Faction(e.self,328, 1);      							-- Merchants of Halas
		e.other:Faction(e.self,223, -1);      							-- Circle Of Unseen Hands
		e.other:Faction(e.self,336, -1);       							-- Coalition of Tradefolk Underground
		e.other:Faction(e.self,244, -2);     							-- Ebon Mask
		e.other:QuestReward(e.self,0,0,0,0,7368,1000); --Field Priest's Claw
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12223})) then 									--Wrath Orc Wristbands
		e.self:Say("Thank you very much, you have our thanks. Perhaps you will find some use for this. I have shown you all that I can young one. Now it is up to you. Listen to the spirits and work with them and they will work with you. Now go forth and continue to spread justice throughout the world.");
		e.other:Faction(e.self,327, 50);      							-- Shamen of Justice
		e.other:Faction(e.self,328, 7);      							-- Merchants of Halas
		e.other:Faction(e.self,223, -7);      							-- Circle Of Unseen Hands
		e.other:Faction(e.self,336, -7);       							-- Coalition of Tradefolk Underground
		e.other:Faction(e.self,244, -10);     							-- Ebon Mask
		e.other:QuestReward(e.self,0,0,0,0,7369,1000); --Field Priest's Leather
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
