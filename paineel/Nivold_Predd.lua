function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("What do you want? Do not disturb me lest you plan to assist in my [summoning of Dread].");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I sense the potential to learn the ways of fear within you. Continue striving to master your fear and one day perhaps you can be of service to our Lord Cazic-Thule.");		
		else
			e.self:Say("Begone from this place! Infidels like you have no place among the faithful of Cazic-Thule!");			
		end
	elseif(e.message:findi("summoning of dread")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("There are some components essential to the summoning of the avatar of Dread. I require the eye of a griffon. some [powder of reanimation]. the brain of the Ishva Mal. and the toes of an ice giant. Fetch me these reagents so that we may summon the avatar to forge a shield worn only by the mightiest apostles of Cazic-Thule.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I sense the potential to learn the ways of fear within you. Continue striving to master your fear and one day perhaps you can be of service to our Lord Cazic-Thule.");		
		else
			e.self:Say("Begone from this place! Infidels like you have no place among the faithful of Cazic-Thule!");			
		end
	elseif(e.message:findi("powder of reanimation")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("There is a gnome necromancer who has been experimenting with a powder used in reanimating long dead organic tissue. He is known to frequent places populated by undead in order to pursue his research. Seek him out and procure a bit of his powder.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I sense the potential to learn the ways of fear within you. Continue striving to master your fear and one day perhaps you can be of service to our Lord Cazic-Thule.");		
		else
			e.self:Say("Begone from this place! Infidels like you have no place among the faithful of Cazic-Thule!");			
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I require all four reagents, anything less is useless. Incompetence will get you nowhere amongst the faithful of Cazic-Thule!";
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 16540,item2 = 13739,item3 = 14111,item4 = 14112},1,text)) then
		e.self:Say("Commendable work, you have proven yourself a valuable member of our order. Our chanters have summoned the avatar of Dread. Hurry and take him this mundane shield so that he may forge it into a truly valuable symbol of your devotion to the lord of Fear!");
		e.other:Faction(e.self,265,400,0); -- Faction: Heretics
		e.other:Faction(e.self,242,-400,0); -- Faction: Deepwater Knights
		e.other:Faction(e.self,254,-400,0); -- Faction: Gate Callers
		e.other:Faction(e.self,231,-400,0); -- Faction: Craftkeepers
		e.other:Faction(e.self,233,-400,0); -- Faction: Crimson Hands
		e.other:QuestReward(e.self,math.random(9),math.random(9),math.random(9),math.random(9),14105,5000);
		eq.unique_spawn(75194,0,0,474,1230,-37,128); -- spawn avatar of dread
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:paineel  ID:75071 -- Nivold_Predd 
