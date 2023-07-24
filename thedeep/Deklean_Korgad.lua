function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("eyes you suspiciously. His beard is tangled in completely impossible knots, and you wonder very much if he has ever seen fresh water in his life. He seems to be completely oblivious of the small insects that crawl freely across his tattered clothing. He speaks to you in a low growl. 'Go away! I don't like being bothered! Your making too much noise! The horrors will hear you and then I'll have to [move again]!'");
	elseif(e.message:findi("move again")) then
		e.self:Emote("glares at you. 'You're really out to get me killed aren't you? How am I supposed to find [deep spores] with you thrashing about waking up the beasties and scaring all the shriekers!'");
	elseif(e.message:findi("deep spore")) then
		e.self:Say("Never heard of deep spores have you? Well if you're going to be spending some time down here you'd best learn quickly. Deepspores are the only thing edible in this cavern. Most of the mushrooms down here will sooner eat you then allow them selves to be eaten! The Deepspores are different though, if you cook them a bit they're the most delicious food in the universe!");
	elseif(e.message:findi("chasm")) then
		e.self:Emote("rolls his eyes at you. 'Hmm...I'm not sure, maybe that big gaping hole in the ground down through the second corridor! You haven't even explored the cavern yet have you. I wouldn't wander around too much unless you're feeling lucky. There's nothing the thought horrors like more than a loud obnoxious band of would be heros that come crashing into their home. They especially like playing with the corpses of those that fall through that fake bridge out there.'");
	elseif(e.message:findi("fake bridge")) then
		e.self:Say("Yes that bridge out there is fake, I'm sure more than a few of your kind will end up falling straight through it like lemmings. I'll be taking the safe route thank you very much. Just have to be careful about sneaking past all the beasties. Somehow I doubt you'd make it past any of them as careless as you prance around. Few can face the thought horrors and get away with their sanity. I'm one of the lucky ones, yup!");
	elseif(e.message:findi("thought horror")) then
		e.self:Emote("laughs uncontrollably. When he finally regains his composure he looks at you and says, 'All right chief, if you can prove to me that you can stand up to horrors then I'll show you the way across the chasm. Bring me 2 thought horror tentacles and that hunk of rock I gave you and we'll see about getting you across that bridge. Oh and by the way, since you're so full of energy, go run to shadowhaven and bring me back some Deep Cavern Bourbon along with those tentacles.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 32400,item2 = 32400,item3 = 32400,item4 = 32400})) then
		e.self:Emote("eyes the spores hungrily. He shoves them all in his pockets and looks at you. 'I appreciate that friend, you've proven yourself worth a bit of trust. I hate to take the mushrooms and run, but I have to get across the [chasm] soon. Here take this, thanks for the mushrooms!'");
		e.other:Faction(e.self,1569,2);
		e.other:QuestReward(e.self,0,0,0,0,32402,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
