--Loveal_S-Nez.pl
--Sir Lindeal's Testimony/Thex Mallet/SK Trainer

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("What is this I see before me? A would-be hero of the Dead? You reek of false bravado. I have seen others much stronger than you meet their fate at the end of a blade. I see no reason to continue our conversation. How can one such as you assist with my [delegated duties]?");
	elseif(e.message:findi("delegated duties")) then
		e.self:Say("Why do you ask? I know why. Glory has captured your affections. Those who seek glory find death. Still, you may be of some use. Before I assign you a task, I must be assured of your power. I require you to [perform a test].");
	elseif(e.message:findi("perform a test")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("In the Lavastorm Mountain Range there have been sightings of a paladin, one Sir Lindeal. He has compromised our routes between.. well, that is none of your concern. All you need to know is that this paladin of the Temple of Marr must be sent to his everlasting life. Do so and prove your worth to us. I await your proof. Use no assistance. If you are truly his equal then I shall know. I know all.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you learn to serve the Dead, then I will find the time to speak of such things.");
		else
			e.self:Say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");		
		end
	elseif(e.message:findi("appointed tasks")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Very well. You have gained the appropriate power. I require you to journey to the Commonlands and seek out Kizdean Gix. He is a member of a very important force. Tell him 'Utalk Adarev Otcin'. Remember this password.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you learn to serve the Dead, then I will find the time to speak of such things.");
		else
			e.self:Say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");		
		end
	elseif(e.message:findi("Thex Mallet")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("All you can know is that the Thex Mallet is desired by our Queen. If we are not successful in its retrieval, it will be our heads which adorn her trophy room. We have learned its location and believe it to be broken into three separate pieces.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you learn to serve the Dead, then I will find the time to speak of such things.");
		else
			e.self:Say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");		
		end
	elseif(e.message:findi("queen")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("The Queen of the Teir'Dal is the most powerful of all. It is she who should sit on the throne and not King Naythox. The Dead are her humble servants. We await the day when she shall finally take her rightful position as ruler of Neriak.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you learn to serve the Dead, then I will find the time to speak of such things.");
		else
			e.self:Say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");		
		end
	elseif(e.message:findi("king")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("A competent and powerful warrior, but a warrior nonetheless. He has suppressed the true glory of the Teir'Dal. Perhaps it is time for a new ruler of Neriak.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you learn to serve the Dead, then I will find the time to speak of such things.");
		else
			e.self:Say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");		
		end
	elseif(e.message:findi("innoruuk")) then
		e.self:Say("He is the Prince of Hate. We are His vessels of destruction. There are no greater servants of Innoruuk than the Dead. His word is law. Once the Teir'Dal obtain the second half of the [scroll of G'han], all Norrath shall be enveloped by His glorious hate.");
	elseif(e.message:findi("scroll")) then
		e.self:Say("The scroll of G'han was scribed long ago by the great necromancer G'han. With it, we can commune directly with Innoruuk. Unfortunately, one portion of the scroll was taken from us by a rogue who was hired by the Koada'Dal. In Felwithe, it doth lie. The Indigo Brotherhood now attempts to reclaim it.");
	elseif(e.message:findi("koada") or e.message:findi("fier")) then
		e.self:Say("Have you not been educated in the ancient elven language? The three races of elvenkind are designated thus: Teir'Dal are dark elves, Koada'Dal are high elves and Feir'Dal are wood elves.");
	end
end
function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18828})) then--Testimony
		e.self:Say("So you have succeeded where others have failed. You show promise. Take this then. You shall be a valuable asset to the Dead and soon this shall be of value to one so great. This will help you on your way. Are you still interested in my [appointed tasks]?");
		e.other:Faction(e.self,239,25); --The Dead
		e.other:Faction(e.self,303,3); --Queen Cristanos Thex
		e.other:Faction(e.self,278,-3); --King Naythox Thex
		e.other:Faction(e.self,275,-3); --Keepers of Art
		e.other:Faction(e.self,245,-3); --Eldritch Collective
		e.other:Faction(e.self,1522,-50); --Primordial Malice
		e.other:QuestReward(e.self,0,0,5,1,2317,33750); --Cloak of the Undead Eye
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13390})) then--Thex Mallet
		e.self:Say("Oh how grand it is!! Look at it!! I feel the power trembling within. Who would have thought such an item would be abandoned? You have performed supremely. Queen Cristanos shall reward me greatly and I shall reward you greatly. Here is my weapon from years past.. the Reaper of the Dead. I believe it has one soul still trapped within.");
		e.other:Faction(e.self,239,100); --The Dead
		e.other:Faction(e.self,303,15); --Queen Cristanos Thex
		e.other:Faction(e.self,278,-15); --King Naythox Thex
		e.other:Faction(e.self,275,-15); --Keepers of Art
		e.other:Faction(e.self,245,-15); --Eldritch Collective
		e.other:Faction(e.self,1522,-200); --Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,5374,33750); --Reaper of the Dead
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakc  ID:42043 -- Loveal_S`Nez
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
