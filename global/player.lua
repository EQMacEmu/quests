function event_discover_item(e)
	eq.debug("item is " .. e.item:Name() .."");
	e.self:Message(15, "" .. e.self:GetCleanName() .. " has discovered " .. e.item:Name() .. "" );
end