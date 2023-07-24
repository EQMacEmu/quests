function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Yooz small, and yooz look weak.  Mez tink dat yooz need new [armor].'  Bubbgrib peers at you with a blood-red eye from within his heavy helm.  'Yooz REALLY need new armor!");
	elseif(e.message:findi("armor")) then
		e.self:Say("Mez make da [plate] and [chain] armorz.  Which yooz need, weak one?");
	elseif(e.message:findi("plate")) then
		e.self:Say("Yooz use yer hammer to bash some enchanted adamanty chain jointing, wiv blood temper and large plate mold, leather padding and some folded [sheets of metal].  Don't forget youz magical shinystone!  Amber, jade or da saffire.  Gud bashin!");
	elseif(e.message:findi("chain")) then
		e.self:Say("Yooz take da hammer and da large leather armor and da blood temper and da large chainmail pattern and one imbued shinystone and den yooz bash in some unfolded [sheets of metal].'  Bubbgrib scratches his ample backside.  'Mez tink yooz may need more dan armor to keep yooz alive!");
	elseif(e.message:findi("sheet")) then
		e.self:Say("To make da special sheetz yooz need to start wiv da right sheet of velium.  If yooz need to make unfolded sheetz, den start wiv a unfolded sheet of velium.  If yooz need to make a folded sheet, den start wiv a folded sheet of velium.  Wiv yer sheet, yoz den hammer in a large brick of dat adamanty from de Darky Elf place.  Yooz need to use some [special temper] too.");
	elseif(e.message:findi("temper")) then
		e.self:Say("Dis mez not know a lot about.  Mez get some from Darky-robe.  He nice friend of Bubbgrib's.  Yooz just put it into da Oggie Forge wiv da sheet and da hammer and da adamanty ore and it works!  Darky-robe call it Sellesty Temper, or someting like dat.");
	end
end
