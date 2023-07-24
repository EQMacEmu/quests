function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is staring at me again!  I should pluck its eyeballs out!");
	elseif(e.message:findi("staring")) then
		e.self:Say("The cave bear in the corner of course.");
	elseif(e.message:findi("bear")) then
		e.self:Say("Are you blind " .. e.other:Race() .. "? It's Huge! Look at the claws on it! It is the bear that ate Dlemin.It's hungry too, just waiting for me to sleep.");
	elseif(e.message:findi("sleep")) then
		e.self:Say("No! I will not sleep! It will eat me! I will stay awake forever! Forever I tell you!");
	elseif(e.message:findi("dlemin")) then
		e.self:Say("Dlemin was my best friend!  Now he is not here!  I will avenge him some day, when the bear stops staring at me.");
	elseif(e.message:findi("velketor")) then
		e.self:Say("Who is this Velketor!  All I know is the bear will eat me if I sleep, so I will never sleep!");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("The cave bear in the corner of course!");
	end
end