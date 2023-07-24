function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Temple of Life, " .. e.other:GetCleanName() .. ". It is here that you may pay tribute to the [Prime Healer]. Does not your heart beat with the sound of life?  It is He who makes it so. Do not let the hand of [Bertoxxulous] and his [new disease] lay upon your soul or, like so many, you shall meet your fate at the end of my sword!");
	elseif(e.message:findi("Bertoxxulous")) then
		e.self:Say("The one who spawned all the diseases and imperfections of the lands of Norrath. Do not seek his wisdom, for there is none. Do not become part of his [new disease].");
	elseif(e.message:findi("new disease")) then
		e.self:Say("The new disease I speak of is called the [Bloodsabers]. They are the loyal followers of Bertoxxulous and as such have been condemned by our temple. Do you wish to [join the fight]?");
	elseif(e.message:findi("Bloodsabers")) then
		e.self:Say("If I knew where they were, there would be no reason to employ your talents. They would be extinct!");
	elseif(e.message:findi("join the fight")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Then seek out those who worship the Plaguebringer.  End their threat!  Each member has upon them the mark of the Bloodsabers, a [rat-shaped ring]. I shall reward all those who return such rings to me.");
		else
			e.self:Say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");			
		end
	elseif(e.message:findi("rat-shaped ring") or e.message:findi("rat shaped ring")) then
		e.self:Say("A rat-shaped ring, you say? That is the sign of the [new disease].");
	elseif(e.message:findi("Prime Healer") or e.message:findi("Rodcet Nife")) then
		e.self:Say("He is the sustainer of life. The hand which supports us when we begin to slow down. Rodcet Nife, the Prime Healer! He is why we exist.");		
	elseif(e.message:findi("trintle.* attack")) then
		e.self:Say("Impossible!! What madness do you speak of!!? If he did he must have had a reason. Maybe Trintle had been tainted by the words of Bertoxxulous..?");
	elseif(e.message:findi("heal")) then
		e.self:Say("I cannot help you with your request.   You must speak with Brother Tonmerk Plorsin.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13301})) then
		e.self:Say("You have cleansed Norrath of another follower of the Plaguebringer. You have done well. Take this reward and continue your search for others who wear this ring.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,341,5,0); -- Priests of Life
		e.other:Faction(e.self,280,1,0); -- Knights of Thunder
		e.other:Faction(e.self,262,2,0); -- Guards of Qeynos
		e.other:Faction(e.self,221,-1,0); -- Bloodsabers
		e.other:Faction(e.self,219,1,0); -- Antonius Bayle
		e.other:QuestReward(e.self,math.random(10),math.random(10),0,0,0,1000);
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13908})) then
		e.self:Say("This is not good. Hmph. It appears they are shattered. For the first time one of our members has been swayed. I reward you for your deed. Also, if you have found anything upon Trintle, let me know.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,341,5,0); -- Priests of Life
		e.other:Faction(e.self,280,1,0); -- Knights of Thunder
		e.other:Faction(e.self,262,2,0); -- Guards of Qeynos
		e.other:Faction(e.self,221,-1,0); -- Bloodsabers
		e.other:Faction(e.self,219,1,0); -- Antonius Bayle
		e.other:QuestReward(e.self,math.random(10),math.random(10),0,0,0,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos2  ID:2048 -- Suuspa_Clanim
