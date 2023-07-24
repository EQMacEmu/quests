function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Emote("groans in extreme anguish. '[Help] me.'");
		
	elseif ( e.message:findi("help") ) then
		e.self:Say("My resting grounds have been desecrated. I now lie awake unable to rest with my fellow brethren. My soul is bound to this area for all of eternity. Until my [belongings] are brought back I cannot rest.");

	elseif ( e.message:findi("belongings") ) then
		e.self:Say("Many different things were taken, but I'm mainly concerned with my [amulet] and my family's crescent symbol. Bring these articles back into my possession and I'll return back to my state of rest.");

	elseif ( e.message:findi("amulet") ) then
		e.self:Say("The amulet was given to me after passing the Trials many many generations ago.  It is a part of every soldier who has passed the trials, it is a part of my very being.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if ( item_lib.check_turn_in(e.self, e.trade, { item1 = 20605, item2 = 20606 }) ) then -- Crescent Symbol of Rhaj, Righteous Amulet of Marr
		e.self:Emote("quickly grabs the amulet and crescent symbol before speaking. 'At long last! I can now rest in peace along with my fellow brethren. Thank you "..e.other:GetName()..". May the might of Marr follow you wherever you may go.'");
		e.other:QuestReward(e.self, 0, 0, 0, 0, 0, 250000);
		eq.spawn2(208209, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading() ); -- #A_Wandering_Spirit
		eq.depop_with_timer();
	end	
	item_lib.return_items(e.self, e.other, e.trade);
end
