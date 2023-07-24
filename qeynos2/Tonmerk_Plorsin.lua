function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, child.  Welcome to the Temple of Life. Here, you may pay homage to the [Prime Healer], [Rodcet Nife].  If you are in need of [healing] or require me to [cure disease] or [cure poison], please inform me.  I am the resident healer of all Qeynos citizens.");
	elseif(e.message:findi("cure disease")) then
		e.self:Say("Yes, we can do that.  First, you must fetch me some bandages and brew me some bog juice.  I.. err.. require the bog juice to.. to dampen the bandages.. Yes that's it!  To dampen the bandages.");
	elseif(e.message:findi("cure poison")) then
		e.self:Say("To cast the poison from your body I require one snake fang.  The fang will contain a hint of poison which will help me focus my casting.");
	elseif(e.message:findi("healing")) then
		e.self:Say("You must pay a tribute of five gold coins before I perform the binding of your wounds.");
	elseif(e.message:findi("prime healer") or e.message:findi("rodcet nife")) then
		e.self:Say("He is the sustaining force of all life.  It is in honor of Him that the Temple of Life was built.  Engineered with the help of the [Academy of Arcane Science].");
	elseif(e.message:findi("academy of arcane science")) then
		e.self:Say("The Academy of Arcane Science is the greatest school of magic in Antonica.  It houses a wealth of resources and knowledge pertaining to any of the circles of magic.  It is also a marvel of magical engineering.  If you should ever visit Freeport. be sure to let me know.  I seek a faithful cleric to [pickup a reagent].");
	elseif(e.message:findi("pickup.* reagent")) then
		if(e.other:GetFaction(e.self) > 5) then -- apprehensively or worse
			e.self:Say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.")
		elseif(e.other:GetFaction(e.self) > 4) then -- indifferently
			e.self:Say("The Temple of Life smiles upon you, friend... but such a delicate matter can only be entrusted to our most loyal members.")
		else -- amiably
			e.self:Say("That would be grand! It is a long journey to Freeport. I am lucky to find one who can endure the trip. Go to Freeport and seek out the Temple of Marr. Within, you shall find a cleric named [Serna Tasknon]. Give her this flask. It is an inert potion which she can use. In exchange she will give you the [shark powder] to return to me. Do this and I shall grant you the ability to call upon the power of life and smite thy foes.");
			e.other:SummonCursorItem(13983); -- Item: Inert Potion
		end
	elseif(e.message:findi("Serna Tasknon")) then
			e.self:Say("Serna Tasknon is a member of the Priests of Marr in the trade city of Freeport. I studied their ways of healing. The Priests of Marr can be found in the Temple of Marr.");
	elseif(e.message:findi("shark powder")) then
			e.self:Say("I am not sure what it is, but it surely has been proven to aid one's strength. Serna Tasknon in Freeport is the only one who can create it. She won't make it for you unless you bring her a potion from Toresian however. Last I saw of him he had returned to his home in Erudin.");
	elseif(e.message:findi("bertoxxulous") or e.message:findi("plaguebringer")) then
		e.self:Say("Bertoxxulous is the vile lord of all disease. We of the Temple of Life are sworn to put an end to any being who serves the evil god.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12125})) then -- Shark Powder
		e.self:Say("I thank you, my good friend. Surely the road to Freeport was not easily trod. Please take this as compensation for your costs and I also grant you the ability to call forth the power of Rodcet Nife to smite the enemy. Go forth to defend life.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,341,20,0); -- Priests of Life
		e.other:Faction(e.self,280,6,0); -- Knights of Thunder
		e.other:Faction(e.self,262,10,0); -- Guards of Qeynos
		e.other:Faction(e.self,221,-5,0); -- Bloodsabers
		e.other:Faction(e.self,219,3,0); -- Antonius Bayle
		e.other:QuestReward(e.self,0,0,math.random(30),0,15016,100000); -- spell: smite
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 16581,item2 = 13009})) then -- Bog Juice, Bandages
		e.self:Say("The glory of Rodcet Nife flows through your soul. May your body and soul live in righteous health.");
		e.self:CastSpell(96,e.other:GetID()); -- Spell: Counteract Disease
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13067})) then -- Snake fang
		e.self:Say("The glory of Rodcet Nife flows through your soul. May your body and soul live in righteous health.");
		e.self:CastSpell(95,e.other:GetID()); -- Counteract Poison
	elseif(item_lib.check_turn_in(e.self, e.trade, {gold = 5})) then
		e.self:Say("The glory of Rodcet Nife flows through your soul. May your body and soul live in righteous health.");
		e.self:CastSpell(17,e.other:GetID()); -- Light Healing
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
