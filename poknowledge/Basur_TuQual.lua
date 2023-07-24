function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("curls his lips as he tilts his head. the wooden pipe remaining firmly placed between his teeth as he puffs on it a few times. The dwarf's cloudy eyes study you heavily and the sound of a husky voice can be heard mumbling a series of incomprehensible words. Eventually. the dwarf nods his head a few times and speaks in a strong. booming voice. 'Well. what 'ave we 'ere. hrm? A 'traveler'? A 'warrior'? A 'scholar'? By the looks o'ye. it appears ye just left yer mother's sweet. carin' arms and now ye wish t'gain fame. glory. and power. hrm? Well. there's nothin' I can do t'elp with dat soft appearance ye 'ave. but perhaps I can strengthen yer stomach. aye? I doubt ye be of the calibur and wit t'be one. but if by some cruel stroke o'the gods' 'umor. ye be a brewer. then dinnae wander far fer I 'ave all the supplies ye be needin' t'make a proper drink t'arden dat soft belly o'yours.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
