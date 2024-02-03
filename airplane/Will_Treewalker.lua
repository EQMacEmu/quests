function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Children of the trees, friend and protector of nature. We are brothers and sisters to the wolves and bears. The call of the Great Pine has filled your soul and you have found your way here to be tested. Are you ready to be tested?");
	elseif(e.message:findi("ready to be test")) then
		e.self:Say("The tests of old are difficult and dangerous, but the rewards for perseverance are great. I hold rewards for three tests. The test of the Wolf, test of the Bear and the test of the Tree.");
	elseif(e.message:findi("test of the wolf")) then --druid test of the wolf
		e.self:Say("So you wish to take the test of the wolf, do you? Go forth unto the islands and find an azure tessera, black face paint, and a worn leather mask.  Bring them back to me, but not until you have all three, and you shall be rewarded.");
	elseif(e.message:findi("test of the bear")) then --druid test of the bear
		e.self:Say("Ah, the test of the bear it is. Find in this plane a copper disc, a nature walker's sky emerald, and a mantle of woven grass. Bring all three at one time to me for your reward.");
	elseif(e.message:findi("test of the tree")) then --druid test of the tree
		e.self:Say("The test of the tree is said to be a test of Nature and only those stout of limb and bark will succeed. Bring to me a diaphanous globe, some hardened clay and a spiroc battle staff. Hand them all to me at once and the reward will be yours.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20930, item2 = 20728, item3 = 20729})) then 	--druid test of the wolf using azure tessera, black face paint, worn leather mask
		e.self:Say("Take this mask, nature friend.");
		e.other:QuestReward(e.self,0,0,0,0,2706,100000);  	--drake-hide mask
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20936, item2 = 20731, item3 = 20730})) then --druid test of the bear using copper disc, mantle of woven grass, nature walker's sky emerald
		e.self:Say("This mantle will protect you from the winds on your journeys naturewalker.");
		e.other:QuestReward(e.self,0,0,0,0,2705,100000); 	--nature walker's mantle
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20943, item2 = 20732, item3 = 20733})) then --druid test of the tree using diaphanous globe, hardened clay, spiroc battle staff
		e.self:Say("Great work, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,6411,100000); 	--shillelagh
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