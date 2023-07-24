function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("seems to completely ignore you. After close examination you begin to wonder if this creature is actually alive.");
	elseif(e.message:findi("owes helssen")) then
		e.self:Say("What?! I owe him nothing! Nothing at all! I didn't ask him to.., err. What proof do you have? How do I know he sent you? Bah, leave me, $race.");
	elseif(e.message:findi("great foes")) then
		e.self:Say("Yes. One of note was the vile and evil sorcerer Rosh. A better example of depravtity and anti-morality I cannot think of. He researched magics destined to end all life on this cold chunk of rock and snow. We made it our mission to destroy him. In the end we defeated him, but alas our friend and comrade was slain. Poor Abrams was left cursed forever to wander that spire of ultimate loathing, the Tower of Frozen Shadow.");
	elseif(e.message:findi("abrams")) then
		e.self:Say("Abrams was a brave warrior and a good friend. His great maul could always be counted on to strike true as he used his body to shield others from grievous wounds. He sacrificed himself to save us from the eternal suffering he now endures up in that dark tower. The book you now seek, is in his possesion. You must first destroy his tormented form to free him from his madness. Tell him you seek the Arcanum and then give him the lock of hair I just gave you. You also will need the key?");
	elseif(e.message:findi("key")) then
		e.self:Say("We ambushed Rosh on an expedition into the cursed Tower.  When we faced him, Abrams ran forward and grabbed the Arcanum. He held it to his chest as lightning and flame rained down upon him. With Rosh busy trying to save his book it gave Halldor and I enough time to strike Rosh down. We went to Abrams and found our friend left a smoking pile of Coldain ruin. He underwent a strange transformation in which the Arcanum was lost. We decided Halldor should keep the key.");
	elseif(e.message:findi("halldor")) then
		e.self:Say("Halldor has retired from the life of an adventurer as I have. I would not tell you where he is as he is a good friend, but what I owe Helssen is stronger than comraderie or even friendship so I must comply; it is the word of Veeshan. Halldor now defends the halls in the great city of Thurgadin. To get the key you must fight your way into the city and kill Halldor. I wish you a most horrendous death, $race. Now leave me to my sleep.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1710}, 0)) then -- inscribed velium tablet
		e.self:Emote("curses and goes into a fit of frustration before finally giving in. The ancient sea turtle finally says, 'Fine. I don't know what Helssen wants with that but I know where you can find it. Years and years back I traveled with a group was called the Icy Mugs. We were a mercenary company out for fun and profit, and there was plenty of that. During our adventures we ran across a great many foes.'");
		e.other:QuestReward(e.self,0,0,0,0,1711,1000); -- Lock of Dwarven Hair
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
