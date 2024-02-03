function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings there lad. Come seekin glory then have ya? Alrighty then, glorious ye shall be. Take me tests here, and I will show ya the light there. Take ye the Test of Resolution, of Theurgy, or the Weak?");
	elseif(e.message:findi("resolution")) then 	--cleric test of resolution
		e.self:Say("The test of resolution be an easy one.  Trust me there!  I'll just be needin' ye t' bring me a spiroc statuette, a spiroc healing totem, and a silvered spiroc necklace.  Ne'er liked those blasted birds anyway.");
	elseif(e.message:findi("theurgy")) then 	--cleric test of theurgy
		e.self:Say("The test of theurgy.  Ne'er unnerstood it meself. It calls fer ye t' bring me an efreeti mace, a saffron spiroc feather, a glowing sapphire, an' some djinni aura.");
	elseif(e.message:findi("weak")) then 		--cleric test of the weak
		e.self:Say("Aye, the weak.  I laugh at 'em meself.  Dinnae look so shocked, laddie!  I was only kiddin'!  Anyhow, ye know ye should help the weak, right? Unless ye worship one o' the evil ones, then ye kill em! So go out an' do what yer god expects from ye!  Oh, an' laddie, bring me an efreeti standard, a manna nectar, mithril bands, and a shimmering topaz.  Aye, that'll do it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20813, item2 = 20812, item3 = 20954})) then 					--cleric test of resolution using silvered spiroc necklace, spiroc healing totem, spiroc statuette
		e.self:Say("This necklace suits you well, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,14562,100000); --necklace of resolution
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20815, item2 = 20816, item3 = 20814, item4 = 20961})) then 	--cleric test of theurgy using djinni aura, efreeti mace, glowing sapphire, saffon spiroc feather
		e.self:Say("This weapon will aid you even as you fight. Use it wisely, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,27718,100000); --theurgist's star -- Original: Theurgist (11692)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20817, item2 = 20968, item3 = 20819, item4 = 20818})) then 	--cleric test of the weak using efreeti standard, manna nectar, mithril bands, shimmering topaz
		e.self:Say("You are a legend among clerics, " .. e.other:GetCleanName() .. ". Your deeds will be well remembered. Please, take this baton as a token of my admiration.");
		e.other:QuestReward(e.self,0,0,0,0,27719,100000); --Baton of the Sky -- Original: Truwian Baton (11691)
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
