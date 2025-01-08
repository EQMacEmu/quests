function event_waypoint_arrive(e)
	if(e.wp == 18) then
		e.self:Say("Have you noticed anything strange about Commander Bayle lately? I saw him talking to that trouble-making Irontoe the other day and one night late last week, when I was on patrol, I saw him sneaking into Crow's.");
		eq.signal(2094,1); -- NPC: Guard_Hezlan
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. "!  I am sorry but I do not have time to chat, as I must get back to my patrol.  May the [Prime Healer] walk with you!");
	elseif(e.message:findi("prime healer")) then
		e.self:Say("I am a follower of Rodcet Nife, the Prime Healer.  He visited Qeynos when it was just a small village and left us the fine temple dedicated to him in what is now North Qeynos.  He gives us all the strength we need to combat the [disease of evil that is spreading] across Norrath.");
	elseif(e.message:findi("disease of evil that is spreading")) then
		e.self:Say("The Priests of Life think that followers of Bertoxxulous, the Plaguebringer, are working here in Qeynos.  They have found several bodies washed up under the docks bloated with pus and filth.  Each body bore the tattoo of a [bloody saber] on its forehead.");
	elseif(e.message:findi("bloody saber")) then
		e.self:Say("The tattoo is rumored to be the mark of a group of necromancers, shadowknights and clerics loyal to Bertoxxulous who are called the Bloodsabers.  They have been active on the Plains of Karana and some think they have a hidden shrine somewhere within Qeynos itself.");
	elseif(e.message:findi("blackburrow") or e.message:findi("gnoll")) then
		e.self:Say("I know some of the Priests of Life don't agree with our campaign against the Sabertooths of Blackburrow, but I have to do my sworn duty as a guard of this fine city.  I believe those filthy gnolls are infected with all sorts of vile diseases.  I hope to Rodcet that I am right.");
	elseif(e.message:findi("weapon")) then
		e.self:Say("This city has been blessed with the craftsmanship of the Ironforges.  Their weapons are supreme.  Their shop can be found near the Temple of Life in North Qeynos.  You may also try the local warrior guild.");
	elseif(e.message:findi("order of the three")) then
		e.self:Say("The Order of Three consists of the three positive circles of the arcane known as magic, enchantment and wizardry.  This guild keeps very busy in its hall near the arena.  All in Qeynos respect their powers.");
	elseif(e.message:findi("monk guild")) then
		e.self:Say("In North Qeynos sits the house of the Silent Fist Clan.  These monks are welcome in Qeynos and often assist in training the Qeynos Guard in hand to hand combat.");
	elseif(e.message:findi("bank")) then
		e.self:Say("Qeynos Hold in South Qeynos is just across from the arena.  You know, over the bridge behind Firepride's.");
	elseif(e.message:findi("port") or e.message:findi("dock")) then
		e.self:Say("The port of Qeynos is located in South Qeynos.  From here one may catch the ship to Erudin.");
	elseif(e.message:findi("kane")) then
		e.self:Say("Commander Kane Bayle is the commander of all the Qeynos Guard.  He is second only to his brother, Antonius Bayle.  His post is in the guard house at the city gates.  Mind you, do not bother him, he has a bit of a temper.");
	elseif(e.message:findi("circle.* unseen hand")) then
		e.self:Say("The Circle of the Unseen Hand?  I have heard nothing of them.  Are they some sort of performing magic troupe?");
	elseif(e.message:findi("paladin guild") or e.message:findi("cleric guild")) then
		e.self:Say("Within Qeynos are the Knights of Thunder and the Priests of Life.  Both of these orders consist of clerics and paladins and are respected by all.  The Hall of Thunder lies in South Qeynos and the Temple of Life is in North Qeynos.");
	elseif(e.message:findi("necromancer guild") or e.message:findi("shadowknight guild")) then
		e.self:Say("What gibberish are you spouting?  There is not, nor will there ever be, such an organization as that within a hundred miles of Qeynos, not with the Qeynos Guard on patrol.  Next you will be inquiring of a rogue guild!  Really!");
	elseif(e.message:findi("ranger guild") or e.message:findi("druid guild")) then	
		e.self:Say("I believe you shall find the Protectors of the Pine and Jaggedpine Treefolk in the hollow of Surefall Glade.");	
	elseif(e.message:findi("jaggedpine treefolk")) then
		e.self:Say("In Surefall Glade there are druids called the Jaggedpine Treefolk.  These men and women often assist our army during times of war.");
	elseif(e.message:findi("linarius")) then
		e.self:Say("The Qeynos Tower Guards of the hills and plains are commanded by Captain Linarius Graffe.  He often has much to report.  He is posted in a keep which spans a river.  I believe it is in the northern Plains of Karana.");
	elseif(e.message:findi("south qeynos")) then
		e.self:Say("The passages to North Qeynos can be found near the bard's guild or next to the Clock of Ak'Anon.");
	elseif(e.message:findi("inn") or e.message:findi("rest")) then	
		e.self:Say("If you need a place to rest, I highly recommend the Lion's Mane Inn and Tavern.  Poor adventurers all huddle together in one of the backrooms of Fish's.");	
	elseif(e.message:findi("antonius")) then
		e.self:Say("Antonius Bayle is the ruler of Qeynos. He is such a great man that they renamed this continent after him. He brought Qeynos to the glory it now is. He formed the mightest army on Norrath, the Qeynos Guard. It is through his guidance that we shall protect all nations of Antonica from any evil threat. He does not venture into the city streets often. He is quite busy.");
	elseif(e.message:findi("tillin")) then
		e.self:Say("Captain Tillin Brightblade is the commander of the Qeynos City Guard. Extermination of the Sabertooths is his paramount concern. He has recently begun to hire mercenaries to assist in the extermination. If you wish to help out then go and speak with him. He is most often found discussing tactics with Ebon Strongbear at arena.");
	end
end
