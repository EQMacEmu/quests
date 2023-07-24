function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, and welcome to my shop. I am humble merchant Shenro Kazpur of the Silent Fist Clan.");
	elseif(e.message:findi("lusun")) then
		e.self:Say("Ahhh, Lu'Sun is a master of many skills.  He has traveled all of Norrath, studying various techniques and disciplines.  Now, he runs this small guild and passes on his knowledge to those willing to devote their lives to our cause.");
	end	
end