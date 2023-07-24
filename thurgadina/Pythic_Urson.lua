function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("turns and looks at you. 'What? He goes back to drinking his ale and resting.");
	elseif(e.message:findi("ale")) then
		e.self:Say("Its a fine Coldain ale. Good for quenchin yer thirst after a hard day of minin. The ales name doesnt matter cause ya wouldnt be able to hold it down anyways. Har har.");
	elseif(e.message:findi("mining")) then
		e.self:Say("Aye. Mining. Im a miner. Thats a hard one to put together eh? Yer about as sharp as me hammer and as quick as the mining crud on me boots.");
	elseif(e.message:findi("crud")) then
		e.self:Say("Mining crud, thats what I said. Mixture o' velium dust, mud, and whatever other junk is left on the floor after I be minin. Hard as a giant to fight off me boots.");
	elseif(e.message:findi("boots")) then
		e.self:Say("There used ta be a mixture we used ta clean off our boots but that was when we had more warriors ta get ta different places. Now it aint possible so the crud just keeps buildin up on me boots.");
	elseif(e.message:findi("warriors")) then
		e.self:Say("If you think ya can get what's needed then go ahead. The mixture used ta be made out of saps and acidic oozes. You find some and bring it to me maybe I can slap it together.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30058,item2 = 30060})) then -- fresh tree sap and Bladder of Acidic Ooze
		e.self:Emote("laughs at you and then takes the sap and bladder.  He mixes the two together and then adds something from a small pouch he carries.  With a quick sizzle he pours some on his boots and the crud melts away.  'See that?  Didnt do anythin but get rid of the crud.   This stuff is great.  It doesnt burn yer skin or valuables.  Here ya go, ya can have the rest.'");
		e.other:QuestReward(e.self,0,0,0,0,30061,5000); -- Dissolving liquid
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
