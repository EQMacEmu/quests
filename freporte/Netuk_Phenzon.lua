function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome " .. e.other:GetCleanName() .. ". Let us fill your heart with hate. May you carry that hate unto your fellow citizens. Innoruuk has need of your services. We have A [mission] for you.");
	elseif(e.message:findi("mission")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("There is a man called Groflah Steadirt. He frequents a bar here in Freeport during the early evening hours. Our sources tell us he was given a piece of parchment taken from one of our allies. Who that is, is none of your business. We only require you to recover the parchment, which he no doubt has on him. End his life and return the note to me. Do not let me see your miserable face again until you have the parchment.");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18818})) then -- Tattered Flier
		e.self:Say("It is about time you returned! Innoruuk would be proud of the red you have spread upon the land.");
		e.other:Faction(e.self,271,30); -- Dismal Rage
		e.other:Faction(e.self,281,-4); -- Knights of Truth
		e.other:Faction(e.self,296,6); -- Opal Dark Briar
		e.other:QuestReward(e.self,0,math.random(0,15),math.random(0,10),0,15343,500); -- Spell: Siphon Strengh
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freporte  ID:10101 -- Netuk_Phenzon
