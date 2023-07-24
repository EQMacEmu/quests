function event_signal(e)
	e.self:Say("Aye sir.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What's that in your pockets there, " .. e.other:GetCleanName() .. "? You wouldn't be carrying any unauthorized goods, would ya? Let me have a look in your coin purse to make sure it's all legal tender! Ah, ok, looks good to me.");
	end
end
