function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. My name is Corun Finisc and I am one of the Jaggedpine Treefolk. It is our divine responsibility to watch over and protect Surefall Glade and its [inhabitants] from those who seek to [destroy] them.");
	elseif(e.message:findi("inhabitants")) then
		e.self:Say("The bears of Surefall Glade are our brothers. We are all children of [Tunare]. We would gladly die in their defense.");
	elseif(e.message:findi("tunare")) then
		e.self:Say("Tunare is the Mother of All. It is though Her will that we protect this land and its many creatures.");
	elseif(e.message:findi("destroy")) then
		e.self:Say("Poachers in seach of bear skins and [gnolls] who attack us unprovoked. We are doing all we can to stop them. May [Tunare] give me the strength needed to smite them dead with my [crook].");
	elseif(e.message:findi("crook")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- not verified as exact, tested at 0 faction and wasn't high enough
			e.self:Say("My crook? The Jaggedpine crook is an enchanted weapon of the Jaggedpine Treefolk. The [Sabertooths] take great pleasure in destroying the crooks of any Treefolk they manage to slay. If you were to recover the pieces of a broken crook, I would gladly mend it for you.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("gnolls")) then
		e.self:Say("The Sabertooths are a vicious band of gnolls who live in Blackburrow, to the east of Surefall Glade. They constantly attack us when we only seek to share this land with them. They also send many patrols out into the Qeynos Hills to the south. We have even seen a Sabertooth skulking about in the caves behind Grizzly Falls. There is a [reward] for his hide.");
	elseif(e.message:findi("reward")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- not verified as exact, tested at 0 faction and wasn't high enough
			e.self:Say("Yes. We are offering a small reward for slaying the skulking gnoll in the bear caves. Bring me his paw to claim your bounty. The Jaggedpine Treefolk remember well those who aid their cause.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("sabertooths")) then
		e.self:Say("The gnolls of Blackburrow are called Sabertooths. They have been seen in force on a regular basis. They are surely up to something.");		
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
	local text = "Look what you have found! It is tragic to know that for every broken crook that is recovered, one of the Treefolk has lost his life. Those gnolls will pay some day. If you have the other half of the crook I will repair it for you.";

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13700})) then
		e.self:Say("Thank you for tracking down the filthy little poacher. Take this as your reward."); -- This is not from live as I have not seen the little bugger on live yet.
		e.other:Faction(e.self,272,10); -- Faction: Jaggedpine Treefolk
		e.other:Faction(e.self,302,2); -- Faction: Protectors of Pine
		e.other:Faction(e.self,343,1); -- Faction: QRG Protected Animals
		e.other:Faction(e.self,324,-2); -- Faction: Unkempt Druids
		e.other:Faction(e.self,262,1); -- Faction: Guards of Qeynos
		e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(0,8),math.random(0,2),0,1500);
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13231,item2 = 13232},1,text)) then
		e.self:Say("Excellent! Here is a Jaggedpine Crook of your own. Please use it only to defend yourself and never to attack one of Tunare's creatures. You will find that while wielding the crook, Tunare grants you a boon of strength and the power to smite enemies who would otherwise be impervious to physical attacks.");
		e.other:Faction(e.self,272,10); -- Faction: Jaggedpine Treefolk
		e.other:Faction(e.self,302,2); -- Faction: Protectors of Pine
		e.other:Faction(e.self,343,1); -- Faction: QRG Protected Animals
		e.other:Faction(e.self,324,-2); -- Faction: Unkempt Druids
		e.other:Faction(e.self,262,1); -- Faction: Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,13230,1500); -- Item: Jaggedpine Crook
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 3 or e.wp == 18 or e.wp == 29) then
		e.self:Shout("Heed the wishes of Tunare and leave the bears of Surefall Glade undisturbed!");
	elseif(e.wp == 11) then
		e.self:Say("By the will of Tunare, I serve this glade until I become one with it.");
	end
end
