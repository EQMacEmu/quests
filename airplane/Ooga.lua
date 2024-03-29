function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Euh? You come see Ooga about shaman tests? Me can test in shrink, the snake, or witch doctor! What yuz want to test in?");
	elseif(e.message:findi("shrink")) then --shaman test of shrink
		e.self:Say("Ohh! Dat gud tes, me know cuz me did it. Me had get a Efreeti War Club, Djinni Statuette, sum Corrosive Venom an sum Wooden Bands. Was hard for Ooga, me took long to get dem. Yuz give all to me at sam time me give yuz what me got.");
	elseif(e.message:findi("snake")) then --shaman test of the snake
		e.self:Say("Mmm, tes of snake not too bad, me did It an still alive. When me did It, me got Emerald Spiroc Feather, Bixie Essence, an Spiritualists Ring. Me get gud stuff for dat. Yuz giv me stuff all at once an me give to yuz what me got.");
	elseif(e.message:findi("witch doctor")) then --shaman test of the witch doctor
		e.self:Say("Oh! Now yuz got In da big mojo, me had big hard time wit dis one. Me got In lot of trouble when me got Efreeti War Maul, Thickened Nectar, Fire Sky Ruby an Symbol Of Veeshan. Yuz giv to me, Me be easy on yuz an giv prize me got.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20845, item2 = 20955, item3 = 20842, item4 = 20841})) then 		--shaman test of shrink using efreeti war club, djinni statuette, corrosive venom, wooden bands
		e.self:Say("Take this warhammer of the wind as your reward, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,27729,100000); --Warhammer of the Wind -- Original: Spiroc Warhammer (missing)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20962, item2 = 20843, item3 = 20844})) then 	--shaman test of the snake using emerald spiroc feather, bixie essence, spiritualist's ring
		e.self:Say("This ring should aid you greatly, " .. e.other:GetCleanName() .. ". Use it wisely.");
		e.other:QuestReward(e.self,0,0,0,0,27730,100000); --Vermilion Sky Ring -- Original: Crimson Ring of Desinence (11695)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20846, item2 = 20969, item3 = 20848, item4 = 20847})) then 	--shaman test of the witch doctor using efreeti war maul, thickened nectar, fire sky ruby, symbol of veeshan
		e.self:Say("Your deeds are beyond compare, " .. e.other:GetCleanName() .. ". Use Garduk with care though, for it is more powerful than any other weapon you have wielded.");
		e.other:QuestReward(e.self,0,0,0,0,11694,100000); --garduk
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
