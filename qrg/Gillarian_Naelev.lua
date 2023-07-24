function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, friend. Welcome to Surefall Glade. I need not remind you about [poaching], I hope");
	elseif(e.message:findi("poaching")) then
		e.self:Say("Poaching is illegal. We here are the Protectors of the Pine, rangers sworn to protect our land and all its inhabitants. This includes the wildlife. We spend a lot of time hunting poachers. If you want to [join the hunt], just let me know.");
	elseif(e.message:findi("join the hunt")) then
		if(e.other:GetFactionValue(e.self) >= 0) then -- verified faction between -100 and 0
			e.self:Say("Very good, friend. Be on the lookout for poachers in Surefall Glade or Qeynos Hills, especially in the nearby caves. The poachers are not always human. Often times we find ourselves a Blackburrow gnoll or two. Bring me back their heads. Let's see how they look mounted above the mantle! Be on your way, then.");	
		else
			e.self:Say("You dare show your face around here, as bad as your reputation is with the Protectors of Jaggedpine? Begone, enemy of the forest!");		
		end
	elseif(e.message:findi("master poacher")) then
		e.self:Say("'The master poacher is Talym Shoontar. If you wish to collect the bounty on this vile man, be sure to speak with our leader, Hager Sureshot. No doubt you will find him practicing his skills at the archery range.");
	elseif(e.message:findi("leader")) then
		e.self:Say("The land of Surefall Glade is ruled by no single hand other than Tunare, but if guidance is what you seek, I would suggest you speak with Te`Anara.  She is the head of the Jaggedpine Treefolk.  Otherwise, you could speak with Hager Sureshot of the Protectors of the Pine.");
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
	elseif(e.message:findi("chanda") or e.message:findi("baobob") or e.message:findi("miller")) then
		e.self:Say("The entire Miller family are nothing more than scum.  It is they who entice poachers to continue with their slaughter so they can profit from the skins of the wildlife.");	
	elseif(e.message:findi("tunarbos")) then
		e.self:Say("Long ago, centuries before the Combine Era even, there grew a great tree upon Norrath.  It stretched to the stars and was as wide as the span of Erud's Crossing.  From the roots of this tree sprung all the woodlands of Norrath.  An unknown force struck it down.  Some say it was the great dragon, Veeshan!  Whatever the force, the Great Tunarbos was shattered.  Lost forever.  Now the wood chips lie scattered across the face of Norrath.  To hold a shard of the Great Tunarbos is to hold the hand of Tunare.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13813})) then -- accepts at kos even though dialogue for quest rejects
		e.self:Say("Fantastic work!! Hager will be pleased. Not only do we rid ourself of a poacher, but we rid the land of these destructive gnolls. Our fletchers crafted this for me... Please take it as thanks.");
		e.other:Faction(e.self,302,25,0); -- Protectors of Pine
		e.other:Faction(e.self,272,6,0); -- Jaggedpine Treefolk
		e.other:Faction(e.self,306,-3,0); -- Sabertooths of Blackburrow
		e.other:Faction(e.self,262,6,0); -- Guards of Qeynos
		e.other:QuestReward(e.self,0,2,0,0,8803,6000); -- Rough Elm Recurve Bow
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13825})) then -- accepts at kos even though dialogue for quest rejects
		e.self:Say("Your deeds are great indeed. We shall cleanse our land of these poachers once and for all. A report has surfaced of a [master poacher].");
		e.other:Faction(e.self,302,15,0); -- Protectors of Pine
		e.other:Faction(e.self,272,3,0); -- Jaggedpine Treefolk
		e.other:Faction(e.self,306,-2,0); -- Sabertooths of Blackburrow
		e.other:Faction(e.self,262,3,0); -- Guards of Qeynos
		e.other:QuestReward(e.self,0,2,0,0,0,6000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
