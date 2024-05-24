function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFaction(e.self) > 7) then
			e.self:Say("Click... Warning. You are not an ally of the state of Ak'Anon. Further queries may result in death. Have a nice day.");
		else
			e.self:Say("Greetings, lost soul. I am a guide, automaton, series G. I can assist you by leading you to all the important destinations in Ak'Anon. All you need to do is state a valid destination... Bzzz... Click!");
		end
	elseif(e.message:findi("exit") or e.message:findi("entrance")) then
		e.self:Say("Click... The Steamfont Mountains may be accessed through the tunnel. Please come back.");
		eq.move_to(-34,4,4,0,false);
	elseif(e.message:findi("warrior") or e.message:findi("gemchopper")) then
		e.self:Say("Gemchopper Hall is the headquarters of the Gemchoppers, the warriors of Ak'Anon. All clockworks and Watchmen operations are directed by the great Gemchopper guild masters. Have a grand visit!");
		eq.move_to(-469,958,-28,0,false);
	elseif(e.message:findi("cleric")) then
		e.self:Say("'The Abbey of Deep Musing serves as a shrine to both Brell Serilis and Fizzlethorpe Bristlebane. It is here that one can find healing, if desired. Enjoy your visit.");
		eq.move_to(-540,1401,-79,128,false);
	elseif(e.message:findi("wizard") or e.message:findi("magician") or e.message:findi("enchanter")) then
		e.self:Say("The Library of Mechanimagica is the home of the Eldritch Collective, the practitioners of all positive circles of magic. The Eldritch Collective's members are the chief designers of all of Ak'Anon's wondrous machines. Enjoy your visit.");
		eq.move_to(-769,1212,-24,172,false);
	elseif(e.message:findi("king") or e.message:findi("palace")) then
		e.self:Say("Click! Whirr...  Ak'Anon Palace is home to the throne of his majesty, King Ak'Anon. All visitors to the palace must first report to Receptionist VI.  Click. The palace can be found to the right of the forward structure. Have a pleasant visit.");
		eq.move_to(-367,903,-6,64,false);
	elseif(e.message:findi("zoo")) then
		e.self:Say("Click...  The Grand Zoo of Ak'Anon is home to some of the rarest creatures in Norrath. Inside you will find the likes of minotaurs, tigers and bears, among others. Please do not feed the animals. City Code, Section 3465.");
		eq.move_to(-844,1300,-30,172,false);
	elseif(e.message:findi("armor") or e.message:findi("forge")) then
		e.self:Say("Welcome to the Forge of Defiance. Within these walls, the finest armor in all of Norrath is shaped. Prices are reasonable and the smiths are friendly. Spend wisely!");
		eq.move_to(-740,1240,-26,172,false);
	elseif(e.message:findi("works")) then
		e.self:Say("Click! The Works is the main supplier of all the essentials for venturing into the wilds of the Steamfont Mountains and beyond...  Spend wisely.");
		eq.move_to(152,717,-26,0,false);
	elseif(e.message:findi("weapon")) then
		e.self:Say("Click... The Tools of Battle is the finest supplier of weapons on Faydwer. Spend wisely.");
		eq.move_to(-724,1300,-26,128,false);
	elseif(e.message:findi("scrapyard")) then
		e.self:Say("The scrapyard is located down the path and through the tunnel on the right. It is here one can discard unwanted refuse, sometimes for a price. Watch your step.");
		eq.move_to(-541,1420,-77,0,false);
	elseif(e.message:findi("gatehouse") or e.message:findi("repair")) then
		e.self:Say("The Gatehouse serves as the repair shop for all automatons in Ak'Anon. It is also the last line of defense. Enjoy your visit.");
		eq.move_to(21,236,-26,64,false);
	elseif(e.message:findi("wheel")) then
		e.self:Say("The Great Wheel is located down the path and through the tunnel to the right. The Great Wheel provides ninety-eight percent of the energy employed in Ak'Anon. It was designed by King Ak'Anon himself. Watch your step.");
		eq.move_to(-541,1420,-77,0,false);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
