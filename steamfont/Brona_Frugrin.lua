-- Quest for Staff of the Observers

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Well met, " .. e.other:GetCleanName() .. "!  What brings you out this way?  Are you interested in becoming an observer?  No, you look like the adventuring type.  The wilds of the Steamfont Mountains is as far as my body goes.  But through my [duties] as an observer, my mind travels the cosmos.");
	elseif(e.message:findi("duties")) then
		if(e.other:GetFaction(e.self) <= 5) then
			e.self:Say("Well, I am quite an accomplished enchanter but most of my time now is spent crafting the magical lenses that enable us to see beyond the ceiling of Norrath and into other realms and dimensions.  Say, in your travels have you encountered any [evil eyes]?");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("evil eyes")) then
		if(e.other:GetFaction(e.self) <= 5) then
			e.self:Say("Evil Eyes are dangerous creatures of great magical power. You will know one if you see one. There is a rumor that somewhere on Antonica there lives a powerful Evil Eye by the name of Borxx. I believe that with the Lens from her eye and some expert tinkering I could create a device that will enable me to observe the gods themselves in their native planes. If you were to bring me this lens the Eldrich Collective will reward you greatly.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFaction(e.self) <= 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10170})) then
		e.self:Say("Not only did you find Borxx but you were able to slay her as well?! You are truly a champion of great skill. This lens of Borxx's will greatly aid our research of other planes of existence. I have been authorized by the Eldritch Collective to offer you this Staff of the Observers. Carry it with pride.")
		e.other:Faction(e.self,245, 15);  -- Eldrich COllective
		e.other:Faction(e.self,238, -2);  -- Dark Reflection
		e.other:Faction(e.self,239, -1);  -- The Dead
		e.other:Faction(e.self,255, 2);  -- Gem Choppers
		e.other:Faction(e.self,333, 2);  -- King Ak'Anon			
		e.other:QuestReward(e.self,0,0,0,0,10171,100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Quest by mystic414

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
