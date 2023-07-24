-- poknowledge\Szrix_Hammertail.lua NPCID 202071

local RESPONSES = {
	"stares at you long and hard. 'Long ago I escaped imprisonment from Drunder, such things I saw there I would not wish to think of again.  Never again would I even think of speaking of Drunder was it not for the favor owed to the Lord of Guile.  The task he set to me I accomplished to a degree.  I was able to obtain the materials Eriak spoke of through much difficulty.  I was also able to create a set of weaponry that will do much harm to the Warlord.  Should you wish to test your skill I may be able to help ye.'",
	"glares at you. 'Very well, %s, I will teach you.  Combining Decorin ore and a flask of water in a forge makes the base metal of Drunder.  Ye then need a temper brewed for the weaponry.  Find the shards of valor and decant their essence with a celestial solvent.  Based on what type of weapon ye desire is the mold that is needed.  Do you wish to craft a Sword, a Bastard Sword, a Claidhmore, a Battlehammer, an Ulak, a Dagger or a Bow?'",
	"To make the sword, combine Drunder's steel, pulsing blue vial, long blade mold, hilt mold, and a pommel mold in a forge.  This will make a weapon that will cause some worry to the Zeks.",
	"To make the bastard sword, combine Drunder's steel, pulsing blue vial, dual-edged blade mold, hilt mold, and pommel mold in a forge.  This will make a weapon that will cause some worry to the Zeks.",
	"To make the claidhmore, combine Drunder's steel, pulsing blue vial, heavy steel blade mold, hilt mold, and a pommel mold in a forge.  This will make a weapon that will cause some worry to the Zeks.",
	"To make the battlehammer, combine Drunder's steel, pulsing blue vial, mace head mold, and an oak shaft in a forge.  This will make a weapon that will cause some worry to the Zeks.",
	"To make the ulak, combine Drunder's steel, pulsing blue vial, pommel mold, short blade mold, and a hilt mold in a forge.  This will make a weapon that will cause some worry to the Zeks.",
	"To make the dagger, combine Drunder's steel, pulsing blue vial, dagger blade mold, and a  hilt mold in a forge.  This will make a weapon that will cause some worry to the Zeks.",
	"To make the bow, combine Drunder's steel, pulsing blue vial and a file in a forge.  This will make a weapon that will cause some worry to the Zeks.",
	"hisses at you as if about to attack. 'Won't you let me be!  Torment me no more about memories of the past!  This is the last bit I shall tell you then hope to never see you again.  Combine any of the weapons with a substance made from decanting the black blood, insanity fangs and celestial solvent. The weapons made thusly will cause even the Warlord to flinch at the thought of facing them.  All but the bow must be made in a forge, combine the bow and the substance in a fletching kit.'",
};

local TRIGGERS = {
	"dark courage",
	"test my skill",
	"sword",
	"bastard",
	"claidhmore",
	"battlehammer",
	"ulak",
	"dagger",
	"bow",
	"black insanity",
};

function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Emote("speaks in a drawling hiss. his voice tainted with the dark accent of Cabilis. 'The Hammertails greet you. traveler. If you seek supplies of which to craft iron and steel weaponry. then you need search no further. The Hammertails will accommodate all of your needs at a fair price.'");
		return;
	end

	local qglobals = eq.get_qglobals(e.other);
	local zeks = tonumber(qglobals.zeks) or 0;
	
	for i, text in ipairs(TRIGGERS) do
		if ( e.message:findi(text) ) then
			if ( zeks > 4 ) then
				if ( i == 1 or i == 10 ) then
					e.self:Emote(RESPONSES[i]);
				elseif ( i == 2 ) then
					e.self:Emote(RESPONSES[i]:format(e.other:GetName()));
				else
					e.self:Say(RESPONSES[i]);
				end
			else
				e.self:DoAnim(31); -- yawn
			end
			return;
		end
	end
end
