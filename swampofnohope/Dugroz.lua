-- Quest for Charasis (Howling Stones) Key

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Fffrroaaak!!  Go away!  I don't want to [work for them] anymore! Go find another slave!");
	elseif(e.message:findi("work")) then
		e.self:Emote("looks relieved and eyes you, considering. Finally, he begins to recant his tale. 'I was once the slave of an important Iksar necromancer. I was his Dugroz, his head slave. One night, I heard two other slaves talking about me. I could barely hear them but what I did hear frightened me. My master was going to use me one last time. He was going to sacrifice me to craft a spell component for one of his most powerful spells. Hearing this, I used my privileges as his head slave and made my [escape].'");
	elseif(e.message:findi("escape")) then
		e.self:Say("After I escaped, I lost myself in the depths of the swamp. I discarded all the keys but one. I will gladly give it to you if you can do me a [small favor].");
	elseif(e.message:findi("small favor")) then
		e.self:Emote("Dugroz blinks his eyes and leans forward. He whispers so quietly you must strain to hear him, 'I have taken up the same magics as my master. I require two components to complete a spell I have been researching for quite some time. The first is a vampire's fang. I have heard tales of a vampire who haunts the ruins of Kaesora. I also need a jade weapon stained by the blood of a chokidai. Look in the Lake of Ill Omen at the sarnak outpost. The leader used to herd chokidai, or so I am told.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7236, item2 = 7256})) then
		e.self:Say("My thanks to you, " .. e.other:GetCleanName() .. ". Take this key--I know not what door it opens. Now if I can just find that necklace of power that I took from my master's lair!");
		e.other:QuestReward(e.self,0,0,0,0,20600);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Quest by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
