function event_say(e)
	if(e.message:findi("assignment")) then
		e.self:Say("We have just the thing for your friends back home. It will take some doing, but the pay off will be lovely indeed. In that jar you must combine 4 substances. You'll need two portions of a [goblin..source], one portion of [green river sludge], and one [portion of an experimental nature] that an agent of ours is working on. Bring the mixture back to me and we'll speak again.");
	elseif(e.message:findi("goblin source")) then
		e.self:Say("The goblins of Antonica are known for their filthy habits and unclean practices. They often carry a menagerie of diseases and conditions. A more concentrated form of this aspect of goblin life cannot be found anywhere else but in the sewers of their citadel in the Sepent Spine. They must have workers who maintain the sewers. Find them and find the substance.");
	elseif(e.message:findi("green river sludge")) then
		e.self:Say("The ogres of Oggok don't spend much time on sanitation, so naturally their kind harbors many diseases. This is easily apparent in the river that runs near their city, Greenblood. Down at the very bottom of the river is where the ancient plagues have come to rest and hibernate. Once the sludge is mixed in with the other substances, those glorious blessings of Bertoxxulous will most assuredly awaken.");
	elseif(e.message:findi("portion of an experimental nature")) then
		e.self:Say("We have an agent studying in Freeport. Well, she actually isn't in Freeport proper but rather under it, in the sewers. Her name is Driana Poxsbourne. When you find her, tell her I have sent you for the substance. She will most likely have a task for you to complete before she can give you the fourth portion. Obey her.");
	elseif(e.message:findi("deliver")) then
		e.self:Say("You'll need to find the source of the kobold water supply and pour the substance into it. Once you do that, the disease will infest whatever living organisms it comes in contact with so do yourself a favor and leave the area quickly. You can then take the empty jar to your master for your reward.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18721})) then -- Blood Stained Note
		e.self:Say("So, you wish to to walk with the dead, eh? The army of the Plaguebringer is quietly amassing its diseased soldiers in the shadows and sewers of Norrath. Go to Brother Bruax. He will turn you into something useful, I hope.");
		e.other:Faction(e.self,221,100); -- Bloodsabers
		e.other:Faction(e.self,262,-15); -- Guards of Qeynos
		e.other:Faction(e.self,296,10); -- Opal Dark Briar
		e.other:Faction(e.self,341,-25); -- Priest of Life
		e.other:Faction(e.self,230,5); -- Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,13552,20); -- Dark Stained Purple Robe*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1792})) then -- Heavy Locked Chest
		e.self:Emote("examines the lock on the chest and pulls a black key from a pouch at her hip. The lock clicks open. Her eyes widen as she carefully opens the chest, revealing a pile of platinum coins and a small note. After admiring the coins she takes the note and reads it. The necromancer glances up, then at her spectral pet who then hands you a glass jar. She says, 'Are you ready for your first [assignment], " .. e.other:Race() .. "?");
		e.other:QuestReward(e.self,0,0,0,0,17060); -- Thick Glass Jar
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1795})) then -- Sealed Jar
		e.self:Emote("'s eyes light up with childish glee as she takes the jar containing the disgusting and deadly substance. From her pouch she removes a gob of putty and a gem carved into the likeness of a flying insect. After sticking the putty to the lid of the jar, she mashes the carved gem into the putty and hands the jar back to you. She then says, 'This is enchant the substance. You must then [deliver] the substance.");
		e.other:QuestReward(e.self,0,0,0,0,1799); -- Harbinger of Bertoxxulous
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
