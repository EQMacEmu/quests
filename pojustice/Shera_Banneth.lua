function event_spawn(e)
	eq.set_timer("sit",100000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I dun wanna talk to anyone, go away! Dun ask me [why]!");
	elseif(e.message:findi("why")) then
		e.self:Say("My you are dense? Well I canna say I dinna expect it from a " .. e.other:Race() .. ". Aren't you afraid you are gonna end up like my [husband]?");
	elseif(e.message:findi("husband")) then
		e.self:Say("My husband was Suili Banneth.  He was a foul drunk of the worst sorts, never an 'onest day o' work in his life.  Well I found a man worth my time so a lil hemlock in Suili's ale at night an he dinna wake up.  I guess his family was upset aboot tha, so they petitioned ta sen' me 'ere.");
	end
end

function event_timer(e)
	if(e.timer == "sit") then
		e.self:SetAppearance(1);
		eq.set_timer("stand",2000);
	elseif(e.timer == "stand") then
		eq.stop_timer("stand");
		e.self:SetAppearance(0);
		eq.set_timer("sit",100000);
	end
end