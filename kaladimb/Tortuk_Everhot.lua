function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to the Everhot Forges! Home of the finest smiths in all of Kaladim! I teach experienced smiths how to work [brellium ore] and craft the finest dwarven [battle shields] and [dwarven plate].");
	elseif(e.message:findi("dwarven plate")) then
		e.self:Say("So ye're interested in crafting dwarven plate, are ye? In order to successfully craft yerself some dwarven plate, ye'll need ta go to the Stormguard forge with the appropriate small plate section mold, some earthen temper, yer dwarven smithy hammer, some leather padding, brellium chain jointing, and the correct amount of metal ye need fer the piece ye are planning on crafting. Visors, collars, bracers, and boots require one folded sheet of brellium. Helms, pauldrons, girdles, vambraces, and gauntlets require two folded sheets of brellium. Breastplates, cloaks, and greaves require three folded sheets of brellium. Ye can also have a cleric imbue a ruby for ye ta forge inta the plate if ye be a friend ta our father Brell.");
	elseif(e.message:findi("brellium ore")) then
		e.self:Say("Brellium is a dense, sturdy ore mined here in Kaladim. It takes a strong arm and our unique Stormguard Forge to work due to the ore's strength and resistance to heat. Brellium is worked in the same fashion as standard ore but must be tempered with dwarven ale instead of water.");
	elseif(e.message:findi("battle shield")) then
		e.self:Emote("grins widely beneath his thick, soot-covered beard and says, 'Ta craft yerself a battle shield, ye'll need ta get yerself a small kite shield mold, a block of brellium, a dwarven smithy hammer, and some earthen temper. Don't ye forget that brellium items can only be crafted in the unique Stormguard Forge. If ye be one o' Brell's faithfull then ye may want ta have a cleric imbue a ruby for ye ta craft inta the shield.");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
