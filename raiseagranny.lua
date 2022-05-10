local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "ooga booga hub", HidePremium = true, SaveConfig = false, ConfigFolder = "OrionTest"})

local Main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Main:AddButton({
	Name = "Inf Money",
	Callback = function()
        for i=1, 100 do
            game.ReplicatedStorage.cleanPoop:FireServer()
        end
  	end    
})
