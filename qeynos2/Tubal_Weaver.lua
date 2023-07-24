function event_spawn(e)
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if ( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Say("Hey!  Someone dropped a perfectly good thing-a-ma-jig!  Oh well, finders keepers!");
		end
	end	
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. "!  I am Tubal Weaver, humble merchant and retired guardsman of Highkeep.  I make a tidy living dealing with the throngs of adventurers who take it upon themselves to keep Qeynos beetle-free.  If you want some free advice, I recommend that you not deal with any of the merchants in town.  I can offer much lower prices than they because I do not have the overhead of a shop to maintain.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 2) then
		e.self:Say("Whew. I am parched. I will be back in a few minutes.");
		e.self:MerchantCloseShop();
	elseif(e.wp == 15) then
		e.self:Say("Hey sweetheart, I'll have my usual. Could you bring it upstairs for me?");
		eq.signal(2083,1); -- NPC: Sabnie_Blagard
	elseif(e.wp == 38) then
		e.self:Say("Hey, hey, hey! Tubal Weaver open for business!");
		e.self:MerchantOpenShop();
	end
end

function event_signal(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	
	if(e.signal == 1 and xloc == 372 and yloc == 37) then
		e.self:Say("Is he wise to us?");
		eq.signal(2083,3); -- NPC: Sabnie_Blagard
	elseif(e.signal == 2) then
		e.self:Say("Well, we won't have to worry about him much longer. I have some friends coming into town who owe me the kind of debt you can't repay with gold.");
		eq.signal(2083,4); -- NPC: Sabnie_Blagard
	elseif(e.signal == 3) then
		e.self:Say("Don't you worry, sugar, his days are numbered. You better get back before he suspects something. We'll be together soon enough.");
	end
end
