function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then -- need exact faction, only tested 0 (indiff) and scowls
			e.self:Say("Welcome! It is good to see our disciples can still outsmart the guards of Qeynos and make it to the Shrine of Bertoxxulous. Our ranks are best filled with disciples such as yourself. We have need of you. Do you wish to serve the Lord of Disease or not?");
		else
			e.self:Say("The lair of the Bloodsabers is no place for you...  begone, or be dead!");	
		end
	elseif(e.message:findi("wish.* serve")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Aye! That is good. Of late, we have heard news of a message that will be sent to the Treefolk of the Jaggedpine. Antonius Bayle will send word to the Jaggedpine that certain requests will be met. We must intercept this message. That is all you need to know. Go and find Antonius Bayle's messenger, Gharin, He should have the message. Get it by any means necessary and return it to me. Go now!");
		else
			e.self:Say("The lair of the Bloodsabers is no place for you...  begone, or be dead!");	
		end
	elseif(e.message:findi("or not")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("We are not in the business of providing safe haven for cowards. Begone, and may your courage be found amongst the dead!");	
		else
			e.self:Say("The lair of the Bloodsabers is no place for you...  begone, or be dead!");	
		end
	end
end

function event_trade(e)
	local item_lib =require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18807})) then -- Sealed Letter [Note To Jaggedpine - real]
		e.self:Say("Good work, child of the plague. Now take this forged note to Te'Anara of the Jaggedpine Treefolk. Be sure to watch your back, now. The guards of Qeynos surely know who you are by now. They will not stop to ask questions.");
		-- confirmed live factions
		e.other:Faction(e.self,221,50); -- Bloodsabers
		e.other:Faction(e.self,262,-7); -- Guards of Qeynos
		e.other:Faction(e.self,296,5); -- Opal Dark Briar
		e.other:Faction(e.self,341,-12); -- Priest of Life
		e.other:Faction(e.self,230,2); -- Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,math.random(10),0,0,18806,100); -- Sealed Letter [Note To Jaggedpine - fake]
	end
	item_lib.return_items(e.self, e.other, e.trade)
end	
