function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi " .. e.other:GetCleanName() .. ", if some of the folks have been not so nice to you please forgive them. We don't usually receive many visitors down here and if we do trouble usually isn't far behind them.");
	end
end
