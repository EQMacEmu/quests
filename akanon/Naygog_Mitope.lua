-- Converted to .lua by Speedz

function event_say(e)
	if(eq.is_the_shadows_of_luclin_enabled()) then
		if(e.message:findi("hail")) then
			e.self:Say("Hail " .. e.other:GetCleanName() .. ". I train those young gnomes who wish to [serve as a warrior] in the service of the Dark Reflection and our patron, Bertoxxulous the Plaguelord. Decay and destruction are powerful forces that influence Norrath. It is the duty of the Warriors of the Dark Reflection to bring destruction to the weak and injury to the strong so that our fellow gnomes may be reminded of their own mortality and new strong individuals may rise to power before Bertoxxulous decides it is their time to decay and be replaced like countless before them.");
			e.self:DoAnim(67);
		elseif(e.message:findi("serve as a warrior")) then
			e.self:Say("Ours is the duty of a martyr, to be the hated and feared hand of destruction and catalyst of change. All roads are paved with destruction and in turn are eventually destroyed. All machines are built from the rubble of broken mountains and in turn become rust and bits of metal. You must outfit yourself with the tools of a warrior, crafted from the destruction of archaic clockworks that have long since finished serving the purpose for which they were built. Take this parchment to Windlebeck Tobokog, he will assist you in the construction of a suit of armor. When you have been properly outfitted return to me for [further instruction].");
			e.other:SummonCursorItem(10986); -- Item: Parchment to Windlebeck
		elseif(e.message:findi("further instruction")) then
			e.self:Say("It is one thing to destroy the artificial life of a clockwork. It is another thing entirely to claim the life of another gnome. There is a member of the Dark Reflection, Yulcabis, who has been assigned to a task in the Steamfont Mountains. He has failed repeatedly in the tasks assigned to him in the past and has become a burden to the Dark Reflection. Find Yulcabis and slay him. Return to me with the weapon he carries.");
		elseif(e.message:findi("armor")) then
			e.self:Say("Armor? For a warrior? Oh yes. You'll need to speak with Windlebeck for that.");
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("Hail " .. e.other:GetCleanName() .. ". I train those young gnomes who wish to serve as a warrior in the service of the Dark Reflection and our patron, Bertoxxulous the Plaguelord. Decay and destruction are powerful forces that influence Norrath. It is the duty of the Warriors of the Dark Reflection to bring destruction to the weak and injury to the strong so that our fellow gnomes may be reminded of their own mortality and new strong individuals may rise to power before Bertoxxulous decides it is their time to decay and be replaced like countless before them.");	-- text not accurate
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10990})) then -- Yulcabis's axe
		e.self:Say("Well done " .. e.other:GetCleanName() .. ". Take this Dull Dark Reflection Axe and sharpen it in a forge with a sharpening stone. It may take several attempts if you are unfamiliar with the process. Once the axe has been sharpened take it to Clockwork SmithXIII with a Coyote Pelt and he will put the finishing touches on the weapon.");
		e.other:Faction(e.self,238,10,0); 	-- Dark reflection
		e.other:Faction(e.self,245,-1,0); 	-- eldritch collective
		e.other:Faction(e.self,255,-1,0); -- gem choppers
		e.other:Faction(e.self,240,-1,0); 	-- Deepmuses
		e.other:QuestReward(e.self,0,0,0,0,10995,100);	-- Dull Dark Reflection Axe
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 18759})) then -- Stained Parchment
		e.self:Say("This is fabulous news!!  You have done well, young one. Once you are ready for [further instruction] please let me know, I will guide you through your early and most dangerous days. When you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks.");
		e.other:Faction(e.self,238,100,0); 	-- Dark reflection
		e.other:Faction(e.self,245,-10,0); 	-- eldritch collective
		e.other:Faction(e.self,255,-10,0); -- gem choppers
		e.other:Faction(e.self,240,-10,0); 	-- Deepmuses
		e.other:QuestReward(e.self,0,0,0,0,13518,20);	-- Tin Patched Tunic*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
