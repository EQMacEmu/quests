function event_spawn(e)
	eq.set_timer("1",210000);
	eq.set_timer("2",220000);
	eq.set_timer("3",230000);
	eq.set_timer("4",400000);
	eq.set_timer("5",410000);
	eq.set_timer("6",420000);
	eq.set_timer("7",430000);
	eq.set_timer("8",440000);
	eq.set_timer("9",450000);
	eq.set_timer("10",700000);
	eq.set_timer("11",705000);
end

function event_timer(e)
	if(e.timer=="1") then
		e.self:Say("Nay friend, we appear to be making decent progress. The grimling numbers are increasing, but so are ours. Many of the newcomers are working with us in the moor and forests. The influx of adventurers has provided us with some amazing new leaders. They are so full of energy and fearless ambition");
		eq.stop_timer("1");
	end
	if(e.timer=="2") then
		e.self:Say("Aye friend, I guess that you are right. I am just ready to head back into the forest. I want to take those mines back before this season ends. We built this city from the acrylia in those mines and now look at us. We have to resort to using any scrap of acrylia that we can find.");
		eq.stop_timer("2");
	end
	if(e.timer=="3") then
		e.self:Say("Aye mate, a few games would be a fine sight. Well, let me get back in there. I'm sure that'll want to keep talking. Bah...");
		eq.stop_timer("3")
	end
	if(e.timer=="4") then
		eq.signal(155161,1,5); -- NPC: High_Spiritist_Jimuul
		eq.stop_timer("4");
	end
	if(e.timer=="5") then
		e.self:Say("Tell him what you have told him every season prior to this... We are keeping them from over running the city, the moor is clear with the exception of a few camps, and the forest outpost still stands. What more is there to report?");
		eq.stop_timer("5");
	end
	if(e.timer=="6") then
		eq.signal(155161,2,5); -- NPC: High_Spiritist_Jimuul
		eq.stop_timer("6");
	end
	if(e.timer=="7") then
		eq.signal(155160,5); -- NPC: Pathmaster_Kharin
		eq.stop_timer("7");
	end
	if(e.timer=="8") then
		eq.signal(155161,3,5); -- NPC: High_Spiritist_Jimuul
		eq.stop_timer("8");
	end
	if(e.timer=="9") then
		e.self:Say("Then make no demands of my soldiers beyond what they are already doing. It will serve no one to have our resources depleted before you can even produce the question I am supposed to answer. If you need more headway in the area of the mines, then tell the king that we need new incentives to compel the outsiders to aid us in that area. We cannot take that area with my men alone and I am not sending soldiers in to die without a known goal!");
		eq.stop_timer("9");
	end
	if(e.timer=="10") then
		e.self:Say("Bah, I do not know why I let these meetings bother me. They have little relevance to our current battle. The mines have been lost to those creatures and their ranks seem to swell to greater numbers with each day that passes.");
		eq.stop_timer("10");
	end
	if(e.timer=="11") then
		eq.set_timer("1",210000);
		eq.set_timer("2",220000);
		eq.set_timer("3",230000);
		eq.set_timer("4",400000);
		eq.set_timer("5",410000);
		eq.set_timer("6",420000);
		eq.set_timer("7",430000);
		eq.set_timer("8",440000);
		eq.set_timer("9",450000);
		eq.set_timer("10",700000);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
