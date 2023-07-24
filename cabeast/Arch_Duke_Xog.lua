function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("These are the sacred unholy grounds of the Crusaders of Greenmist and the Scaled Mystics. If you do not belong to us, you must leave this temple at once or learn great suffering in the name of Cazic-Thule.");
	elseif(e.message:findi("greenmist")) then		--Test of the Lord (Greenmist Quest 7/8)
		e.self:Emote("appears surprised at your words. 'You know of Greenmist? The Unholy Khukri of Rile? We once had knowledge of this weapon, but when our great cities were destroyed in 1056 A.G., so, too, were all the great libraries. We lost all records. An explorer named [Argest] claimed to have found one library still intact. Pure babble.'");
	elseif(e.message:findi("who is argest")) then 			--Test of the Lord (Greenmist Quest 7/8)
		e.self:Say("Once a Lord of Pain, Argest is now a great explorer. No lizard has seen more of Kunark than he. He returned one season ago to tell tales of an [ancient library]. He said that he believed that there he would find a tome which would reveal the location of the ancient crusader weapon, Greenmist.");
	elseif(e.message:findi("ancient")) then --Test of the Lord (Greenmist Quest 7/8)
		e.self:Say("There are many ancient libraries yet to be discovered. Our once great cities have been decimated, if not by our foes, then by nature itself. Within the outlands are many ruins which have yet to reveal themselves. We look forward to the discovery of these ruins by such explorers as Lord Argest the Great. If only we knew [where] he was...");
	elseif(e.message:findi("where is argest")) then 			--Test of the Lord (Greenmist Quest 7/8)
		e.self:Emote("becomes despondent at your question. 'Alas, our chance of locating Greenmist is lost as long as Argest remains missing. Reports have come in from the Legion's deep range patrols that he may be in the Frontier Mountain range. At least, that is where the patrol captain found Argest's walking staff. He might have been captured, killed or even digested!!'");
	elseif(e.message:findi("strange iksar")) then
		e.self:Say("Yes, he was dressed in rags and hadn't eaten in days. He rambled on about seemingly nothing, obviously he had lost his mind at some point. The guards brought him in because he told them he had valuable information concerning a captured Crusader. According to the mad man, our missing knight was captured by a group of cultists that follow a false god. The cultists intend on converting him apparently. Your [test] will concern Geanik.");
	elseif(e.message:findi("test")) then
		e.self:Say("Learning Righteousness is learning to listen to one's own heart. At all times our Lord of Fear speaks to us. Our heart is through which he speaks. If we are pure in action and undistracted in mind we can hear the very words of our Father. Your test will be to find our lost Crusader. When you find him you must listen, and act based on what you hear. If your actions are Righteous, I will give you my reference. Bring me proof of your action and two sapphires.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "Where is the rest, maggot?! I said the traitor's head and two star rubies!";
	local text2 = "Where is the rest, maggot?! I said proof of your action and two sapphires!";	
	local text3 = "A true crusader would have brought to me what I requested. The Hero Khukri and the Tome of Vok Na Zov.";	
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18205})) then 				--Guild Summon  Test of the Newbie (Greenmist Quest 0/8)
		e.self:Say("Welcome into our brotherhood. Know you that our way is the way of pain. Do as we say and you shall climb the rungs of knighthood. Listen well to the Lords of Pain within this temple and follow the words of the hierophants, for Cazic-Thule speaks to us through them. Take this khukri. It is the chosen weapon of the Crusaders and can deliver great pain unto our foes. Go now and learn our ways. Seek out Lord Gikzic.");
		e.other:Faction(e.self,442,100); 	--Crusader of Greenmist
		e.other:Faction(e.self,441,25); 	--Legion of Cabilis
		-- Confirmed Live Experience and Faction
		e.other:QuestReward(e.self,math.random(10),math.random(3),0,0,5120,200);	--Pawn's Khukri
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18051, item2 = 5126},1,text3)) then --Test of the Lord (Greenmist Quest 7/8)
		e.self:Say("A legible tome of the scrolls of Vok Na Zov! What a find this is!! May the unholy curses of Cazic flow through you. Please accept the weapon of a Lord of Pain. To abandon it is to abandon our ways and earn yourself the hatred of our order.");
		e.other:Faction(e.self,442,10); -- Faction: Crusaders of Greenmist
		e.other:Faction(e.self,441,2); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,math.random(8),5128,25000); -- Item: Lord of Pain's Khukri
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14791})) then 				--Trooper Scale Bracers quest
		e.self:Emote(" takes the note and glances at it briefly then lets out a heavy sigh and stares out over the city for several minutes. Finally he says quietly, 'Several months ago we lost contact with one of our crusaders. His name is, or was, Geanik. The last we heard from him he was furthering our cause against the loathsome Goblins that reside in Warsliks Wood. Just recently we were visited by a [strange Iksar].'");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14807, item2 = 10034, item3 = 10034},1,text2)) then
		e.self:Say("Thanks for resolving this issue. Here is your reward");
		e.other:QuestReward(e.self,0,0,0,0,14808,10000); -- Item: Xog's Reference: Bracer
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14792})) then --Trooper Scale Gauntlets quest
		e.self:Emote(" takes the note without even a glance in your direction and begins reading. After a long silence, he lets his arms drop to his sides and says quietly, 'We kill, " .. e.other:GetCleanName() .. ". That is our job, our duty in life. Our targets are chosen for us. We merely listen. Right now I am being told there is a traitor not far from here, near the ocean. Go to him and end his life. Bring me his head, and two star rubies. As you do this, try hard to listen to our Lord's instruction. If you hear even a whisper, you will know more righteousness than most of this city.'");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14806, item2 = 10032, item3 = 10032},1,text1)) then
		e.self:Say("Well done, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,14809,10000); -- Item: Xog's Reference: Gauntlet
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14814})) then
		e.self:Emote("takes the icon and stares at it. His face twists into a look of disdain and he suddenly throws the icon off the balcony. It lands in the water some distance away. Without even a glance at you he says in disgust, 'You're an idiot, " .. e.other:GetCleanName() .. ". You fit your profession well. Leave my sight.'");
		e.other:Faction(e.self,442,-25); -- Faction: Crusaders of Greenmist
		e.other:Faction(e.self,441,-6); -- Faction: Legion of Cabilis
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
