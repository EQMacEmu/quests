function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ale you say? No ale here friend, I am a blacksmith. You'll have to speak loud and clearly by the way, I don't hear so well since the [incident]. Show me your slate if you're looking for work.");
	elseif(e.message:findi("incident")) then
		e.self:Say("I was quite a homely yet sensitive lad, bad combination. As I was growing up I was teased mercilessly. In an effort to block out the ridicule I habitually placed my fingers far into my ears. My claws must have done some kind of permanent damage.");
	elseif(e.message:findi("fastener")) then
		e.self:Emote("squints as he reads your lips, 'Fasteners you say? Show me your slate and I'll make you a deal.");
	elseif(e.message:findi("barkhem")) then
		e.self:Emote("blushes a bit and says, 'No no, you are the gem my friend.  You remind me a bit of Barkhem... he was my best student ever.  When the work of being Master Smith got to be too much for someone my age, it was quite easy to decide who would fill my shoes.  These days anyone wanting to learn the ways of the smith go to him.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2877})) then --Acrylia Slate of Shar Vahl
		e.self:Say("My wife is making some jewelry. Not the sparkly stuff, mind you. She is nearly blind so appearance means little to her. She is intent on making jewelry with a more, uhh, natural feel. Currently she's constructing a special scorpion leg necklace, and is in need of more scorpion legs. I can't leave the shop so I need your help. Fill this box with scorpion legs and I'll pay you with metal fasteners that any merchant will gladly buy.");
		e.other:QuestReward(e.self,{items = {2877,17238}}); --Acrylia Slate of Shar Vahl, Kagazz's Box
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3676})) then --Box of Scorpion Legs
		e.self:Say("Ahh, " .. e.other:GetCleanName() .. "! I thank you, my wife will be most grateful. Here are the fasteners I promised you. You know " .. e.other:GetCleanName() .. ", there was a time that young, would-be smiths would seek my approval so that they could study the ways of the forge under my tutelage. That was back when I was Master Smith, before I named Barkhem my successor.");
		e.other:QuestReward(e.self,{itemid = 3667, exp = 10}); --Forged Fasteners
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
