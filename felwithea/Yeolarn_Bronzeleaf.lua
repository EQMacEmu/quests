function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("Hail, " .. e.other:GetCleanName() .. "! We of Tunare are charged with protecting the Great Mother from the forces of Innoruuk. Even now, the evil minions of this foul deity are despoiling our great forest. Will you help us [protect the Mother]?");
		else
			e.self:Say("One such as yourself has nothing to offer the Clerics of Tunare. Remove yourself from this sacred temple!");
		end
	elseif(e.message:findi("protect")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Just outside the gates of Felwithe, the forces of Innoruuk gather in the guise of decaying skeletons. Bring me four sets of bone chips as proof of your vigilance. I assure you, your faith shall not go unrewarded.");
		else
			e.self:Say("One such as yourself has nothing to offer the Clerics of Tunare. Remove yourself from this sacred temple!");
		end
	elseif(e.message:findi("initiate of tunare")) then -- no faction requirement for these 3 lines below -- or at least apprehensive worked
		if(eq.is_the_ruins_of_kunark_enabled()) then
			e.self:Say("The Teir'Dal behind the undead plague in our forest have discovered a means of creating a terrible undead called a Ghast. These Ghasts have been sighted in the Lesser Faydark and must be destroyed. Bring me four of the vile creatures hearts.");
		else
			e.self:Say("This is not available to you yet, come back later."); --made up
		end		
	elseif(e.message:findi("slay the necromancer")) then
		if(eq.is_the_ruins_of_kunark_enabled()) then
			e.self:Say("The Fier'Dal rangers that inhabit the Lesser Faydark have spotted a courier making deliveries to the Teir'Dal camp near Castle Mistmoore and to a necromancer that lingers near the ancient obelisk. We believe that the crates he carries are supplies needed for the creation of more Ghasts. Another shipment should be arriving soon. Seek out the necromancer at the obelisk and take his head then take the head of the courier and return them to me with the crate that the courier carries and your Initiate Symbol of Tunare.");
		else
			e.self:Say("This is not available to you yet, come back later."); --made up
		end	
	elseif(e.message:findi("warden of tunare")) then
		if(eq.is_the_scars_of_velious_enabled()) then
			e.self:Say("The crate that the you recovered from the Courier contained this black candlestick that radiates an aura of great magical power. I request that you deliver the candlestick to Lady Trilani who is studying with the High Men in Erudin. Perhaps she can divine the nature of the candlestick and offer aid in defeating its power. The remaining contents of the crate have been given to Crusader Swiftmoon to be delivered to a gnome in steamfont that is purchasing them on behalf of the Eldrich Collective. When you return be sure to present your Disciple Symbol to me with anything that Trilani may ask you to deliver.");
			e.other:SummonCursorItem(1598); -- Black Stone Candlestick
		else
			e.self:Say("This is not available to you yet, come back later."); --made up
		end	
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "I requested four Ghast hearts!";

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13073,item2 = 13073,item3 = 13073,item4 = 13073})) then --Bone Chips x 4
		if(eq.is_the_ruins_of_kunark_enabled()) then
			e.self:Say("Praise Tunare! I knew you would be victorious. I reward you with this spell, and pray that it will help you in your fight against the unholy forces of Innoruuk. When you are ready you will make a fine [Initiate of Tunare].");
			e.other:Faction(e.self,226,2,0);  --Clerics of Tunare
			e.other:Faction(e.self,279,2,0); --King Tearis Thex
			e.other:Faction(e.self,5002,1,0);   --Anti-mage
			e.other:QuestReward(e.self,0,0,0,0,15014,250); --Spell: Strike , Verified experience reward live data
		else
			e.self:Say("Praise Tunare! I knew you would be victorious. I reward you with this spell, and pray that it will help you in your fight against the unholy forces of Innoruuk."); --made up dialogue
			e.other:Faction(e.self,226,2,0);  --Clerics of Tunare
			e.other:Faction(e.self,279,2,0); --King Tearis Thex
			e.other:Faction(e.self,5002,1,0);   --Anti-mage
			e.other:QuestReward(e.self,0,0,0,0,15014,250); --Spell: Strike , Verified experience reward live data
		end
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10199,item2 = 10199,item3 = 10199,item4 = 10199},1,text1)) then --Putrescent Heart x 4
		e.self:Say("Praise Tunare!! You have done well young Initiate. Here the symbol of your station within our faith. Return to me when you are ready to [slay the necromancer] that has been creating the undead.");
		e.other:Faction(e.self,226,15,0);  --Clerics of Tunare
		e.other:Faction(e.self,279,15,0); --King Tearis Thex
		e.other:Faction(e.self,5002,11,0);   --Anti-mage
		e.other:QuestReward(e.self,0,0,0,0,1570,3250); --Initiate Symbol of Tunare
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1570,item2 = 12514,item3 = 19065,item4 = 12513})) then --Initiate Symbol of Tunare, Larik Z`Vole's Head, Teir`Dal Couriers Head, Teir`Dal Crate
		if(eq.is_the_scars_of_velious_enabled()) then
			e.self:Say("Praise Tunare! The Mother smiles on you this day Disciple " .. e.other:GetCleanName() .. "! I present you with the symbol of your new station among the Priests of Tunare. Return to me when you are ready to become a [Warden of Tunare]?");
			e.other:Faction(e.self,226,30,0);  --Clerics of Tunare
			e.other:Faction(e.self,279,30,0); --King Tearis Thex
			e.other:Faction(e.self,5002,22,0);   --Anti-mage
			e.other:QuestReward(e.self,0,0,0,0,1571,4000); -- Disciple Symbol of Tunare
		else
			e.self:Say("Praise Tunare! The Mother smiles on you this day Disciple " .. e.other:GetCleanName() .. "! I present you with the symbol of your new station among the Priests of Tunare. Return to me at a later time and we can discuss what to do next."); -- made up text
			e.other:Faction(e.self,226,30,0);  --Clerics of Tunare
			e.other:Faction(e.self,279,30,0); --King Tearis Thex
			e.other:Faction(e.self,5002,22,0);   --Anti-mage
			e.other:QuestReward(e.self,0,0,0,0,1571,4000); -- Disciple Symbol of Tunare		
		end
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1571,item2 = 1599})) then --Disciple Symbol of Tunare, Powder of Unanimation
		e.self:Say("Praise Tunare!! I will have our sorcerers examine this power immediately to see if we can reproduce it in quantities enough to eliminate the undead plague. I award you the rank of Warden of Tunare, the All Mother smiles upon you, " .. e.other:GetCleanName() .. "!");
		e.other:Faction(e.self,226,40,0);  --Clerics of Tunare
		e.other:Faction(e.self,279,40,0); --King Tearis Thex
		e.other:Faction(e.self,5002,30,0);   --Anti-mage
		e.other:QuestReward(e.self,0,0,0,0,1572,5000); -- Warden Symbol of Tunare
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18780})) then --Tattered Note
		e.self:Say("Welcome, friend, to the Clerics of Tunare. I am Yeolarn Bronzeleaf, head of the guild and devout follower of Tunare. Here is your guild tunic - it will help to protect you against this world's evils.");
		e.other:Faction(e.self,226,100,0);  --Clerics of Tunare
		e.other:Faction(e.self,279,100,0); --King Tearis Thex
		e.other:Faction(e.self,5002,75,0);   --Anti-mage
		e.other:QuestReward(e.self,0,0,0,0,13590,20); --Faded Gold Training Tunic*
	else
		e.self:Say("Your faith has not grown strong enough to undertake that task young one.");
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:felwithea  ID:61025 -- Yeolarn_Bronzeleaf.pl
