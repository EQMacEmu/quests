function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Buy something!! This is no tavern! I am not selling conversation!");
	elseif(e.message:findi("donate") or e.message:findi("donation")) then
		e.self:Say("You must be kidding! As a merchant I pay enough in taxes. There is nothing LEFT to donate!");									
	end
end
