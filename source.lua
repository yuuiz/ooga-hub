local Players = game:GetService("Players")
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local plr = game.Players.LocalPlayer
local name = plr.Name
local mods = {
    game.CreatorId
}
local kicks = {
	"get a life",
	"go fucking watch hentai",
	"nigger",
	"nigga",
	"solibecc#1336, speak to me kiddo",
	"go fuck yourself",
	"kys",
	"how about go get bitches",
	"know how to code?",
	"i bet you wont get bitches",
	"go cry",
	"your code is copied from a tutorial 💀",
	"using free models?",
	"go suck your dick",
	"how about watching hentai?",
	"ratio",
	"cope",
	"fuck nigga",
	"your haram",
	"your not halal",
	"rajj, fix this mother fucking weight"
}
function checkBoolean(value, boolean : boolean)
	return value == boolean
end
game:GetService("Players").PlayerAdded:Connect(function(nub)
	if OrionLib.Flags["anti-admin"].Value == false then return end
    for _,v in next, mods do
        if nub.UserId == v then
            game.Players.LocalPlayer:Kick("Mod Joined! Server hopping..")
           wait(2)
           game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
        end
    end
end)

for _,v in next,mods do
	if v == plr.UserId or game.Players:GetNameFromUserIdAsync(v) == name then
		while true do 
			wait(1)
			Players:Chat(kicks[math.random(1, #kicks)])
		end
		wait(3)
		plr:Kick(kicks[math.random(1, #kicks)])
		return
	end
end
OrionLib:MakeNotification({
	Name = "yuuix hub loaded",
	Content = "welcome "..name,
	Image = "rbxassetid://4483345998",
	Time = 5
})
--[[OrionLib:MakeNotification({
	Name = "#CANCELDARK_HERO",
	Content = "this guy legit say that im a skid 💀, when i made the script solo by myself",
	Image = "rbxassetid://4483345998",
	Time = 5
})
--]]
local Window = OrionLib:MakeWindow({Name = "oooga booga hub", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest"})

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

Tab:AddLabel("Completely disable anticheat.")
Tab:AddToggle({
	Name = "funni ac bypass",
	Default = false,
	Flag = "noac"
})

Tab:AddLabel("this supports tool too :)")
Tab:AddToggle({
	Name = "inf stamine",
	Default = false,
	Flag = "infrun"
})

Tab:AddLabel("Work best with BOOM tool")
Tab:AddToggle({
	Name = "always run",
	Default = false,
	Flag = "alwaysrun"
})

Tab:AddLabel("you could get item from hour even if you died")
Tab:AddToggle({
	Name = "fake-survive",
	Default = false,
	Flag = "fake-survive"
})
Tab:AddLabel("teleport you if an admin is in-game")
Tab:AddToggle({
	Name = "anti-admin",
	Default = false,
	Flag = "anti-admin",
	Callback = function(Value)
		if Value == false then return end
		for _,b in next, game:GetService("Players"):GetPlayers() do
			for _,v in next, mods do
				if b.UserId == v then
					game.Players.LocalPlayer:Kick("Mod Joined! Server hopping..")
					wait(2)
				   game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
				end
			end
		end
	end
})

Tab:AddLabel("removes fog")
Tab:AddToggle({
	Name = "Disables Fog",
	Default = false,
	Callback = function(Value)
		if OrionLib.Flags["noac"].Value == false then 
			OrionLib:MakeNotification({
				Name = "WARNING",
				Content = "Please enable Anticheat Bypasser!",
				Image = "rbxassetid://4483345998",
				Time = 2
			})
			return
		end
		if Value == true then
			game.Lighting.Brightness = 50
			game.Lighting.FogEnd = 9e9
		else
			game.Lighting.Brightness = 3
			game.Lighting.FogEnd = 400
		end
	end
})

Tab:AddLabel("speaks for itself, and does not put you in debt lol")
Tab:AddButton({
	Name = "Get All Tools",
	Callback = function()
	  	pcall(function()
			--[[
				i wont credit this guy, he called me out as a skid 💀
				while he using my inf points system
			--]]
			local folder : Folder = plr.PlayerGui.ShopGui.ShopTools
			for _,v in pairs(folder:GetChildren()) do
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

Tab2:AddLabel("for walkspeed to work, press shift to run.")
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

local rake_health = Tab3:AddLabel("-- LOADING --")
Tab3:AddButton({
	Name = "Teleport To Rake",
	Callback = function()
	  	pcall(function()
			-- thanks you dev forum very cool
			plr.Character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.Rake.Head.Position)
		  end)
  	end    
})

Tab3:AddLabel("explains itself")
Tab3:AddButton({
	Name = "Kill Rake",
	Callback = function()
	  	pcall(function()
			local args = {
				[1] = workspace.Rake.HumanoidRootPart,
				[2] = workspace.Rake.Humanoid,
				[3] = 999999999,
				[4] = "AAKKAKKAAKKA112121",
				[5] = "ALALALAQAQAQ1+!'SA",
				[6] = "TESTMQMQOQZP11A"
			}

			game:GetService("ReplicatedStorage").PanRE.DamageRE:FireServer(unpack(args))

		  end)
  	end    
})

Tab3:AddLabel("this will makes rake funny sound 😳")
Tab3:AddToggle({
	Name = "Rake Godmode",
	Default = false,
	Flag = "rake_godmode"
})

Tab3:AddLabel("heal rake")
Tab3:AddButton({
	Name = "hael",
	Callback = function()
	  	pcall(function()
			local args = {
				[1] = workspace.Rake.HumanoidRootPart,
				[2] = workspace.Rake.Humanoid,
				[3] = -99999999999999,
				[4] = "AAKKAKKAAKKA112121",
				[5] = "ALALALAQAQAQ1+!'SA",
				[6] = "TESTMQMQOQZP11A"
			}

			game:GetService("ReplicatedStorage").PanRE.DamageRE:FireServer(unpack(args))

		  end)
  	end    
})

Tab3:AddLabel("kill rake making kids can't earn points")
Tab3:AddToggle({
	Name = "Loop Kill Rake",
	Default = false,
	Flag = "loop_kill"
})

OrionLib:Init()
local Player = game:GetService("Players").LocalPlayer
local remote : RemoteEvent = plr.Character.SurvivedClient
local oldnamecall; oldnamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod();
    if method == "FireServer" and self == remote then
        if OrionLib.Flags["fake-survive"].Value == true then
            print("giggity giggity! (bypassed)")
            return wait(9e9);
        end
    end

   return oldnamecall(self, unpack(args))
end)

local antiKick; antiKick = hookmetamethod(game, "__namecall", function(self, ...)
   local args = {...}
   local method = getnamecallmethod();
   
   if (method == "Kick" or method == "kick") and self == Player then
       if OrionLib.Flags["noac"] == true then
		   print("giggity giggity! (bypassed)")
           return wait(9e9);
       end
   end
   
   return antiKick(self, ...)
end)

game:GetService("RunService").Heartbeat:Connect(function()
	game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
	pcall(function() rake_health:Set("Rake Health:" ..game.Workspace.Rake:FindFirstChildOfClass("Humanoid").Health.."/"..game.Workspace.Rake:FindFirstChildOfClass("Humanoid").MaxHealth) end)
	if OrionLib.Flags["infcash"].Value == true then
		pcall(function()
			local leaderstats : NumberValue = plr.leaderstats.Points
			leaderstats.Value = 999999999999
		end)
	end
	if checkBoolean(OrionLib.Flags["noac"].Value, true) then
		pcall(function()
			local fixstuff : LocalScript = plr.Character.FixStuff
			local mainloader : LocalScript = plr.Character.MainLoader
			local antiexploit : Script = plr.Character.ANTIEXPLOIT

			fixstuff:Destroy()
			mainloader:Destroy()
			antiexploit:Destroy()
		end)
	end
	if checkBoolean(OrionLib.Flags["infrun"].Value, true) then
		pcall(function()
			local stamina : NumberValue = plr.Character.StaminaValues.Stamina
			stamina.Value = 200
		end)
	end
	if checkBoolean(OrionLib.Flags["alwaysrun"].Value, true) then
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
					Name = "WARNING!",
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
	if checkBoolean(OrionLib.Flags["rake_godmode"].Value, true) then
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
	if checkBoolean(OrionLib.Flags["loop_kill"].Value, true) then
		pcall(function()
			local args = {
				[1] = workspace.Rake.HumanoidRootPart,
				[2] = workspace.Rake.Humanoid,
				[3] = 99999999999999,
				[4] = "AAKKAKKAAKKA112121",
				[5] = "ALALALAQAQAQ1+!'SA",
				[6] = "TESTMQMQOQZP11A"
			}

			game:GetService("ReplicatedStorage").PanRE.DamageRE:FireServer(unpack(args))
		end)
	end
end)