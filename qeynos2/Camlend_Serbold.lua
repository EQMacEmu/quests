function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("I say, good to meet you, " .. e.other:GetCleanName() .. "!  I am Camlend Serbold.  Some call me Serbold the Great.  I am the leader of the righteous order of paladins which serves the Temple of Life.  Together with the clerics of this temple, we defend the will of the great [Rodcet Nife] and smite all who dare to oppose us.");
	elseif(e.message:findi("rodcet")) then
		e.self:Say("Do you feel your heart beating within your chest?  It is Rodcet Nife, the Prime Healer, whose breath keeps it in perfect rhythm.  If you do not pray to His glory then I assure you, someday when your heart begins to slow, you shall be crying out loud to Rodcet Nife.");
	elseif(e.message:findi("bloodsaber")) then
		e.self:Say("So you have heard the name of the Bloodsabers?!  They are the followers of Bertoxxulous.  We have heard rumors of their existence within the city.  We have yet to find any of his followers inside the walls of Qeynos.  As for beyond the walls, there are some...");
	elseif(e.message:findi("bertox")) then
		e.self:Say("You'd best whisper that vile name within these walls!  The Lord of Disease has no place in our temple.  His hand has reached far enough into our lands.  We must cut it off!");
	elseif(e.message:findi("lord grimrot")) then
		e.self:Say("You have heard of Lord Grimrot? He is a shadowknight working with the Bloodsabers. We have word he is trying to build an army of undead. Only a powerful knight can rid the lands of Grimrot. So, did you come here to [defend life]?");
	elseif(e.message:findi("linarius")) then
		e.self:Say("Captain Linarius Graffe is the captain of the tower guards outside Qeynos.  He is headquartered in a bridge keep in the Plains of Karana.  He often informs the local guild of any activity which may be of concern to us.");
	elseif(e.message:findi("defend life")) then
		if(e.other:GetFactionValue(e.self) >= 1000) then -- high warmly
			e.self:Say("Then go to the Plains of Karana. Somewhere there, Lord Grimrot is hatching his little plan for the Bloodsabers. Bring me his evil scythe and his heart. It is said that upon his death, his soul will be absorbed into this weapon of darkness. Do this and be rewarded.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Temple of Life smiles upon you, friend...  but such a delicate matter can only be entrusted to our most loyal members.");
		else
			e.self:Say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");		
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local fac = e.other:GetFaction(e.self);
	local text = "We must have both Lord Grimrot's scythe, Pestilence, and his misshapen heart.";

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18711},0)) then -- Tattered Note
		e.self:Say("Welcome to the Temple of Life. You have much to learn and we have much work to do. Pain, hurt, disease and death lurk everywhere, our job is seemingly endless, but none is more gratifying. Here is our guild tunic, represent us well. Davloran Girionlis will help you to get started.");
		e.other:Faction(e.self,341,100,0); -- Priest of Life
		e.other:Faction(e.self,280,30,0); -- Knight of Thunder
		e.other:Faction(e.self,262,50,0); -- Guards of Qeynos
		e.other:Faction(e.self,221,-25,0); -- Bloodsabers
		e.other:Faction(e.self,219,15,0); -- Antonius Bayle
		e.other:QuestReward(e.self,0,0,0,0,13506,100); -- Faded Tunic*
	-- Require kindly or greater faction 
	elseif(e.other:GetFactionValue(e.self) >= 1000 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13324,item2 = 13325},1,text)) then -- Pestilence Scythe ID: 13324 # Decaying Heart ID: 13325 -- high warmly
		e.self:Say("We thank you for your service. With Lord Grimrot's evil soul trapped in this scythe, all but the truly evil shadowknights would be able to wield it. I would like to present you with this as a token of our appreciation. Your devotion to life is supreme. Go now, and serve life.");
		-- confirmed live factions
		e.other:Faction(e.self,341,5,0); -- Priest of Life
		e.other:Faction(e.self,280,1,0); -- Knight of Thunder
		e.other:Faction(e.self,262,2,0); -- Guards of Qeynos
		e.other:Faction(e.self,221,-1,0); -- Bloodsabers
		e.other:Faction(e.self,219,1,0); -- Antonius Bayle
		e.other:QuestReward(e.self,0,0,0,math.random(5),12238,1000); -- Aegis of Life ID: 12238
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:qeynos2 ID:2092 -- Camlend_Serbold
