local Nskin = {}

--Defining on which direction the other directions should be bassed on
--This will let us use less files which is quite handy to keep the noteskin directory nice
--Do remember this will Redirect all the files of that Direction to the Direction its pointed to
--If you only want some files to be redirected take a look at the "custom hold/roll per direction"
Nskin.ButtonRedir =
{
	Up = "Down",
	Down = "Down",
	Left = "Down",
	Right = "Down",
	UpLeft = "UpLeft",
	UpRight = "UpLeft",
	
	DownLeft = "UpLeft",
	DownRight = "UpLeft",
	Center = "Center",
}

-- Defined the parts to be rotated at which degree
Nskin.Rotate =
{
	Up = 180,
	Down = 0,
	Left = 90,
	Right = -90,
	UpLeft = 0,
	UpRight = 90,
	
	DownLeft = -90,
	DownRight = 180,
	Center = 0,
	
}

--Define elements that need to be redirected
Nskin.ElementRedir =
{
	["Tap Fake"] = "Tap Note",
	["Tap Explosion Dim"] = "Tap Explosion Bright",
	["Roll Explosion"] = "Hold Explosion",
	["Roll Topcap Inactive"] = "Roll Topcap Active",
	["Roll Body Inactive"] = "Roll Body Active",
	["Roll Bottomcap Inactive"] = "Roll Bottomcap Active",
	["Hold LiftTail Active"] = "Tap Lift",
	["Hold LiftTail Inactive"] = "Tap Lift",
}

-- Parts of noteskins which we want to rotate
Nskin.PartsToRotate =
{
	["Receptor"] = true,
	["Explosion"] = true,
	-- ["Tap Explosion Bright"] = true,
	-- ["Tap Explosion Dim"] = true,
	["Tap Note"] = true,
	["Tap Fake"] = true,
	--["Tap Lift"] = true,
	["Tap Addition"] = true,
	-- ["Hold Explosion"] = true,
	["Hold Head Active"] = true,
	["Hold Head Inactive"] = true,
	-- ["Roll Explosion"] = true,
	["Roll Head Active"] = true,
	["Roll Head Inactive"] = true,
}

-- Parts that should be Redirected to _Blank.png
-- you can add/remove stuff if you want
Nskin.Blank =
{
	["Hold Tail Active"] = true,
	["Hold Tail Inactive"] = true,
	["Roll Tail Active"] = true,
	["Roll Tail Inactive"] = true,
	["Hold Topcap Active"] = true,
	["Hold Topcap Inactive"] = true,
	["Roll Topcap Active"] = true,
	["Roll Topcap Inactive"] = true,
}

--Between here we usally put all the commands the noteskin.lua needs to do, some are extern in other files
--If you need help with lua go to http://dguzek.github.io/Lua-For-SM5/API/Lua.xml there are a bunch of codes there
--Also check out common it has a load of lua codes in files there
--Just play a bit with lua its not that hard if you understand coding
--But SM can be an ass in some cases, and some codes jut wont work if you dont have the noteskin on FallbackNoteSkin=common in the metric.ini 
function Nskin.Load()
	local sButton = Var "Button"
	local sElement = Var "Element"

	--Setting global button
	local Button = Nskin.ButtonRedir[sButton] or "Down"
	
	--Setting global element
	local Element = Nskin.ElementRedir[sElement] or sElement
	
	-- if string.find(sElement, "Head") then
	-- 	Element = "Tap Note"
	-- end

	if (
	 	string.find(Element, "Body") or string.find(Element, "Bottomcap") or string.find(Element, "Topcap")
	) or (
		string.find(Element, "Tap Mine")
	) or (
		string.find(Element, "Tap Lift")
	) then
		--We only have one set of hold/mine graphics
		Button = "Down"
	elseif Nskin.PartsToRotate[sElement] then
		-- string.find(Element, "Tap Note") or
	    -- string.find(Element, "Head") or
	    -- string.find(Element, "Explosion") or
	    -- string.find(Element, "Lift") or
	    -- string.find(Element, "Receptor") then
		--We want to make this a global noteskin so we will use "Center" for fallback for unknown buttons.
		Button = Nskin.ButtonRedir[sButton] or "Center"
	end
	
	--Returning first part of the code, The redirects, Second part is for commands
	local t = LoadActor(NOTESKIN:GetPath(Button,Element))
	
	--Set blank redirects
	if Nskin.Blank[sElement] then
		t = Def.Actor {}
		--Check if element is sprite only
		if Var "SpriteOnly" then
			t = LoadActor(NOTESKIN:GetPath("","_blank"))
		end
	end
	if Nskin.PartsToRotate[sElement] then
		t.BaseRotationZ = Nskin.Rotate[sButton] or nil
	end
			
	return t
end
-- >

-- dont forget to return cuz else it wont work >
return Nskin
