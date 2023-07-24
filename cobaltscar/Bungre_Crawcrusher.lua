-- Quest for Lodizal Shell Shield

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What manner of creature are you, strange one? I can see that you are not native to any nearby territories. Your thin flesh and lack of hair would mean certain death when the ice queen breathes upon these seas.");
	elseif(e.message:findi("elf") or e.message:findi("iksar") or e.message:findi("dwarf") or e.message:findi("troll") or e.message:findi("erudite") or e.message:findi("ogre") or e.message:findi("barbarian") or e.message:findi("vah") or e.message:findi("halfling")) then
		e.self:Say("I have heard not of your kind but you are welcome to take refuge on our beaches, we only ask that you help to defend them should the predators choose to attack.");
	elseif(e.message:findi("human") or e.message:findi("gnome")) then
		e.self:Say("I have heard of others of your kind. The sirens have lured them to this bay from afar to feast upon and use as slaves. We Othmir are immune to the sirens' songs, but you must take care not to fall under their thrall. The remains of many of your kind's great wooden traveling beasts decay on the floor of our bay, abandoned by the victims of the sirens. You are welcome to take shelter on our beaches as long as you assist in defending them should predators decide to attack.");
	elseif(e.message:findi("predators")) then
		e.self:Say("There are many dangerous predators that prowl the surrounding oceans and cliffs. It is my duty to train pups to become strong warriors in order to defend our villages. The wyverns on the cliffs prey primarily on the wounded and sick as well as many creatures that live in the brackish waters of our bay. The deadliest predators are the ones that roam all the coasts preying not only on my people but the Snowfangs and the Ulthork as well. Kelorek'Dar and Lodizal are the most feared of all.");
	elseif(e.message:findi("lodizal")) then
		e.self:Say("Lodizal is a giant carnivorous sea turtle that roams the iceclad ocean preying primarily on the Snowfang gnolls. The Snowfang gnolls are not trusted by we Othmir as they survive on the skins and meat of walrus and otter but Lodizal is a threat to all coastal dwellers. Should Lodizal ever be slain I would be willing to craft a shield from his shell and adorn it with Othmir runes. I would charge ten thousand gold for the service.");
	elseif(e.message:findi("kelorek")) then
		e.self:Say("Kelorek'Dar is a sea dragon that prowls the coasts preying on any manner of creature he can fit between his massive jaws.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 22815,platinum = 1000}, 0)) then
		e.self:Emote("skillfully crafts the section of Lodizal's shell into the shape of a shield. He then attaches sturdy cured walrus hide leather straps to the inner side of the shield and inscribes intricate glowing runes on the shield's face. When he is finished, he hands you the shield and claps loudly.");
		e.other:Faction(e.self,432,5); -- Faction: Othmir
		e.other:Faction(e.self,431,-1); -- Faction: Ulthork
		e.other:QuestReward(e.self,0,0,0,0,22816,150000);
	end
	local returned = item_lib.return_items(e.self, e.other, e.trade, false);
	if (returned) then
		e.self:Say("Sorry stranger, but that is not enough to barter with.");
	end
end
