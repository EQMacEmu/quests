function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("I shall never join you!! I would rather die.");
		eq.signal(69092,1); -- NPC: Zyle_Bensmill
	elseif(e.signal == 1) then
		e.self:Say("I shall never join you!! I would rather die.");
		eq.signal(69153,1); -- NPC: Dayle_Jornin
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the island of the Sisterhood of Erollisi.")
	elseif(e.message:findi("sisterhood")) then
		e.self:Say("The Sisterhood of Erollisi was formed by Styria. We are all female warriors from the Faydarks. We found the male warriors did not respect our skills or our purity. We have come here to train without distraction. We often aid Faydark's Champions when called upon.")
	elseif(e.message:findi("styria")) then
		e.self:Say("Our leader, Styria, is quite a magnificent warrior. She was never given her rightful place among the guildmasters of the elves. So it is that she now acts as guildmaster to the Sisterhood of Erollisi.")	
	elseif(e.message:findi("dwarves")) then
		e.self:Say("The dwarves were on a return trip from a failed business venture in Freeport. Their ship went down and they almost drowned. Styria saved them and they now make their home on our island and supply us with weapons and armor as well as selling to adventurers.")
	elseif(e.message:findi("purity belt")) then
		e.self:Say("All warriors of the Sisterhood of Erollisi wear purity belts. Ho hum... They keep us from impure acts. Along with purity comes great strength. That is what Styria always tells us. She holds the only key to the belts.")
	elseif(e.message:findi("pirate")) then
		e.self:Say("We have been plagued by buccaneers who call themselves the Pirates of Gunthak. We saw their ship go down nearby. They have taken refuge on a nearby island. They are attempting to take over our isle so they can commandeer the next ship. Go and ask Styria of the Pirates. She is hiring adventurers to hunt them down.")
	elseif(e.message:findi("ship") or e.message:findi("boat")) then
		e.self:Say("The ship comes and goes once a day, I believe.  Though I can't imagine why you would ever want to leave our beautiful island.")
	end
end