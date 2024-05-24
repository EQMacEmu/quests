--Shaman Skull Quest 6

function event_say(e)
	if(eq.is_the_shadows_of_luclin_enabled()) then
		if(e.message:findi("Hail")) then
			e.self:Emote("seems to be preocupied. He is examining an egg. 'What?!! Who has [sent] you to me? Bah!! Away with you.' He ignores you and continues chanting.'");
		elseif(e.message:findi("di nozok sent")) then
			if(e.other:GetFactionValue(e.self) >= 100) then
				e.self:Emote("drops the egg he was holding. Egg yolk splatters on your foot. His eyes roll back into his head. He speaks, but his voice is that of a female. 'I await you, " .. e.other:GetCleanName() .. " . My sisters and I yearn for the return of our skulls. We are the [Sisters of Scale]. Find us and bring to this hierophant our skulls and your iron cudgel of the Channeler. Go.");
			elseif(e.other:GetFactionValue(e.self) >= 0) then
				e.self:Say("You will only obtain that which you seek by assisting the wills of the Scaled Mystics.");
			else
				e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));		
			end
		elseif(e.message:findi("sisters")) then -- kneel emote
			e.self:Emote("wipes egg yolk from his clothing. 'My, what a mess!! Hmmph!! What did you say? Sisters of Scale? They were a legendary trio of mystics. We once had their skulls sealed within this temple, but now they are lost. I sent a channeler to retrieve them. His name was Vagnar. I am sure he shall find them.");
			e.self:DoAnim(33);
		elseif(e.message:findi("vagnar")) then
			e.self:Say("He's a capable channeler, I trust he knows where to look and will prepare himself. Any competent servant of our Lord would prepare potions and supplies before going on such a quest. If he doesn't come back, it's no great loss, he wasn't Hierophant material anyway.");
		end
	else
		if(e.message:findi("Hail")) then
			e.self:Emote("seems to be preocupied. He is examining an egg. 'What?!! Bah!! Away with you.' He ignores you and continues chanting.'");	 -- made up text for pre luclin
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	--Turn in the skulls of the sisters of scale and your cudgel of the channeler
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 5145, item2 = 12748, item3 = 12750, item4 = 12749})) then
		e.self:Emote("goes into a trance and speaks with the voice of an ancient. 'You have returned the skulls of the Sisters of Scale. For this you shall be rewarded. Take this hierophant's weapon. May you use it to smite the foes of our people.' Dexl comes out of the trance. 'What?!! Whew. Hey!! Where is my cudgel?");
		e.other:Faction(e.self,445, 10); 					--Scaled Mystics
		e.other:Faction(e.self,441, 10); 					--Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,10,5146,140000); 	--Give the player The Cudgel of the Hierophant
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
