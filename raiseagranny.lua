local plr = game.Players.LocalPlayer
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "ooga booga hub", HidePremium = true, SaveConfig = false, ConfigFolder = "OrionTest"})

local function deletescript(item)
	if item:IsA("LocalScript") then
		item.Parent = nil
	end
end
local function spamRemote(item : RemoteEvent, times : number)
	for i=1, times do
		item:FireServer()
	end
end
local Main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Main:AddButton({
	Name = "Inf Money",
	Callback = function()
        spamRemote(game.ReplicatedStorage.cleanPoop, 100)
  	end    
})
Main:AddButton({
	Name = "Get Food",
	Callback = function()
		local args = {
			[1] = game:GetService("ReplicatedStorage").Items.food
		}

		game:GetService("ReplicatedStorage").buyTool:FireServer(unpack(args))

	end
})
Main:AddButton({
	Name = "Inf Food",
	Callback = function()
		for i=1, 100 do
			local args = {
				[1] = game:GetService("ReplicatedStorage").Items.food
			}
			game:GetService("ReplicatedStorage").buyTool:FireServer(unpack(args))
		end
	end
})
Main:AddToggle({
	Name = "Anti-Hunger",
	Flag = "anti_hunger"
})
while task.wait() do
	if OrionLib.Flags["anti_hunger"].Value == true then
		local script : LocalScript = plr.Character.killplayers
		deletescript(script)
	end
end