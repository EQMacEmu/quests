function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("By Brell's black beard, ye startled me! So, it seems you have survived the dangers of the pit like we did. At first we thought it a blessing, but now we know that it is the curse of our dishonor.");
	elseif(e.message:findi("dishonor")) then
		e.self:Say("It hurts me still to speak of it, but I shall try. The three of us were banished from holy Thurgadin and cast into the pit for crimes we did commit. I myself was guilty of trading gems to the Kromrif. I thought nothing of it at the time save that they paid well. If only I had known back then, if only I wasn't so foolish.");
	end
end
