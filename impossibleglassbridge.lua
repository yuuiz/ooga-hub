getgenv().removemode = false -- Remove the glasses but gives you godmode so if you accidently fall you die.
getgenv().invismode = true -- Make the glasses invisible :)

while true and task.wait() do
for i,v in pairs(game:GetService("Workspace")["Glass Bridge"].GlassPane:GetDescendants()) do
	if v.Name == 'TouchInterest' then
		if getgenv().removemode == true then
			v.Parent.Transparency = 1
			return
		end
		if getgenv().invismode == true then
			v.Parent:Destroy()
			return
		end
	end
end
end