function event_say(e)
	if(e.message:findi("Hail")) then
		if(eq.is_the_ruins_of_kunark_enabled()) then
			e.self:Say("Me got da toughest weapons in da lands! Yoo come ta buy weapon or ta learn from Varrok bout [war mace] an [war hammer]?");
		else
			e.self:Say("Me got da toughest weapons in da lands!");		
		end
	elseif(e.message:findi("war mace")) then
		if(eq.is_the_ruins_of_kunark_enabled()) then
			e.self:Say("Yoo want ta make mighty war mace? Den yoo must go to special Oggok forge with mold for head of mace, oak shaft for handle of mace, Ogre Swill, and sheet of adamantite. If yoo hab powerful shaman friend den maybe he give you imbued amber or jade to make mace even stronger, but If yoo do dat den you must use blood temper instead of Ogre Swill.");
		end
	elseif(e.message:findi("war hammer")) then
		if(eq.is_the_ruins_of_kunark_enabled()) then
			e.self:Say("Yoo want t' make ogre war hammer? Den yoo need ta go ta da special Oggok forge wit a mold for da head of da hammer, an oak shaft for da handle of da hammer, Ogre Swill, an a sheet of adamantite. Powerful shaman can gib ya imbued amber ' jade ta make it eben stronger hammer, but ib yoo do dat den yoo must use blood temper instead of da Ogre Swill.");
		end
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------