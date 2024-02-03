function event_say(e)
	if(e.other:GetFactionValue(e.self) >= 0) then	
		if(e.message:findi("hail")) then
			e.self:Say("I am Vira, elementalist of Solusek Ro.  I guard the secrets of the tools of [elemental summoning].  If you are a magician, you might be interested.");
		elseif(e.message:findi("elemental summoning")) then
			e.self:Say("I hold the secets to the construction of four tools which assist magicians with the summoning of elementals.  I know about the [broom of Trilon], the [shovel of Ponz], the [torch of Alna] and the [stein of Ulissa].");
		elseif(e.message:findi("shovel of ponz")) then 
			e.self:Say("The shovel of Ponz was crafted by the earthen master of the same name.  Are you [interested] in the [shovel]?");
		elseif(e.message:findi("interested.* shovel")) then
			e.self:Say("I will create a replica of the shovel of Ponz for you, but I will need the following components to make it: a ruby, the eyes of a gargoyle, a shovel from a magician in Najena and the toes of a hill giant.  Bring me these four components, and I will construct for you an object of elemental power.");
		elseif(e.message:findi("broom of trilon")) then
			e.self:Say("The broom of Trilon was held by the infamous Mistress of Air of the same name.  Are you [interested] in the [broom]?");
		elseif(e.message:findi("interested.* broom")) then
			e.self:Say("I will construct a replica of the broom of Trilon for you, but I will need the following components to make it: a star ruby; a feather from a griffon, a broom from a magician in Najena and the toes of a cyclops.  Bring me these four components, and I will fashion for you an object of elemental power.");
		elseif(e.message:findi("torch of alna")) then
			e.self:Say("The torch of Alna was constructed and held by the fire mistress of the same name.  Are you [interested] in the [torch]?");
		elseif(e.message:findi("interested.* torch")) then
			e.self:Say("I will make a replica of the torch of Alna for you, but I will need the following items to make it: a fire emerald, a scale from a fire drake, a torch from a magician in Najena and the toes of a fire giant.  Bring me these four components, and I will build for you an object of elemental power.");
		elseif(e.message:findi("stein of ulissa")) then
			e.self:Say("The stein of Ulissa was found and used by the mistress of water of the same name.  Are you [interested] in the [stein]?");
		elseif(e.message:findi("interested.* stein")) then
			e.self:Say("I will devise a replica of the stein of Ulissa for you, but I will need the following items to make it: a sapphire, a scale from a mermaid, a stein from a magician in Najena and the toes of an ice giant.  Bring me these four components, and I will make for you an object of elemental power.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Solusek Ro does not believe in half measures.";

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 16544,item2 = 16543,item3 = 16538,item4 = 10032},1,text)) then
		e.self:Say("All of the components to make the infamous broom of Trilon!  Well done, adventurer.  As you have proven yourself worthy, I grant you this broom.");
		e.other:Faction(e.self,415,5,0); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1,0); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,6360,1000); -- Broom of Trilon
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10035, item2 = 10014, item3 = 16545, item4 = 16539},1,text)) then 
		e.self:Say("Each of the four items needed to construct the famed Shovel of Ponz!  Very well.  As you have displayed ingenuity, I grant you this shovel.");
		e.other:Faction(e.self,415,5,0); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1,0); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,6361,1000); --  Shovel of Ponz
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 16546, item2 = 16534, item3 = 10033, item4 = 16541},1,text)) then 
		e.self:Say("All of the pieces of the famous Torch of Alna!  I never thought you would find them all!  As you have displayed courage, I grant you this torch.");
		e.other:Faction(e.self,415,5,0); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1,0); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,6362,1000); -- Torch of Alna	
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 16540, item2 = 16542, item3 = 10034, item4 = 16547},1,text)) then 
		e.self:Say("The four components required for the stein of Ulissa?!  I am impressed!  As you have displayed valor, I grant you this stein.");
		e.other:Faction(e.self,415,5,0); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1,0); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,6363,1000); -- Stein of Ulissa
	end	
	item_lib.return_items(e.self, e.other, e.trade)
end
