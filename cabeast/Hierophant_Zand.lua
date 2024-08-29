--Heirophant Zand starts and ends The Penance quest. This allows a young iksar to replace their guild's starting item if they've lost it. She is also for the 3rd and 5th shaman skullcap quests.

function event_say(e)
	if(e.message:findi("chosen savior")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("I am honored to meet the one who shall pledge his life to the return of the Skulls of the Ancients. However, I must see proof of our prowess as of yet. Go to the outlands and retrieve one Froglok Hexdoll, and no, they are not found on Frogloks. They are shaman dolls made by the goblin tribe.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You will only obtain that which you seek by assisting the wills of the Scaled Mystics.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));		
		end
	elseif(e.message:findi("hail")) then
		e.self:Emote("raises his hand and looks up.  'May the wisdom of the ancients lead your soul to suffering and everlasting pain.  Such is the will of Cazic-Thule.  I see something in your eyes, Hatz.  Have you lost something... your cudgel perhaps?");
	elseif(e.message:findi("no")) then
		e.self:Say("That is good to hear.  Continue to follow the path of pain.  Suffering awaits.");
	elseif(e.message:findi("yes")) then 		--The Penance quest
		e.self:Say("That is most unfortunate for you.  Your suffering will be extended on this plane, until you find your way back to us. Take this and read it on your way to speak with the Toilmaster.  He will guide you.  Yesssss...' You feel as if something is peering at you from behind the speaker's soulless eyes as the last letter he speaks transforms into a sigh."); 
		e.other:SummonCursorItem(18271); 				--A Ragged Book
	elseif(e.message:findi("skulls of di nozok")) then -- shrug emote
		e.self:Say("What?! I have read of them, but that is all I know of the legendary mystic, err, mystics... whatever! Where their remains rest is a mystery, but those filthy goblins always seem to get ahold of things that are lost, all that infernal digging you see.");
		e.self:DoAnim(65);
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "seems to black out, and then recover. He speaks with the voice of an ancient. 'We are Dai and Die and we await our skulls and your iron cudgel of the prophet. Become a channeler.";	
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18272, item2 = 24770})) then --The Penance quest --faction hits not confirmed
		e.self:Emote("takes the bag and tome from you and in return gives you the item that you have been thinking of all of this time. 'Lucky you. You have earned a second chance. Praise Cazic-Thule!'");
		e.other:Faction(e.self,445, 100); 				--Scaled Mystics
		e.other:Faction(e.self,441, 25); 				--Legion of Cabilis
		e.other:QuestReward(e.self,1,1,0,0,5140); 				--Iron Cudgel of the Petitioner
	end
	--Shaman Skull Quest No.3.1 turn in - Check for  A froglok hex doll
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12734})) then
		e.self:Say("Fine work! I hope for your sake, you did not purchase it from a brave adventurer. Take this note to the one for whom it is written. This lizard has knowledge of a large number of skulls.");
		e.other:Faction(e.self,445, 10); 				--Scaled Mystics
		e.other:Faction(e.self,441, 10); 				--Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,5,18054,80000); 	--A note to take to crusader Quarg.
	--Shaman Skull Quest No.5 turn in - Iksar Skull Helm and Iksar Skull and Cudgel of the Prophet
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12741, item2 = 5144, item3 = 12740},1,nil,text1)) then
		e.self:Emote("closes his eyes and reopens them. They have no pupils. He speaks and you hear his voice echo. 'We are Di Nozok. You have earned the weapon of a channeler. We hope to fill your thoughts with ours some day. Go and seek out Dexl. We send you to him. Farewell , Channeler of Cabilis.");
		e.other:Faction(e.self,445, 20); 				--Scaled Mystics
		e.other:Faction(e.self,441, 5); 				--Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,10,5145,120000); 	--Give the player The Cudgel of the Channeler
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
