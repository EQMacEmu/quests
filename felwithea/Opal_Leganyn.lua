function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, good " .. e.other:GetCleanName() .. ". We carry the finest in smithing supplies. Do you care to view my wares? Or have you come for instructions on how to craft a [Koada Dal Falchion]?");
	elseif(e.message:findi("koada dal falchion")) then
		e.self:Say("Koada'Dal Falchions are highly specialized weapons crafted of the finest mithril. The weapon must be forged in the unique Koada'Dal Forge and you will need a curved blade mold, a hilt and a pommel mold, some morning dew, and a folded sheet of mithril. If you are a faithful follower of the All Mother then you may craft a magical falchion using moonlight temper instead of the morning dew and forging an emerald imbued by a cleric into the weapon at the time of its creation.");
	elseif(e.message:findi("wares")) then
		e.self:Say("The various molds that I have for sale are used in the smithing of weapons. Simply use the necessary molds with a sheet of metal, a forge, and a water flask. Weapons with hilts and pommels will also need molds for those pieces and weapons such as pole-arms and axes require an oak shaft.");
	end
end

-- END of FILE Zone:felwithea  ID:61048 -- Opal_Leganyn