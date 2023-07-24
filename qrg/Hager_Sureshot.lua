function event_spawn(e)
	eq.set_timer("repeat", 90000); -- Repeated shoot every 90 seconds
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ".  Feel free to rest here in Surefall Glade.  Just be sure you do no hunting whilst here.  If so, then you shall pay the punishment of death.  I trust you [will abide by the laws]?");
	elseif(e.message:findi("abide by the laws")) then
		e.self:Say("That is wise.  Your health, for now, is assured.  A plague of hunters has infested our land heavily in recent weeks.  The word is out that [Mammoth] still lives.  Hunters have flocked here in search of a trophy or profit and glory.  Instead, they find the deadly accuracy of my arrows.");
	elseif(e.message:findi("mammoth")) then
		e.self:Say("Mammoth is the great bear of the caves.  [Tunare] has blessed our home with Mammoth's presence.  It is said that when the great bear dies, so too shall the Jaggedpine.  He would be quite a trophy to some hunter.  And quite profitable to a poacher. Even the infamous [Talym Shoontar] has tried his hand at the hunt.");
	elseif(e.message:findi("tunare")) then
		e.self:Say("What?  You do not know the name of the Mother of All?!  Creator of all that grows green?!  It is She whose mana flows throughout all glades and forests.  As do our [brothers to the east], we bow before Her glory, swearing to protect Her creations and the denizens who call them home.");
	elseif(e.message:findi("talym shoontar")) then
		e.self:Say("Talym Shoontar is a poacher.  He has eluded us for quite some time.  He has organized parties of poachers to plague our forest as well as others.  He hails from Halas, but I have heard he now calls the Plains of Karana home.  I have placed a bounty upon his head.  Do you [wish to collect the bounty]?");
	elseif(e.message:findi("wish to collect.* bounty")) then
		e.self:Say("That's the spirit!!  Spoken like a true Protector of the Pine!  Last I heard, Talym Shoontar was hunting in the Plains of Karana.  He has also been spotted running to and from Qeynos.  No doubt he is selling hides to some merchant.  End his life of hunting.  Bring me his head to collect the bounty.");
	elseif(e.message:findi("brothers to the east")) then
		e.self:Say("Not brothers of race, but in heart.  The good elves of the Faydarks on the continent of Faydwer are the ones I mean. Both our communities respect the fact that peace and harmony can be found within Tunare's glory.");
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
	elseif(e.message:findi("chanda") or e.message:findi("baobob") or e.message:findi("miller")) then
		e.self:Say("The entire Miller family are nothing more than scum.  It is they who entice poachers to continue with their slaughter so they can profit from the skins of the wildlife.");	
	elseif(e.message:findi("tunarbos")) then
		e.self:Say("Long ago, centuries before the Combine Era even, there grew a great tree upon Norrath.  It stretched to the stars and was as wide as the span of Erud's Crossing.  From the roots of this tree sprung all the woodlands of Norrath.  An unknown force struck it down.  Some say it was the great dragon, Veeshan!  Whatever the force, the Great Tunarbos was shattered.  Lost forever.  Now the wood chips lie scattered across the face of Norrath.  To hold a shard of the Great Tunarbos is to hold the hand of Tunare.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18709})) then
		e.self:Say("Welcome, we are the Protectors of the Pine. Wear this tunic of our guild, and help us defend our great and beautiful woods. Go to Larsk Juton, he will help train you and teach you the power of the woods.");
		e.other:Faction(e.self,302,100,0); -- Protectors of Pine
		e.other:Faction(e.self,272,25,0); -- Jaggedpine Treefolk
		e.other:Faction(e.self,306,-15,0); -- Sabertooths of Blackburrow
		e.other:Faction(e.self,262,25,0); -- Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,13509,20); -- Item: Mud Stained Tunic*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13913})) then
		e.self:Say("His days of hunting are over. In the name of the Protectors of the Pine, I offer you this reward. If you are unable to make use of it, you may sell it. I suggest you hold onto it. If you are a ranger it will come in handy.");
		e.other:Faction(e.self,302,20,0); -- Protectors of Pine
		e.other:Faction(e.self,272,5,0); -- Jaggedpine Treefolk
		e.other:Faction(e.self,306,-3,0); -- Sabertooths of Blackburrow
		e.other:Faction(e.self,262,5,0); -- Guards of Qeynos
		e.other:QuestReward(e.self,0,math.random(15),math.random(10),0,eq.ChooseRandom(17804,9006,9001,8011),1000); -- Item: Tailored Quiver, Item: Wooden Shield, Item: Buckler, Item: Hunting Bow
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_timer(e)
	e.self:DoAnim(9); -- bow
end

-- EOF zone: qrg ID: 3032 NPC: Hagar_Sureshot
