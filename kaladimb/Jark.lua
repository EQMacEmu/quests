-- Paladin Epic 1.0
function event_spawn(e)
	eq.set_timer("Nothin",4200000);
end

function event_timer(e)
	e.self:Emote("strikes the wall with his pick. A dull clang sounds throughout the cave. 'Arrr. Nothin' here either.");
end


function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("strikes the wall with his pick. A clacking sound echoes through the cave. 'Har har. There's something all right.'");
	elseif(e.message:findi("something")) then
		e.self:Say("Huh? Oh, I struck me some silver. Ain't gonna make me rich but it'll sure pay for me minin' costs. Speakin of, that wife o' mine was supposed ta bring me food already. Hey, you, wanna go get me my dinner? I ain't got nothing ta pay ya with but I sure would appreciate it.");
	elseif(e.message:findi("dinner")) then
		e.self:Say("Har, I know you were a good sort. Nella has it. She's out there somewhere in the lower areas. She likes to visit the temple, so maybe she's there. Just tell 'er Jark sent ya and she'll prolly have everythin' ready fer me.");
		eq.unique_spawn(67090,0,0,178.5,708.9,3.4,194.2); --spawn Nella Stonebraids
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29007})) then --cold plate of beef and bread
		e.self:Say("Har, har! No time fer eatin' now! While you were gone I struck me a rich vein. Lookie here! Ya ever seen a gem so pure? It's tiny but clear as glass. Ya take it, " .. e.other:GetCleanName() .. ". Ya showed me some kindness, least I can do. Besides, still a share here for me.");
		e.other:QuestReward(e.self,0,0,0,0,29006); --pure crystal
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
