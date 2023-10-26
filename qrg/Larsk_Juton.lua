-- NPC: Larsk_Juton

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, Adventurer! I hope you are enjoying your time in Surefall Glade. You must be careful when leaving the Jaggedpine. There have been many report of [Sabertooths] attacking travelers.");
	elseif(e.message:findi("sabertooth")) then
		e.self:Say("The gnolls of Blackburrow are called Sabertooths. They have been seen in force on a regular basis. They are surely up to something. We have even heard rumors of a [pact] between Qeynos merchants and the dogs.");
	elseif(e.message:findi("pact")) then
		e.self:Say("Sources have come forward to tell of a pact between a merchant of Qeynos and the Sabertooths. It all has to do with blades and brew. We hear that a meeting will occur soon, somewhere in the Qeynos Hills at night. Do not fear, we shall find a brave ranger to [halt this meeting].");
	elseif(e.message:findi("halt.* meeting")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Very good of you. Stop this meeting by killing the gnoll in Qeynos Hills. We hear that he shall be there in the late evening, and that his name is Furgoot or Furgy, something like that. Find him and kill him. I want his head. And if you should find any evidence of who the merchant is, be sure to hand it over to me.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Well, I, and the Protectors of Jaggedpine, have noticed your helpful deeds so far...  just keep up the good work, and you will soon be trusted enough to handle such important matters.");		
		else
			e.self:Say("You dare show your face around here, as bad as your reputation is with the Protectors of Jaggedpine? Begone, enemy of the forest!");		
		end
	elseif(e.message:findi("assist.* extermination of.* gnoll brewer")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Within the bowels of Blackburrow, our scouts have reported seeing the gnoll brewers.  You will go and brave the lair of the dogs and slay these brewers in order to cease the flow of Blackburrow Stout.  During your mission, should you find any Blackburrow casks, you must return them to me.  When you have recovered three of these casks, I shall award you the [Cloak of Jaggedpine].");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Well, I, and the Protectors of Jaggedpine, have noticed your helpful deeds so far...  just keep up the good work, and you will soon be trusted enough to handle such important matters.");		
		else
			e.self:Say("You dare show your face around here, as bad as your reputation is with the Protectors of Jaggedpine? Begone, enemy of the forest!");
		end
	elseif(e.message:findi("blackburrow stout")) then
		e.self:Say("Blackburrow Stout is a grog created by the gnolls of Blackburrow.  It is no surprise that the grog is illegal in Qeynos.  Even so, I hear there are some barkeeps who dare sell it.");
	elseif(e.message:findi("Cloak of Jaggedpine")) then
		e.self:Say("The Cloak of Jaggedpine was made for those loyal to the ways of the forest.  It is enchanted to increase one's dexterity.  It is awarded to those who have aided in our cause to rid the land of those vile dogs called the Sabertooths.  Should you earn one, be sure to hold onto it - you never know when we may alter the enchantments placed upon the cloak.");
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
	local text = "Good work, but I must see at least three Blackburrow casks before I can reward you with the [Cloak of Jaggedpine].";

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13309})) then
		e.self:Say("So, I see you rid the hills of the beast. Good work! I have a reward for you. I hope it will be usefull. I am afraid this gnoll's death will not halt the alliance between the two. I shall require your services to [assist in the extermination of the gnoll brewers].");
		-- Confirmed Live Faction
		e.other:Faction(e.self,302,25,0); -- Protectors of Pine
		e.other:Faction(e.self,272,6,0); -- Jaggedpine Treefolk
		e.other:Faction(e.self,306,-3,0); -- Sabertooths of Blackburrow
		e.other:Faction(e.self,262,1,0); -- Guards of Qeynos
		e.other:QuestReward(e.self,math.random(5),math.random(5),math.random(5),0,eq.ChooseRandom(2137,2140,9006,5033),20000); --items: Raw-Hide Skullcap, Raw-Hide Tunic, Wooden Shield, Bronze Broad Sword
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 17970,item2 = 17970, item3 = 17970},1,text)) then
		e.self:Say("Excellent!  Ridding the area of those foul beasts will certainly slow down whatever it is they are planning.  Here is the Cloak of Jaggedpine.  You should keep this, for you never know when we may decide to alter the enchantments on it.");
		e.other:Faction(e.self,302,20,0); -- Faction: Protectors of Pine
		e.other:Faction(e.self,272,5,0); -- Faction: Jaggedpine Treefolk
		e.other:Faction(e.self,306,-3,0); -- Faction: Sabertooths of Blackburrow
		e.other:Faction(e.self,262,5,0); -- Faction: Guards of Qeynos
		e.other:QuestReward(e.self,math.random(5),math.random(5),math.random(5),0,2915,1000); -- Item: Cloak of Jaggedpine
	elseif(e.other:GetFactionValue(e.self) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18811})) then
		e.self:Say("Fine Work, " .. e.other:GetCleanName() .. ". Hmmm. It seems this needs taking care of. Take this note to the Captain of the City Guard in Qeynos. His name is Captain Tillin. He will have to attend to this matter. Also.. Let me see the gnoll\'s head. I must know you killed him. Be safe, my friend. I am sure that whoever this McNeal is, he was simply a lackey. Whoever he works for is most likely going to be looking for you. Watch your back in Qeynos.");
		-- Confirmed Live Faction		
		e.other:Faction(e.self,302,5,0); -- Protectors of Pine
		e.other:Faction(e.self,272,1,0); -- Jaggedpine Treefolk
		e.other:Faction(e.self,306,-1,0); -- Sabertooths of Blackburrow
		e.other:Faction(e.self,262,1,0); -- Guards of Qeynos
		e.other:QuestReward(e.self,math.random(5),math.random(5),math.random(5),0,18815,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
