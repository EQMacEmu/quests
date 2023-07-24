function event_say(e)
	if(e.other:GetFactionValue(e.self) >= 0) then
		if(e.message:findi("hail")) then
			e.self:Say("Welcome! I am Vurgo, follower of Solusek Ro and holder of the [harvester] and the [Words of Darkness].");
		elseif(e.message:findi("harvester")) then
			e.self:Say("I can forge you one, but you will need to bring me the correct [scythe components].");
		elseif(e.message:findi("scythe components")) then
			e.self:Say("The first thing I need is a shadowed scythe from our mortal enemies, the shadowed men.");
		elseif(e.message:findi("words of darkness")) then
			e.self:Say("I can scribe for you the Words of Darkness, but you will need to bring me the correct [word components].");
		elseif(e.message:findi("word components")) then
			e.self:Say("The first thing that I need is a shadowed book from our mortal enemies, the shadowed men.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Solusek Ro does not believe in half measures.";

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 5103})) then
		e.self:Say("A shadowed scythe! Well done! The only good shadowed man is a banished one. As the weapons of the shadowed men have a tendency to disappear, I have given you a note to remind me that you have indeed supplied me with a scythe. Give me the note with the following items and I will forge you a harvester: a fungus eye from a mortuary fungus in the Estate of Unrest, a shadowed knife from an island goblin headmaster in the Ocean of Tears and a fire opal. Give me these items, and I will forge for you a harvester.");
		e.other:Faction(e.self,415,1); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,18944,500); -- a note(VurgoHarv)
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10529})) then
		e.self:Say("A shadowed book! Well done! The more banished shadowed men the better. As the items of the shadowed men tend to disappear, I have given you a note to remind me that you have indeed supplied me with a book. Give me the note with the following items, and I will scribe for you Words of Darkness: a book of darkness from the Erudites in the tower by Lake Rathe, a book of frost from the icy goblin in Permafrost Keep and 300 golden coins. Bring me these items, and I will scribe for you the Words of Darkness.");
		e.other:Faction(e.self,415,1); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,18945,500); -- a note(VurgoWord)
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10538,item2 = 10031,item3 = 7331,item4 = 18944},1,text)) then -- A Fungus Eye, Fire Opal, Shadowed Knife, a note(VurgoHarv)
		e.self:Say("My note, a fungus eye, a shadowed knife and gold! All of the necessary components to make a harvester. Well done, adventurer!");
		e.other:Faction(e.self,415,1); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,5316,1000); -- Harvester
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10536,item2 = 10537,item3 = 18945,gold = 300},1,text)) then -- Book of Darkness, Book of Frost, a note(VurgoWord)
		e.self:Say("All of the necessary components for me to scribe the Words of Darkness! Very good, adventurer. Take your tome, you have earned it.");
		e.other:Faction(e.self,415,1); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,10527,1000); -- Words of Darkness
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
