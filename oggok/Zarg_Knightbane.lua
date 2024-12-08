function event_say(e)
	if(e.message:findi("Hail")) then
		if(eq.is_the_ruins_of_kunark_enabled()) then
			e.self:Say("Yoo wan ta buy some armor? Or you wan me ta teach ya how ta make da [war plate] or [bouncer shield]?");
		else
			e.self:Say("Yoo wan ta buy some armor?");		
		end
	elseif(e.message:findi("plate")) then
		if(eq.is_the_ruins_of_kunark_enabled()) then
			e.self:Say("First ting you need is sum o' dat adamantite ore frum the dark elves. Dat adamantite can only be worked inta bricks, blocks, and sheets in da special forge in Nary... Neera... in da dark elf city an in da special Oggok forge. Den fer all pieces of da armor yoo need da right large plate mold, a smithy hammer, sum leather padding, sum adamantite chain jointing, and sum blood temper. Different pieces o' da war plate takes different amounts of adamantite. What piece yoo gonna try ta make?");
		end
	elseif(e.message:findi("bouncer shield")) then
		if(eq.is_the_ruins_of_kunark_enabled()) then
			e.self:Say("Da bouncer shields be made ta fit snug on our strong arms! Ebbery bouncer in Oggok be wearin one soon. De can only be made in our special Oggok forge! Yoo need a large round shield mold, da smithy hammer, two sheets of adamantite, an sum blood temper.");
		end
	elseif(e.message:findi("blood temper")) then
		if(eq.is_the_ruins_of_kunark_enabled()) then
			e.self:Say("Yoo no hab no blood temper?! Yoo need da blood temper to make da war plate dat will make yoo a mighty ogre! Go talk Clurg bout blood temper. Clurg knows many tings.");
		end
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------