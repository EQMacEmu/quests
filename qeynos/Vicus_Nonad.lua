function event_spawn(e)
	eq.set_timer("cough",350000);
end

function event_timer(e)
	if(e.timer == "cough") then
		e.self:Emote("coughs and wheezes.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ".  My name is Vicus Nonad. <cough>  I am the official tax collector for the fine city of Qeynos. <cough>  I serve the will of Antonius Bayle, our glorious leader.  <cough>  <cough>  Please excuse my [cough].  <cough>");
	elseif(e.message:findi("cough")) then
		e.self:Say("Oh, <cough> I am sorry, but it seems I have fallen a bit ill.  I was caught out in the rain the other day and my chills have gotten the best of me. <cough>  If only someone would [help] me with today's [collections]..  <cough>");
	elseif(e.message:findi("help.* collection")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Oh thank <cough> you so <cough> <cough> much <cough>..  Here is the official collection box.  Please collect from each merchant on the <cough> [list].  Then bring me back the combined total of all your collections.");
			e.other:SummonCursorItem(17012); -- Item: Tax Collection Box
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("list")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Oh.  <cough>  I am sorry..  I forgot to give it to you.  Here you go.  Be sure to give that back when your job is finished.  <cough>");
			e.other:SummonCursorItem(18009); -- Item: List of Debtors
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Very good <cough> work. But I need both the full tax collection box and the list of debtors. You did get the [list] from me before you left, right? <cough>";
	
	if(e.other:GetFactionValue(e.self) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13181,item2 = 18009},1,text)) then
		e.self:Say("<cough> Great! Thank you so much. Here is a small gratuity for a job well done. Thank you again. <cough> Antonius Bayle and the People of Qeynos appreciate all yo have done.");
		-- Confirmed Live Factions and Experience
		e.other:Faction(e.self,219,10,0); -- Faction: Antonius Bayle
		e.other:Faction(e.self,262,10,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,304,-5,0); -- Faction: Ring of Scale
		e.other:Faction(e.self,273,-10,0); -- Faction: Kane Bayle
		e.other:Faction(e.self,291,10,0); -- Faction: Merchants of Qeynos
		e.other:QuestReward(e.self,{silver = math.random(0,5),gold = math.random(0,2),itemid = eq.ChooseRandom(13053,10010,10018,10017,10015),exp = 1000});
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
