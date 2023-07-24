function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. stranger. Please excuse my melancholy state.  I have had some [bad news] that has brought me great sorrow.");
	elseif(e.message:findi("bayle list")) then
		e.self:Say("The Bayle List is my property.  Return it to me if you have it.  There is no more I can say of the list, but if you have the note and refuse to return it, then I shall let it be known that you betray [Antonius Bayle] himself!");
	elseif(e.message:findi("toe.* bayle list")) then
		e.self:Say("The [Bayle List] is gone.  It lies inside the belly of that beast, [Mammoth].");
	elseif(e.message:findi("mammoth")) then
		e.self:Say("Mammoth is the great bear which inhabits the caves. It was he that swallowed my son whole. My son was using the scroll case as a play sword when Mammoth approached. I know you need the list but my vows as a Protector of the Pine forbid me to harm the bear. Help me ease my pain. Kill Mammoth and bring me his hide. You will find the list inside the beast.");
	elseif(e.message:findi("bad news")) then
		e.self:Say("My youngest son was devoured by a grizzly bear while playing near the caves. It was an unfortunate accident. The great bear was just protecting its territory. Now, could you please just leave me be? <sniff>");
	elseif(e.message:findi("antonius")) then
		e.self:Say("Antonius Bayle and I were childhood friends.  He entrusted me to watch over the list.  What the list is, was never explained to me.  It looks like gibberish.");
	elseif(e.message:findi("leader")) then
		e.self:Say("The land of Surefall Glade is ruled by no single hand other than Tunare, but if guidance is what you seek, I would suggest you speak with Te`Anara.  She is the head of the Jaggedpine Treefolk.  Otherwise, you could speak with Hager Sureshot of the Protectors of the Pine.");
	elseif(e.message:findi("poacher")) then
		e.self:Say("Poachers have been plaguing our land.  We do our best to stop them.  If you wish to join the fight, seek the masters of the Protectors of the Pine.");
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

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18809,item2 = 13912})) then
		e.self:Say("It is not right to feel satisfied at the sight of Mammoth's hide, but I do. Thank you, " .. e.other:GetCleanName() .. ".");
		e.other:Faction(e.self,302,5,0); -- Faction: Protectors of Pine
		e.other:Faction(e.self,272,1,0); -- Faction: Jaggedpine Treefolk
		e.other:Faction(e.self,306,-1,0); -- Faction: Sabertooths of Blackburrow
		e.other:Faction(e.self,262,1,0); -- Faction: Guards of Qeynos
		e.other:QuestReward(e.self,0,6,0,0,18809,500); -- Item: Bayle List II
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
