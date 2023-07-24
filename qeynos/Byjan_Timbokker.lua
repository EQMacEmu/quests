function event_spawn(e)
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if ( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Emote("picks up a discarded item from the ground and says, 'Don't people have enough respect for our grand city to not throw things onto the streets?!");
		end
	end	
end

function event_say(e)
  if(e.message:findi("hail")) then
    e.self:Say("Greetings!  Please do not ask me to donate to the Knights of Truth or the Priests of Life.  I have enough gold going to the city of Qeynos with all these new taxes!");
  end
end