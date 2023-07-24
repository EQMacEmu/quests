function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is a pleasure to meet you, " .. e.other:GetCleanName() .. ". I am the residing High Priest of the House of Stout. Many have come to seek my guidance for I have seen many a foe in my fighting days. If you are interested in [lending a hand] to the House of Stout, I may have some tasks for you to complete");
	elseif(e.message:findi("lending a hand")) then
		e.self:Say("Aye, its good to hear that! We need all the help we can get with all the dern [smugglers].");
	elseif(e.message:findi("smuggler")) then
		e.self:Say("Well the smugglers are a threat to all that we have accomplished here they steal stolen goods and turn around to sell them and undercut all the merchants of our quarter. There is not much we can do about them now but in time I may need your help. For the time being however, if you wish to assist us there are other [tasks] which I need to be completed.");
	elseif(e.message:findi("task")) then
		e.self:Say("I believe we have some letters and supplies that need a trustworthy courier to see that they reach their destination. With the problems of smuggling we are having lately we have had a shortage of honest folks outside of the Haven. Please see Coglixar for further information and inform him that you wish to assist.");
	end
end

