function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is good to meet you, " .. e.other:GetCleanName() .. ". You, my friend, are an adventurer. The rugged look of you testifies to that. Let me know if you plan to adventure in the Plains of Karana. I have need of a person such as yourself to [deliver a flask].");
	elseif(e.message:findi("deliver a flask")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- not verified as exact, tested at 0 faction and wasn't high enough
			e.self:Say("That is splendid! I thought I would have to take the long journey to the western Plains of Karana myself. Here you are, my friend. Take this flask of nitrates to a woman named Linaya Sowlin. It will help her crops grow stronger. You will find her farm alongside the road to Highpass Hold. She should pay you well for the delivery. Farewell.");
			e.other:SummonCursorItem(13945); -- Item: Flask of Nitrates
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("We, the Jaggedpine Treefolk, appreciate the help you've given us in the past. But, we must trust you more before allowing you to handle such important matters.");		
		else
			e.self:Say("You are an enemy of the Jaggedpine Treefolk, this forest, and the residents of it. Begone, before I am forced to take drastic measures!");		
		end
	elseif(e.message:findi("Jale Phlintoes")) then
		e.self:Say("Jale Phlintoes was trained in the ways of the Jaggedpine Treefolk since his birth. He was only eight when his parents were killed by poachers. Young Jale would have had his throat slit also if he were not off fishing at the lake. Unfortunate. The now orphaned Jale was brought up by us druids. After many conflicts with our council, he ran off to start his own sect somewhere in the nearby lands. For his terrorist activities his head now brings a high price.");
	elseif(e.message:findi("unkempt druid")) then
		e.self:Say("The Unkempt Druids are a radical splinter group of druids. Their beliefs have been contorted by the mad druid [Jale Phlintoes]. It is he who engineers and coordinates the druids' transgressions. From setting lumbermills aflame to murdering any man who dares to wear a bearhide. They must be stopped!! Citizens must learn to understand Tunare's will, not fear it.");
	elseif(e.message:findi("linaya")) then
		e.self:Say("Linaya Sowlin is an old student of mine.  When her father passed away, she inherited his farmhouse in the Plains of Karana.  A tent in the Jaggedpine or an estate on the plains?  I would choose the former.");
	elseif(e.message:findi("leader")) then
		e.self:Say("The land of Surefall Glade is ruled by no single hand other than Tunare, but if guidance is what you seek, I would suggest you speak with Te`Anara.  She is the head of the Jaggedpine Treefolk.  Otherwise, you could speak with Hager Sureshot of the Protectors of the Pine.");
	elseif(e.message:findi("poacher")) then
		e.self:Say("Poachers have been plaguing our land.  We do our best to stop them.  If you wish to join the fight, seek the masters of the Protectors of the Pine.");
	elseif(e.message:findi("mammoth") or e.message:findi("cave")) then
		e.self:Say("That information is best kept secret.");
	elseif(e.message:findi("druid guild")) then
		e.self:Say("The Jaggedpine Treefolk are the local druids.  The masters can be found here within the great tree.");
	elseif(e.message:findi("forge") or e.message:findi("oven")) then
		e.self:Say("We have nothing like that here in Surefall Glade.  You must venture to Qeynos.");
	elseif(e.message:findi("armor")) then
		e.self:Say("Oftentimes you can find a traveling merchant in one of the nearby houses.  Other than that you would have to travel to Qeynos.");
	elseif(e.message:findi("qeynos")) then
		e.self:Say("The great city of Qeynos can be found by walking along the path outside of Surefall Glade.  Many of our rangers and druids serve alongside the Qeynos Guard when the need arises.");
	elseif(e.message:findi("bank")) then
		e.self:Say("There is no need for a vault among our people.  You could try the Qeynos Hold in Qeynos.");
	elseif(e.message:findi("talym") or e.message:findi("shoontar")) then
		e.self:Say("Talym Shoontar is a wanted man.  He is a very infamous poacher.  Hager Sureshot has placed a bounty upon his head.");
	elseif(e.message:findi("chanda") or e.message:findi("baobob") or e.message:findi("miller")) then
		e.self:Say("The entire Miller family are nothing more than scum.  It is they who entice poachers to continue with their slaughter so they can profit from the skins of the wildlife.");	
	elseif(e.message:findi("tunarbos")) then
		e.self:Say("Long ago, centuries before the Combine Era even, there grew a great tree upon Norrath.  It stretched to the stars and was as wide as the span of Erud's Crossing.  From the roots of this tree sprung all the woodlands of Norrath.  An unknown force struck it down.  Some say it was the great dragon, Veeshan!  Whatever the force, the Great Tunarbos was shattered.  Lost forever.  Now the wood chips lie scattered across the face of Norrath.  To hold a shard of the Great Tunarbos is to hold the hand of Tunare.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18911})) then
		e.self:Say("Oh my!! Our Qeynos Ambassador, Gash, is in danger. Please take the note over to Captain Tillin of the Qeynos Guard then find Gash and inform him [they are trying to kill him]. Go!!");
		 -- confirmed live factions
		e.other:Faction(e.self,272,15,0); -- Jaggedpine Treefolk
		e.other:Faction(e.self,302,3,0); -- Protector of the Pine
		e.other:Faction(e.self,343,2,0); -- QRG Protected Animals
		e.other:Faction(e.self,324,-3,0); -- Unkempt Druids
		e.other:Faction(e.self,262,2,0); -- Guards of Qeynos
		e.other:QuestReward(e.self,0,math.random(10),math.random(10),0,18912,1000);
	elseif(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12141})) then -- hand in worked at apprehensive, contrary to quest text being rejected at indifferent, didn't work at threatening so it's between -100 and -500
		e.self:Say("So the Unkempt Druids are alive and well.  We shall keep a watchful eye out as should you.  Take this for your bravery and defense of the Jaggedpine.");
		e.other:Faction(e.self,302,20,0); -- confirmed live factions
		e.other:Faction(e.self,272,5,0); -- Faction: Jaggedpine Treefolk
		e.other:Faction(e.self,343,3,0); -- Faction: QRG Protected Animals
		e.other:Faction(e.self,324,-5,0); -- Faction: Unkempt Druids
		e.other:Faction(e.self,262,3,0); -- Faction: Guards of Qeynos
		e.other:QuestReward(e.self,0,math.random(10),math.random(15),0,eq.ChooseRandom(6018,15240,9006,2147,15239,15213,15237,2006,15252,15248,9002,2171),20000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
