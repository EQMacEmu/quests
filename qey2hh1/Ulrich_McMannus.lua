function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the village of McMannus. We sell many goods. Feel free to look around - just keep your hands to yourself and mind [Frostbite]. Good day.");
	elseif(e.message:findi("frostbite")) then
			e.self:Say("Frostbite is my trusty pet and dearest friend. I trained him since he was nothing more than a pup. He can sniff out any danger with his keen sense of smell. He is quite good at [tracking prey].")
	elseif(e.message:findi("searching for the fugitive")) then
		e.self:Say("Searching for someone, eh?  You will most likely never find them on the plains. This is a vast area. I could have Frostbite help you search. He is quite good at [tracking prey].");
	elseif(e.message:findi("tracking prey")) then
		e.self:Say("Frostbite can track down anyone, be they man or beast. All one needs to do is obtain a SWEATY piece of clothing recently worn by the one you seek.");
	elseif(e.message:findi("halas")) then		
		e.self:Say("Halas is the mighty city of the barbarians of the North. It lies among the Everfrost Peaks.")
	elseif(e.message:findi("junth")) then
			e.self:Say("He is my brother.")
	elseif(e.message:findi("misla")) then
			e.self:Say("She is my sister.")
	elseif(e.message:findi("einhorst")) then
			e.self:Say("He is my father. We hail from Halas.")
	elseif(e.message:findi("sera")) then
			e.self:Say("She is my sister and the youngest of the clan.")		
	elseif(e.message:findi("brenzl")) then
			e.self:Say("He is my brother and a fine bowyer and net maker.")
	elseif(e.message:findi("lars")) then
			e.self:Say("He is my brother.")									
	elseif(e.message:findi("wolves of the north")) then
			e.self:Say("The Wolves of the North are the barbarian warriors of Halas. All of us in Clan McMannus are members. Mess with us and you mess with the Wolves of the North.")	
	end
end

-- END of FILE Zone:qey2hh1  ID:5187 -- Ulrich_McMannus 