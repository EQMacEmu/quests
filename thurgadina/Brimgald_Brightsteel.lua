function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ye have the look of an aspirin' velium smith about ye, " .. e.other:GetCleanName() .. ". Well, ye won't get very far in the field without purchasin' some o' the finest smithin' molds in Thurgadin. Lucky for you I can help ye in that department, so what'll it be?");
	end
end
