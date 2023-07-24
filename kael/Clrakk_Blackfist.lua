function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Emote("looks down at you. 'What is it you want, " .. e.other:GetCleanName() .. "? Why do you speak to the great Knight Clrakk Blackfist?");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("bring strife")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("The Coldain have grown complacent. The defenses of their city are built to keep my kind and dragonkind at bay. However, their defenses against the smaller races such as yourself are not nearly as sophisticated. I wish to kill many Coldain, but now is not the time for that. There is a particular Coldain whose death will strike fear into the hearts of many. His name is Deaen Greyforge, a Coldain knight. He is both feared and respected by his kind. If you can destroy him, it will send a message to the Coldain that they are not safe from the wrath of the giants. Kill him and chop his body into bits. Bring me a few pieces as proof that the fool is dead.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("knight")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Yes, I am a knight.  One who walks a dark path of blood and hatred.  In your realms, one such as myself is called a shadowknight.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 25115}, 0)) then -- Hand of Deaen Greyforge
		e.self:Say("You truly are a bringer of strife, " .. e.other:GetCleanName() .. ". Take this. I hope it will assist you. Use it in our war against the Coldain scum.");
		-- confirmeed live faction
		e.other:Faction(e.self,419,10); -- Kromrif
		e.other:Faction(e.self,448,2); -- Kromzek
		e.other:Faction(e.self,406,-5); -- Coldain
		e.other:Faction(e.self,430,-1); -- Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,25054,1000); -- Mask of Malediction
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25114}, 0)) then -- Legs of Deaen Greyforge
		e.self:Say("You truly are a bringer of strife, " .. e.other:GetCleanName() .. ". Take this. I hope it will assist you. Use it in our war against the Coldain scum.");
		-- confirmeed live faction
		e.other:Faction(e.self,419,10); -- Kromrif
		e.other:Faction(e.self,448,2); -- Kromzek
		e.other:Faction(e.self,406,-5); -- Coldain
		e.other:Faction(e.self,430,-1); -- Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,25051,1000); -- Dark Spear of Venom
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
