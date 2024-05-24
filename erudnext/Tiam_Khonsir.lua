function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". Are you a follower of our order, the Deepwater Knights, servants of the Ocean Lord, Prexus?");
	elseif(e.message:findi("yes")) then
		e.self:Say("That is good, " .. e.other:GetCleanName() .. ". Our followers are few but our faith is strong. With the efforts of those few, our destiny may be reached in time. We must walk with perseverence and devotion, much like the tides that, over time, can destroy a mighty stone cliff. Have you [come to serve our Lord], " .. e.other:GetCleanName() .. "?");
	elseif(e.message:findi("come.* serve our lord")) then
		if(e.other:GetFactionValue(e.self) >= -200) then
			e.self:Say("Then I shall send you on a quest to prove your devotion. No doubt you have seen the vermin kobolds scuttling about the land as fleas upon a mangy dog. The kobolds have a lair on our continent from which they launch their wantonly destructive raids. You are to enter that lair and destroy as many of these dogs as you can. For each molar you bring me, you will receive praise, admiration, and perhaps some coin.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end	
	elseif(e.message:findi("quest of greater importance")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Very well then, " .. e.other:GetCleanName() .. ", you may be able to help us. Go to Breya and tell her I sent you. She will brief you.")
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");	
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end	
	elseif(e.message:findi("harpoon no more")) then
		e.self:Say("Well, " .. e.other:GetCleanName() .. ", that is unfortunate. Quite a pity, indeed.")
	end
end

function event_trade(e)
	local item_lib = require("items");
	local mlr = item_lib.count_handed_item(e.self, e.trade, {1761});

	if(e.other:GetFactionValue(e.self) >= -200 and (mlr > 0))  then -- Kobold Molar
		repeat
			e.self:Say("Wonderful work, friend " .. e.other:GetCleanName() .. ". One less land dwelling, flea ridden, primitive for our wondrous lord to sweep aside when the apocalypse is upon us. Here is your reward. Perhaps if you gather enough molars, we can offer you a [quest of greater importance].");
			local ranitem = 0;
			if(math.random(6) == 1) then
				ranitem = eq.ChooseRandom(3120,3123,3115,3117,3122,3113,3116,3118,3121,3124,3119,3108,3107,3111,3103,3105,3110,3101,3104,3106,3109,3112,3132,3135,3127,3129,3134,3125,3128,3130,3133,3136,3131); -- Item(s): Small Ringmail Sleeves (3120), Small Ringmail Pants (3123), Small Ringmail Neckguard (3115), Small Ringmail Mantle (3117), Small Ringmail Gloves (3122), Small Ringmail Coif (3113), Small Ringmail Coat (3116), Small Ringmail Cape (3118), Small Ringmail Bracelet (3121), Small Ringmail Boots (3124), Small Ringmail Belt (3119), Ringmail Sleeves (3108), Ringmail Skirt (3107), Ringmail Pants (3111), Ringmail Neckguard (3103), Ringmail Mantle (3105), Ringmail Gloves (3110), Ringmail Coif (3101), Ringmail Coat (3104), Ringmail Cape (3106), Ringmail Bracelet (3109), Ringmail Boots (3112), Large Ringmail Sleeves (3132), Large Ringmail Pants (3135), Large Ringmail Neckguard (3127), Large Ringmail Mantle (3129), Large Ringmail Gloves (3134), Large Ringmail Coif (3125), Large Ringmail Coat (3128), Large Ringmail Cape (3130), Large Ringmail Bracelet (3133), Large Ringmail Boots (3136), Large Ringmail Belt (3131)
			end
			e.other:Faction(e.self,242,7,0);  -- Deepwater Knights
			e.other:Faction(e.self,266,1,0); -- High Council of Erudin
			e.other:Faction(e.self,265,-1,0);-- Heretics
			e.other:QuestReward(e.self, {itemid = ranitem, exp = 3800, gold = math.random(6), silver = math.random(0,9), copper = math.random(0,9)}); -- confirmed exp data
			mlr = mlr - 1;
		until mlr == 0
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98051 -- Tiam_Khonsir
