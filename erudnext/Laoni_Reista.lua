function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Very good to make your acquaintance. " .. e.other:GetCleanName() .. ". If you are a [new knight]. then let it be known. for I am seeking young knights of Deepwater.");	
	elseif(e.message:findi("new knight")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
			e.self:Say("You do seem a bit young. We shall have to test your mettle. Within this temple. you shall learn to swim as fast as the swordfish and attack with the bravery and skill of the shark. Are you willing to [assist with the cleansing of the ocean]?");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("There is no reason to dislike you, but we of the Deepwater Knights must see more done for our cause before we truly accept you.");
		else
			e.self:Say("We, the Deepwater Knights, know of your vile ways. You had best leave while you can.");
		end
	elseif(e.message:findi("assist.* cleansing.* ocean")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
			e.self:Say("Go to the waters near the harbor. We have heard of Qeynos' rogue guild attempting to smuggle our valuable Vasty Deep water from Odus by way of swimmers. We require proof of their involvement. It is said they often carry special coins. Return one of these coins to me."); 
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("There is no reason to dislike you, but we of the Deepwater Knights must see more done for our cause before we truly accept you.");
		else
			e.self:Say("We, the Deepwater Knights, know of your vile ways. You had best leave while you can.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13881})) then --requires amiably
		e.self:Say("Good work. You have shown these rogues who are the better swimmers. Now we have proof of their involvement. You are a fine addition to the temple. Take this small reward. Go, and serve Prexus.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,242,10,0); -- Faction: Deepwater Knights
		e.other:Faction(e.self,266,1,0); -- Faction: High Council of Erudin
		e.other:Faction(e.self,265,-1,0); -- Faction: Heretics
		e.other:QuestReward(e.self,math.random(10),0,0,0,0,2000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98052 -- Laoni_Reista
