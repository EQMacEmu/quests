function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". What brings you to the watery lands of Rathetear? Do you seek [enlightenment]?");
	elseif(e.message:findi("enlightenment")) then
		e.self:Emote("in a hushed voice, almost inaudible...'I was once told that there was a noble man who held a sword of immense power. He was known all throughout Norrath as being a powerful, yet gentle man. During one of his crusades something awful [happened].");		
	elseif(e.message:findi("happened")) then
		e.self:Emote("leans forward, brushes her hand lightly against your cheek and says 'Death.'");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
