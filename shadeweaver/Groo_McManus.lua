function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings adventure seeker. I have come from afar to study this strange thicket. The spirits are strong within this region, but they are secretive as well.  I am willing to impart my wisdom to those who will aid me in my exploration. Are you [interested?]");
	elseif(e.message:findi("interested")) then
		e.self:Say("Very well then! Let us begin.  First you must attune yourself with the nature of spirits. For this you must learn to find a spiritual anchor. Find such a thing within the crater that surrounds Shar Vahl and return it to me.  Then we may continue. I cannot tell you more, but there is a Vah Shir who has the knowledge that you seek. Seek him out in this thicket to learn what you can.");
	elseif(e.message:findi("ready")) then
		e.self:Say("You have learned a fraction of the nature of the spirit. To exist within our realm they must become a part of our realm by binding themselves within material. The hoplings claws have evolved to tear spirits from their material anchors. A disrupted anchor will normally send a spirit to the planes in which they belong, but sometimes the spirit becomes lost. This has happened within the crater that surrounds Shar Vahl. We must do what we can to [help] the lost spirit. The lost spirit had found the nearest anchor to take refuge in when its own anchor was destroyed. The spirit now lies trapped within the very claws of the hopling that had tried to destroy it. Will you help?");
	elseif(e.message:findi("help")) then
		e.self:Say("Near the south bridge of Shar Vahl city, a mysterious rock formation hangs precariously within the crater. When you have arrived, you stand beneath the rock and call to the wind, speak the word 'Lumanes', be sure to clear all thoughts from your mind when doing so. If we are not too late, a kindred spirit will speak with you. Take your discoveries to my friend Shavra in the crater, she will know what to do.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30601})) then
		e.self:Say("Excellent! You have done well.  I can sense that you are in tune with the spirits around you. Take this, for you will need it in your next task. When you are [ready] for your next lesson let me know.");
		e.other:QuestReward(e.self,0,0,0,0,15093,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
