function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Well. good day t'ye. traveler and welcome t'New Tanaan! We pride ourselves upon the knowledge and wisdom each lad and lass of this fine city has come to study for the rest of their days. Yee need not be worrin' 'bout any lack of acceptance or aid from us. stranger. fer we all be willin' t'aid any who would merely lend an ear. and in some cases. a bit of coin. Aye. traveler. we do still be needin' a bit of gold 'ere an' there if we are to support the sudden flood of ye travelers. now don't we? In any case. dinnae let such small stipulations bother ye. fer our prices be quite fair. Now. if ye be a cleric. then ye 'ave come t'the right place. friend. I myself am a priest of Brell. an' what knowledge I 'ave fer the takin' is yours should ye provide the asked price. o'course.");
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
