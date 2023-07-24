function event_say(e)
	if ( e.other:HasItem(16260) ) then -- Tiny Gold Fist
		if(e.message:findi("hail")) then
			e.self:Say("Why hello " .. e.other:GetCleanName() .. "! It is good to see you again after our adventure in the Plane of Nightmare. Know that you have shown your worth to both Kerasha and myself. Should you ever need anything feel free to call upon us. May Quellious guide your path in the Planes!");
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("Greetings " .. e.other:GetCleanName() .. "! I am Eino, Monk of Quellious and Aid to Councilwoman Kerasha! I spend my time as protector to the councilwoman as well as taking small jaunts to the planes to obtain items for her magic research. If you be a hearty individual with some allies you may be able to help me.");
		end
		if(e.message:findi("help")) then
			e.self:Say("Then meet me this night in the Plane of Nightmares. Near the waterfall of the upper plateau is a large tree. Should you see a soft glow, know that I am about. Signal to me by saying 'Quellious be my guide'. I shall emerge from my concealment.");
		end
	end
end
