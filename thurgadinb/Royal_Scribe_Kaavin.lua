function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, as the official Royal Scribe of Dain Frostreaver IV, it is my duty to pen, NO . . . WAIT. . . write. NO . . . I mean scribe, yes that's the word I'm looking for. I scribe the thoughts of the Dain for posterity. I currently have record books with a combined 11,982 pages of notes detailing the life and business of our present Dain. You see, I have a rather bad memory, so I write everything down. My latest entry is that on this day " .. e.other:GetCleanName() .. " came and talked to me. Anyhow, I'm sure you have much better things to do than talk to me, so good luck in your ventures, " .. e.other:GetCleanName() .. ", and come visit me any time.");
	end
end
