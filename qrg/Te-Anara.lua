function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, friend! I hope your stay in Surefall Glade will ease your mind and soothe your soul. While you are here, we ask you to abide by the [laws of the Jaggedpine].");
	elseif(e.message:findi("jaggedpine")) then
		e.self:Say("We ask that you do not start campfires on our land. Do not litter our land with any items. Do not chop down our pines or tread upon any foliage. Please do not take more than a bellyful of fish. Do not harm any other wildlife and stay clear of [the great bear]!");
	elseif(e.message:findi("great bear")) then
		e.self:Say("The great bear I speak of is Mammoth. He has lived among us for over a century. Tunare has truly blessed us with his presence. As long as Mammoth lives, so too does Surefall Glade. We are currently worried. Corun has reported that there is something [wrong with Mammoth].");
	elseif(e.message:findi("wrong with mammoth")) then
		e.self:Say("Mammoth is not eating. We believe something is lodged in his throat. We require a young druid to [fetch a special potion].");
	elseif(e.message:findi("special potion")) then
		if(e.other:GetFactionValue(e.self) >= 50) then -- mid indifferent
			e.self:Say("Go to the gnome city of Ak'Anon on the continent of Faydwer. With their great zoo, you will find a gnome named Kimble Nogflop. Give him this flask of nitrates and he shall hand you a special potion which will force Mammoth to cough up whatever may be stuck inside his throat. Be sure to show me what you find inside his throat upon your return.");
			e.other:SummonCursorItem(13945); -- Item: Flask of Nitrates
		elseif(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("We, the Jaggedpine Treefolk, appreciate the help you've given us in the past. But, we must trust you more before allowing you to handle such important matters.");
		else
			e.self:Say("You are an enemy of the Jaggedpine Treefolk, this forest, and the residents of it. Begone, before I am forced to take drastic measures!");
		end
	elseif(e.message:findi("ralem")) then
		e.self:Say("Ralem Christoff is one of the finest warriors to come out of the Jaggedpine.  He was born and raised to be a ranger.  He now serves Antonius Bayle as the Field Marshall of a roving patrol.  His quiet, calm exterior hides a tactical genius and ferocious combatant.");
	elseif(e.message:findi("antonius")) then
		e.self:Say("Antonius Bayle is a good man.  His rule of Qeynos has been most kind to our land as well.  We also provide the key elements of his long range patrol division.  Our own [Ralem Christoff] serves as Field Marshall for that division.");
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
	local item_lib =require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18713})) then -- Tattered Note
		e.self:Say("Well met, friend of the forest. You will find power and enlightenment amidst these woods. Here, wear this tunic and represent the Jaggedpine with pride. Gerael Woodone will help train you and teach you the duties of Jaggedpine Treefolk. The forests, being the soul and heart of Norrath, depend on you and your actions from this day forth.");
		e.other:Faction(e.self,272, 100,0); --Jaggedpine Treefolk
		e.other:Faction(e.self,302, 25,0); --Protectors of Pine
		e.other:Faction(e.self,343, 15,0); --QRG Protected Animals
		e.other:Faction(e.self,324, -25,0); --Unkempt Druids
		e.other:Faction(e.self,262, 15,0);   --Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,13510,20); -- Item: Dried Grass Tunic*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18809})) then
		e.self:Say("Oh my, this must belong to Antonius Bayle! I shall see that he receives it. You have done a great service to Qeynos and Surefall Glade. I rewards you with this. May it be of good use in your future deeds.");
		e.other:Faction(e.self,272, 10,0); --Jaggedpine Treefolk
		e.other:Faction(e.self,302, 2,0); --Protectors of Pine
		e.other:Faction(e.self,343, 1,0); --QRG Protected Animals
		e.other:Faction(e.self,324, -2,0); --Unkempt Druids
		e.other:Faction(e.self,262, 1,0);   --Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,15222,100); -- Item: Spell: Invigor
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18807})) then -- Sealed Letter [Note To Jaggedpine - real]
		e.self:Say("Aye! This is good news. We shall try to supply Qeynos with a limited number of acres to begin their lumberyard. Here, my good messenger. A token to share in the good news.");
		-- confirmed live factions		
		e.other:Faction(e.self,272, 30,0); --Jaggedpine Treefolk
		e.other:Faction(e.self,302, 7,0); --Protectors of Pine
		e.other:Faction(e.self,343, 4,0); --QRG Protected Animals
		e.other:Faction(e.self,324, -7,0); --Unkempt Druids
		e.other:Faction(e.self,262, 4,0);   --Guards of Qeynos
		e.other:QuestReward(e.self,0,math.random(10),math.random(5),0,0,5000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18806})) then -- Sealed Letter [Note To Jaggedpine - fake]
		e.self:Say("This is dreadful news. We have been nothing but kind neighbors to Qeynos. Now Antonius Bayle wishes to abuse our friendship. This will not sit well with the others. Begone, messenger!");
		-- confirmed live factions		
		e.other:Faction(e.self,272, -30,0); --Jaggedpine Treefolk
		e.other:Faction(e.self,302, -7,0); --Protectors of Pine
		e.other:Faction(e.self,343, -4,0); --QRG Protected Animals
		e.other:Faction(e.self,324, 7,0); --Unkempt Druids
		e.other:Faction(e.self,262, -4,0);   --Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,0,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
