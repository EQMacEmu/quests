function event_say(e)
	if(eq.is_the_shadows_of_luclin_enabled()) then
		if(e.message:findi("hail")) then
			e.self:Emote('shows no reaction to your greeting.');
		elseif(e.message:findi("trial of agility")) then
			e.self:Say('I knew you were not the whiff others claimed you to be, are you sure you are [ready] to be tested in agility?');
		elseif(e.message:findi("ready")) then
			if(e.other:GetFactionValue(e.self) >= 100) then
				e.self:Say('We shall spar then, I hope you are as prepared as you think you are.');
				e.self:CastSpell(2064,e.other:GetID(),0,1); -- Spell: Cabilis Sending
			elseif(e.other:GetFactionValue(e.self) >= 0) then
				e.self:Say("The Swifttail Caste desires further service before I can share this with you.");
			else
				e.self:Say("Leave at once!  I will warn you no longer.  You are no friend to the Swifttail Caste.");
			end
		end
	else
		if(e.message:findi("hail")) then
			e.self:Emote('shows no reaction to your greeting.');
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "sits, his eyes still closed, and tilts his head in confusion. He then sighs and shakes his head implying disappointment. You suddenly realize that the old master asked for the mole's collar and two star rubies.";	
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18204})) then -- Guild Summons
		e.self:Emote('breaks his meditation and quickly grabs your forearms. You feel the raw power in his heavily callused hands. Out of nowhere, his tail sweeps forward and places a shackle upon your wrist. He then points south towards Master Bain and returns to his meditation.');
		e.other:Faction(e.self,444,200); 	--Swift Tails
		e.other:Faction(e.self,441,50); 	--Legion of Cabilis
		-- Confirmed Live Experience and Faction
		e.other:QuestReward(e.self,{itemid = 4190,exp = 1000});	-- Shackle of Dust
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14788})) then
		e.self:Emote("sits whispering incoherently for a long moment before even regarding the note you dropped in front of him. The Grand Master suddenly snatches up the note from Xlixinar, removes a small charcoal marker from a belt pouch, and scrawls some intructions upon it. He drops the note immediately after finishing and resumes his meditation without a word.");
		e.other:QuestReward(e.self,0,0,0,0,18980); -- Item: Note from Glox
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14782, item2 = 10032, item3 = 10032},1,nil,text1)) then
		e.self:Emote("nods slightly");
		e.other:QuestReward(e.self,0,0,0,0,14783,10000); -- Item: Glox Reference
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
