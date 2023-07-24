function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("turns to you and smiles brightly, 'Hello, " .. e.other:GetCleanName() .. ".  Lots of work to be done- books to shelve, lessons to learn...  I know it sounds a bit ridiculous, but I feel so at home here.");
	elseif(e.message:findi("exodus")) then
		e.self:Say("Wow, what an interesting subject- almost impossible to gather hard evidence on, even for me.  It seems that everyone was so taken off guard by the sudden change of scenery that no one bothered to keep any written record of the time.  First they had to figure out where they were and once they did there was so much disagreement as to what they should be doing- try to get home, stay where they were and settle in or put some distance between them and Seru should he and his people try to follow, which, of course they did.  All this lead to the formations of three of the four major cities here on Luclin, all with... oh listen to me go on, sorry.  We have only one book on the subject, but Peqi borrowed it just the other day.");
	elseif(e.message:findi("peqi")) then
		e.self:Emote("frowns a bit for the first time this conversation, 'Peqi... Let me tell you, I like just about everyone but if that little gnome never found his way back to this library I wouldn't be too disappointed.");
	end
end
