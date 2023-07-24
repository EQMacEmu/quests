function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. researcher!  There are many things to be found here.  Our selection grows daily.  Would you [care for any books]?");
	elseif(e.message:findi("any book")) then
		e.self:Say("Excellent!  I love to see the young so interested in knowledge.  What subject would you like to research? My most interesting topics today would have to be the Hole. old Paineel. the Underfoot. and the history of Paineel.");
	elseif(e.message:findi("history of paineel")) then
		e.self:Say("Tis an excellent topic. " .. e.other:GetCleanName() .. ".  Much can be learned of a civilization if one first understands its history.  I hope you enjoy the book.");
		e.other:SummonCursorItem(18093); -- History of Paineel
	elseif(e.message:findi("about the hole")) then
		e.self:Say("Here you are. " .. e.other:GetCleanName() .. ".  The book has old bindings and is worthless to most. but the value of knowledge is priceless.");
		e.other:SummonCursorItem(18091); -- History of the Hole
	elseif(e.message:findi("about the underfoot")) then
		e.self:Say("Excellent choice. " .. e.other:GetCleanName() .. ".  The Underfoot is a mysterious place.  I hope you get as much from the book as I did.");
		e.other:SummonCursorItem(18094); -- Underfoot Musings
	elseif(e.message:findi("about the old paineel")) then
		e.self:Say("Take this book. " .. e.other:GetCleanName() .. ".  It contains the history of the ancient city from which we came.");
		e.other:SummonCursorItem(18092); -- Old Paineel
	end
end
