local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local plr = game.Players.LocalPlayer
local name = plr.Name

OrionLib:MakeNotification({
	Name = "solibec hub loaded",
	Content = "welcome "..name,
	Image = "rbxassetid://4483345998",
	Time = 5
})
local Window = OrionLib:MakeWindow({Name = "solibec's uwu gui", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddLabel("gives you inf cash")
Tab:AddToggle({
	Name = "Inf Monei",
	Default = false,
	Flag = "infcash"
})
Tab:AddLabel("anticheat bypass ez")
Tab:AddToggle({
	Name = "Anticheat fucker",
	Default = false,
	Flag = "noac"
})
Tab:AddLabel("this supports tool too :)")
Tab:AddToggle({
	Name = "Inf Stamina",
	Default = false,
	Flag = "infrun"
})
Tab:AddLabel("Work best with BOOM tool")
Tab:AddToggle({
	Name = "Always Can Run",
	Default = false,
	Flag = "alwaysrun"
})
Tab:AddLabel("speaks for itself, and does not put you in debt lol")
Tab:AddButton({
	Name = "Get All Tools",
	Callback = function()
	  	pcall(function()
			for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ShopGui.ShopTools:GetChildren()) do
				local args = {
					[1] = v
				}
				
				game:GetService("ReplicatedStorage").ShopEvents.Buy:FireServer(unpack(args))
			end
		  end)
  	end    
})
local Tab2 = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab2:AddLabel("make sure to use anticheat fucker or else you get kicked")
Tab2:AddSlider({
	Name = "Walkspeed",
	Min = 0,
	Max = 500,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "speed",
	Flag = "walkspeed"
})
Tab2:AddSlider({
	Name = "Jumppower",
	Min = 0,
	Max = 500,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "power",
	Flag = "jumppower"
})
local Tab3 = Window:MakeTab({
	Name = "Rake",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local rake_health = Tab3:AddLabel("cum balls")
Tab3:AddButton({
	Name = "Teleport To Rake",
	Callback = function()
	  	pcall(function()
			-- thanks you dev forum very cool
			plr.Character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.Rake.Head.Position)--replace part with the name of the part, or replace the location to the location of the part.
		  end)
  	end    
})
Tab3:AddButton({
	Name = "Kill Rake",
	Callback = function()
	  	pcall(function()
			local args = {
				[1] = workspace.Rake.HumanoidRootPart,
				[2] = workspace.Rake.Humanoid,
				[3] = 999999,
				[4] = "AAKKAKKAAKKA112121",
				[5] = "ALALALAQAQAQ1+!'SA",
				[6] = "TESTMQMQOQZP11A"
			}

			game:GetService("ReplicatedStorage").TaserRE.DamageRE:FireServer(unpack(args))

		  end)
  	end    
})
Tab3:AddToggle({
	Name = "Rake Godmode",
	Default = false,
	Flag = "rake_godmode"
})
OrionLib:Init()
while task.wait() do
	pcall(function() rake_health:Set("Rake Health:" ..game.Workspace.Rake:FindFirstChildOfClass("Humanoid").Health.."/"..game.Workspace.Rake:FindFirstChildOfClass("Humanoid").MaxHealth) end)
	if OrionLib.Flags["infcash"].Value == true then
		pcall(function()
			local leaderstats : NumberValue = plr.leaderstats.Points
			leaderstats.Value = 999999999999
		end)
	end
	if OrionLib.Flags["noac"].Value == true then
		pcall(function()
			local mainloader : LocalScript = plr.Character.MainLoader
			local antiexploit : Script = plr.Character.ANTIEXPLOIT

			mainloader:Destroy()
			antiexploit:Destroy()
		end)
	end
	if OrionLib.Flags["infrun"].Value == true then
		pcall(function()
			local stamina : NumberValue = plr.Character.StaminaValues.Stamina
			stamina.Value = 200
		end)
	end
	if OrionLib.Flags["alwaysrun"].Value == true then
		pcall(function()
			local run : BoolValue = plr.Character.StaminaValues.CanRun
			run.Value = true
		end)
	end
	if OrionLib.Flags["jumppower"].Value > 0 then
		pcall(function()
			if OrionLib.Flags["noac"].Value == false then
				OrionLib:MakeNotification({
					Name = "WARNING",
					Content = "Please enable Anticheat Bypasser!",
					Image = "rbxassetid://4483345998",
					Time = 2
				})
				return
			end
			plr.Character:FindFirstChildOfClass("Humanoid").JumpPower = OrionLib.Flags["jumppower"].Value
		end)
	end
	if OrionLib.Flags["walkspeed"].Value > 0 then
		pcall(function()
			if OrionLib.Flags["noac"].Value == false then
				OrionLib:MakeNotification({
					Name = "WARNING",
					Content = "Please enable Anticheat Bypasser!",
					Image = "rbxassetid://4483345998",
					Time = 2
				})
				return
			end

			local walkspeed : NumberValue = plr.Character.StaminaValues.WalkSpeed
			local runspeed : NumberValue = plr.Character.StaminaValues.RunSpeed
			walkspeed.Value = OrionLib.Flags["walkspeed"].Value
			runspeed.Value = OrionLib.Flags["walkspeed"].Value
		end)
	end
	if OrionLib.Flags["rake_godmode"].Value == true then
		pcall(function()
			local args2 = {
				[1] = workspace.Rake.Humanoid,
				[2] = 99999999999,
				[3] = workspace.Rake.AI.Stuns,
				[4] = -100000,
				[5] = "AAKKAKKAAKKA112121",
				[6] = "ALALALAQAQAQ1+!'SA",
				[7] = "TESTMQMQOQZP11A"
			}
		
			game:GetService("ReplicatedStorage").RocketRE.StunRE:FireServer(unpack(args2))
		end)
	end
end
