function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings Warrior of mind and body. To prove your worth to me, you must complete a test. Which test do you wish to take? I will permit you to take the test of Tears, Fists, or Tranquility.");
	elseif(e.message:findi("tears")) then --monk test of tears
		e.self:Say("The test of tears involves knowing when to release, and when to provide a shoulder for another. Bring me a Spiroc Statuette, a Spiroc Talon, and a Silken Wrap. I will teach you the way.");
	elseif(e.message:findi("fists")) then --monk test of fists
		e.self:Say("A monk must know when to use his or her fists, and when to use ones mind. You must decide in this endevour, which you shall use. Return to me, once you have found them, a pair of Brass Knuckles, a White Spiroc Feather, an Ethereal Amethyst, and a Nebulous Sapphire.");
	elseif(e.message:findi("tranquility")) then --monk test of tranquility
		e.self:Say("Ah, the test of tranquility. Only the tranquil monk can achieve enlightenment. Are you such an individual? Time shall tell. Retrieve these items for me. Bring an aged nectar, a Writ of Quellious, and a Tear of Quellious. Then we shall assess your ability.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20800, item2 = 20954, item3 = 20799})) then --monk test of tears using silken wrap, spiroc statuette, spiroc talon
		e.self:Say("You have come a long way in your search for enlightenment, " .. e.other:GetCleanName() .. ".  Please, take these shoulder wraps of the legendary Ton Po.");
		e.other:QuestReward(e.self,0,0,0,0,1283,100000); --ton po's shoulder wraps
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20803, item2 = 20801, item3 = 20802, item4 = 20960})) then --monk test of fists using brass knuckles, ethereal amethyst, nebulous sapphire, white spiroc feather
		e.self:Say("You embody tranquility, " .. e.other:GetCleanName() .. ". You may now wield the Fist of Wu.  May Quellious bless you with peace.");
		e.other:QuestReward(e.self,0,0,0,0,27715,100000); --Wu's Fist of Mastery -- Original: Wu's Tranquil Fist (11690)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20967, item2 = 20804, item3 = 20805})) then --monk test of tranquility using aged nectar, writ of quellious, tear of quellious
		e.self:Say("You have done well, " .. e.other:GetCleanName() .. ".  You have both my respect and the legendary golden sash.  Wear it well, enlightened one.");
		e.other:QuestReward(e.self,0,0,0,0,11698,100000); --golden sash of tranquility
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
