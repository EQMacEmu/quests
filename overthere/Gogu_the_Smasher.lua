function event_say(e)
	if(e.message:findi("what realm of heroes")) then
		e.self:Say("Me dund 'xactly know wat dat is. but me kno' me part o'it. Me hero 'cause [Cazic] sed so.  Der many heroes from Norrath in it.  Me not as smart as [Kizrak the Tyrant] but me jus' as strong.  Me 'pose to find heroes like me dat like to bash dorfs an' dund like gud things.");
	elseif(e.message:findi("who cazic")) then
		e.self:Say("Cazic-Thule is da Faceless.  He is Lord of Fear an' nobody kin mess wit him.  He liked da way I SMASH things.  He made me a hero an' told me to find others dat SMASH as gud as me. Me was a basher for Oggok befoor dat.");
	elseif(e.message:findi("who kizrak the tyrant")) then
		e.self:Say("Kisrak the Tyrant is 'nother hero from da Realm.  Kisrak is reel smart an' stuff. but he like to smash tuu.  He in Oggok right now lookin' fer heroes.");
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
