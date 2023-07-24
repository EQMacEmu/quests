-- ancient pattern quest -- ranger epic
function event_say(e)
	if(e.other:GetFaction(e.self) < 5) then --amiable or better Keepers of the Art
		if(e.message:findi("hail")) then
			e.self:Say("Ah. Hello there, adventurer. Come to search for ancient artifacts with Fizzlebik and myself?");
		elseif(e.message:findi("ancient artifacts")) then
			e.self:Say("Oh. All types of things. This area is great. So many artifacts and remains of things all over. It's starting to fall into the pattern of things.");
		elseif(e.message:findi("ancient bowl") or e.message:findi("ancient type of bowl")) then
			e.self:Emote("rummages through his tattered bag and throws aside a towel. 'Too many towels. Oh well, someone told me they were good to have once. Here it is, a bowl pattern. Interesting bowl. Looks almost like a magical bowl but I'm no potter. You need it, you say? Well, it is interesting. Part of my research here is for the wizard guild in Felwithe. I'm sure they'd put a high price on this one, the enchanters guild being so interested in trading for magical paraphernalia and all. Of course if you helped me out on a chore I have, I'd be happy to give it to you. I need to deliver an artifact to the guild and I'd much rather stay here exploring. If you wish, you can take the artifact and return with the receipt and I'll give you the pattern.'");
		elseif(e.message:findi("take the artifact")) then
			e.self:Say("Hah! Okay, then. Here take this to Farios Elianos in Felwithe. He will give you the receipt.");
			e.other:SummonCursorItem(20457);
		end
	elseif(e.other:GetFaction(e.self) > 4) then
		local random = math.random(3);
		if(random == 1) then
			e.self:Say("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.");
		elseif(random == 2) then
			e.self:Say("Is that your BREATH, or did something die in here?  Now go away!");
		elseif(random == 3) then
			e.self:Say("I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFaction(e.self) < 5) then --amiable or better Keepers of the Art
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20474})) then
			e.self:Emote("grins happily. 'Excellent! Was he pleased with the artifact? Oh, that's not even worth answering. I'm sure he was. He's always happy with the things I send him. That's why he honored me with this position of esteem, searching for useful and powerful items in this newly discovered land.'");
			e.other:QuestReward(e.self,0,0,0,0,18960);
			if(e.wp >= 3 and e.wp <= 10) then
				eq.signal(96035,2,30); -- NPC: Xiblin_Fizzlebik
			end
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 8) then
		e.self:Say("Hey there again, Xib!  Still a great day, isn't it?");
		eq.signal(96035,1,30); -- NPC: Xiblin_Fizzlebik
	end
	if(e.wp == 14) then
		e.self:Emote("grins a little and mumbles. 'This place is great.  Feels like I'm at the end of the universe.'");
	end
end

function event_signal(e)
	e.self:Say("What was that, Xib?");
	eq.signal(96035,3,30); -- NPC: Xiblin_Fizzlebik
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
