-- NPC: Rathmana Allin.  Location: South Ro

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Company?! Way out here in the desert of Ro? This is a pleasant surprise! Won't you stay for a while? I am sure the desert has dried your throat. I have supplies if necessary. At a price, of course. Are you [traveling] or are you here on [business]?");
	elseif(e.message:findi("business")) then
		e.self:Say("Of course. You do not look like a traveling merchant or a lost adventurer. Someone has sent you to Rathmana. Well then, let's not waste time. Give me the item, or items, and my fee of twenty gold coins. It must be gold. I have no use for any other metals.");
	elseif(e.message:findi("traveling")) then
		e.self:Say("Oh, wonderful! Then you must need water and rations for your long journey. Be sure to approach any camp you may find in Ro with caution. There are many bandits in the desert. If it were not for Ortallius, they would have gutted me and thieved all my merchandise by now. If you have any use of magic then I believe I may have an [offer] for you.");
	elseif(e.message:findi("offer")) then
		e.self:Say("My offer to you is this, you give me thirty gold and I allow you to reach into my scroll bag and retrieve one scroll and only one. It may be the spell of a wizard or maybe not. The school of magic will not be known beforehand. The only knowledge you will have is that Rathmana will not exchange the spell for another. You get what you take. Do you wish to reach into my bag? Then give Rathmana his thirty gold coins.");
	elseif(e.message:findi("solusek")) then
		e.self:Say("Solusek Ro is the Burning Prince.  It is He who watches over this desert and chooses who lives and who dies.  It was He who saved Rathmana from the heretics and it was He who saved Ortallius from the sands.");
	elseif(e.message:findi("heretic")) then
		e.self:Say("As you can see, I am an Erudite, and I was raised in the great schools of magic in Erud.  In my youth, I learned of a forbidden art. That art was necromancy. I secretly studied this art and eventually happened upon others who practiced the art of darkness.  These magic users, or rather, necromancers,  are called heretics.  I learned their ways, but before I completely converted to their dark ways, I attempted to flee their circle.  They caught me and through arcane means transported me to this desert.  I would have died if it were not for a vision of Solusek Ro.  He appeared to me and created a hole in Norrath. It was from this hole I drank and lived. Since then I call the desert of Ro home, and live my humble life in the name of the Burning Prince, Solusek Ro.");
	elseif(e.message:findi("ortallius") or e.message:findi("orc")) then
		e.self:Say("Pay no mind to him.  He is my friend.  I found him as a child, dying under the blazing sun of Ro.  He was curled up next to his dead mother's body.  I raised him since then.  He is quite the opposite of what you would expect of an orc.  He is a good person.  To me, anyway.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I believe there is more yet.";
	-- Rathmana's Scroll Offer
	if(item_lib.check_turn_in(e.self, e.trade, {gold = 30})) then
		e.self:Say("Good luck, my friend. May Solusek Ro guide your hand.");
		e.other:Faction(e.self,415,5);  -- Temple of Solusek Ro
		e.other:Faction(e.self,416,-1); -- Shadowed Men
		e.other:QuestReward(e.self,math.random(100),math.random(100),math.random(20),0,eq.ChooseRandom(15022, 15035, 15038, 15039, 15303, 15328, 15355, 15364, 15445, 15300, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360, 13360),100);
		-- Force Snap, Bind Affinity, Lightning Bolt, Quickness, Whirl Til You Hurl, Column of Fire, Engulfing Darkness, Banshee Aura, Lifedraw, Charm, Rotted Illegible Scroll (Multiple copies added to increase percentage)
	-- The Bayle List quest
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 18808, item2 = 18809, item3 = 18810, gold = 20},1,text)) then -- Bayle List I, Bayle List II, Bayle List III
		e.self:Say("A simple code. Why do you even bother Rathmana with such child's play? Here is your translation. That was the easiest twenty gold coins I ever earned.");
		e.other:Faction(e.self,415,5); -- Faction: Temple of Solusek Ro
		e.other:Faction(e.self,416,-1); -- Faction: Shadowed Men		
		e.other:QuestReward(e.self,0,0,0,0,18825); -- Bayle List
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
