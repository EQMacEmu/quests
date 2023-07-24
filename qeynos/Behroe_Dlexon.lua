function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -200) then -- verified faction amount
			e.self:Say("Ah, greetings, " .. e.other:GetCleanName() .. "!  How are you this evening?  Hopefully, you are faring much better than I..  I'm stuck on the night watch here, and never get to see my lovely [Aenia].  Ah..  she is so sweet..  I wrote her this beautiful [ballad], but I fear she may never hear it.");
		else
			e.self:Say("The League of Antonican Bards is very displeased with your recent actions.   And I don't particularly care for you, or your stench, either!");
		end	
	elseif(e.message:findi("aenia")) then
		if(e.other:GetFactionValue(e.self) >= 50) then
			e.self:Say("Aenia lives in North Qeynos in a little blue house near the Temple of Life with her overprotective father.  Last time he caught me there, he nearly killed me!");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The League of Antonican Bards recognizes your past deeds, and appreciates what you have done for them. But, you must prove your dedication some more... I will say this, you are on the right track to earning our trust, friend.");
		else
			e.self:Say("The League of Antonican Bards is very displeased with your recent actions.   And I don't particularly care for you, or your stench, either!");
		end	
	elseif(e.message:findi("ballad")) then
		if(e.other:GetFactionValue(e.self) >= 50) then 	
			e.self:Say("I wrote this little song for my dearest Aenia, but I can't sing it to her because I'm stuck here on watch duty.  You have a nice voice, " .. e.other:GetCleanName() .. ", maybe you could go and sing my song to her for me, huh?  Just make sure you don't sing to Aenia when her father's around, 'cause like I said, he's already tried to kill me for seeing her.");
			e.other:SummonCursorItem(18026); -- Item: The Thornless Rose
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The League of Antonican Bards recognizes your past deeds, and appreciates what you have done for them. But, you must prove your dedication some more... I will say this, you are on the right track to earning our trust, friend.");
		else
			e.self:Say("The League of Antonican Bards is very displeased with your recent actions.   And I don't particularly care for you, or your stench, either!");
		end	
	end
end

function event_trade(e)
	local item_lib =require("items");

	if(e.other:GetFactionValue(e.self) >= 50 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18027})) then
		e.self:Say("Ah, thank you, kind " .. e.other:GetCleanName() .. ".  You've made two foolish lovebirds very happy.  Please, take this..  Though it is not much, it will help keep you warm on those chilly Karana nights.  It is very good to have a friend such as yourself, and I will one day repay you for your kindness and generosity.");
		-- confirmed live factions
		e.other:Faction(e.self,284,8,0); -- Faction: League of Antonican Bards
		e.other:Faction(e.self,281,1,0); -- Faction: Knights of Truth
		e.other:Faction(e.self,262,1,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,304,-1,0); -- Faction: Ring of Scale
		e.other:Faction(e.self,285,-1,0); -- Faction: Mayong Mistmoore
		e.other:QuestReward(e.self,0,0,0,0,1055,250) -- Shawl of the Wind Spirit
	elseif(e.other:GetFactionValue(e.self) >= 50 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18021})) then
		e.self:Emote("yawns and says, 'Oh, report time already again?  Yeah, here ya go, " .. e.other:GetCleanName() .. ".  Be careful around here at night, I've been seeing some rough looking characters lurking about.");
		-- confirmed live factions
		e.other:Faction(e.self,284,10,0); -- Faction: League of Antonican Bards
		e.other:Faction(e.self,281,1,0); -- Faction: Knights of Truth
		e.other:Faction(e.self,262,1,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,304,-1,0); -- Faction: Ring of Scale
		e.other:Faction(e.self,285,-1,0); -- Faction: Mayong Mistmoore
		e.other:QuestReward(e.self,0,0,0,0,18023,250); -- Item: Behroes Report
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text)
end

function event_death_complete(e)
	e.self:Say("Your actions will not go unnoticed! The League of Antonican Bards has many members all over this continent.");
end
