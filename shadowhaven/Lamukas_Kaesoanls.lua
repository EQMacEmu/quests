function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ", and welcome to the House of Midst. I am House Ambassador Lamukas Kaesoanls. I am a direct descendant of Gidins Kaesoanls, one of the original magicians responsible for opening the portal to the wondrous and magical world of Luclin. If you are interested in assisting the House of Midst please visit Beriol or Palomidiar in the library.");
	end
end
