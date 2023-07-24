function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi " .. e.other:GetCleanName() .. ". Did [Bordag send you]?");
	elseif(e.message:findi("bordag sent me")) then
		e.self:Say("So you want learn about how to fight like bear and crush enemy with bare hand? That good. Best way to start is just go out and do it. Biggest enemy around here lizard men. You go practice. Fight against lizard men. Bring me their tasty meat. You bring four.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13410, item2 = 13410, item3 = 13410, item4 = 13410})) then
		e.self:Say("Hmm, you do good against the lizard men. Here you go. If you want hat for head, bring four silk thread.");
		e.other:QuestReward(e.self,0,0,0,0,7375,250);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 16486, item2 = 16486, item3 = 16486, item4 = 16486})) then
		e.self:Say("Very nice. You fight good with hat me make you. You want pants to cover legs, bring me doll from lizards.");
		e.other:QuestReward(e.self,0,0,0,0,7376,400);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13367})) then
		e.self:Say("You do good, now me have doll to play with. I give you wepun if you bring me fur and wings from two big bats.");
		e.other:QuestReward(e.self,0,0,0,0,7377,600);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13061, item2 = 13061, item3 = 13062, item4 = 13062})) then
		e.self:Say("Good job, these keep me warm. Last job for you. Go kill more lizards. Bring four tails.");
		e.other:QuestReward(e.self,0,0,0,0,7378,1000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13354, item2 = 13354, item3 = 13354, item4 = 13354})) then
		e.self:Say("You quick. You do good work. Me come find you when more jobs need done. Here is last armur me have.");
		e.other:QuestReward(e.self,0,0,0,0,7379,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------