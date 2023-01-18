local plr = game.Players.LocalPlayer
if not plr.Character then
    plr.CharacterAdded:Wait()
end
local function DamageRake(damage : number)
    pcall(function()
        local args = {
            [1] = workspace.Rake.HumanoidRootPart,
            [2] = workspace.Rake.Humanoid,
            [3] = damage,
            [4] = "AAKKAKKAAKKA112121",
            [5] = "ALALALAQAQAQ1+!'SA",
            [6] = "TESTMQMQOQZP11A"
        }
    
        game:GetService("ReplicatedStorage").PanRE.DamageRE:FireServer(unpack(args))
    end)
end
local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local Window = Library:CreateWindow({
    Title = 'yuuix [BETA]',
    Center = true, 
    AutoShow = true,
})
local Main = Window:AddTab('Main')
TabBox = Main:AddLeftGroupbox('OP')
TabBox:AddToggle('noac', {
    Text = "anticheat bypass",
    Default = true,
    Tooltip = 'This will bypasses the game anticheat which is shit',
})
TabBox:AddToggle('infrun', {
    Text = 'inf stamina',
    Default = false,
    Tooltip = "Self-Explaintory, btw this supports tools too!",
})
TabBox:AddToggle('alwayrun', {
    Text = 'always run',
    Default = false,
    Tooltip = "Self-Explaintory, prevent BOOM making you can't run",
})
TabBox:AddToggle('loopkill', {
    Text = 'Loop kill rake',
    Default = false,
    Tooltip = "This will make rake ded forever and dont grant points so kid will be mad",
})
TabBox:AddButton('get tools', function()
    pcall(function()
        local folder : Folder = plr.PlayerGui.ShopGui.ShopTools
		for _,v in pairs(folder:GetChildren()) do
			local args = {
				[1] = v
			}
				
			game:GetService("ReplicatedStorage").ShopEvents.Buy:FireServer(unpack(args))
		end
	end)
end)
TabBox:AddButton('Unload', function() Library:Unload() end)
TabBox2 = Main:AddRightGroupbox('Player')
TabBox2:AddToggle('speed', {
    Text = 'Toggle speed',
    Default = false,
    Tooltip = "Master switch for walkspeed,runspeed,jumppower",
})

TabBox2:AddInput('walkspeed', {
    Default = '10',
    Numeric = true, 
    Finished = true, 

    Text = 'Walkspeed',
    Tooltip = 'you go zoom', 

    Placeholder = 'Type a number here!',
})
Options.walkspeed:OnChanged(function()
    if plr.Character and Toggles.speed.Value == true then
        local walkspeed : NumberValue = plr.Character.StaminaValues.WalkSpeed
        --local runspeed : NumberValue = plr.Character.StaminaValues.RunSpeed
        walkspeed.Value = Options.walkspeed.Value
        --runspeed.Value = Options.walkspeed.Value
    end
end)
TabBox2:AddInput('runspeed', {
    Default = '35',
    Numeric = true,
    Finished = true,

    Text = 'Runspeed',
    Tooltip = 'you go zoom',

    Placeholder = 'Type a number here!',
})
Options.runspeed:OnChanged(function()
    if plr.Character and Toggles.speed.Value = true then
        --local walkspeed : NumberValue = plr.Character.StaminaValues.WalkSpeed
        local runspeed : NumberValue = plr.Character.StaminaValues.RunSpeed
        --walkspeed.Value = Options.walkspeed.Value
        runspeed.Value = Options.walkspeed.Value
    end
end)
TabBox2:AddInput('jumppower', {
    Default = '0',
    Numeric = true, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter

    Text = 'Jumppower',
    Tooltip = 'you go weee', -- Information shown when you hover over the textbox

    Placeholder = 'Type a number here!', -- placeholder text when the box is empty
})
Options.jumppower:OnChanged(function()
    if plr.Character:FindFirstChildOfClass("Humanoid")  and Toggles.speed.Value == true then
        if Options.jumppower.Value == 0 then
            plr.Character:FindFirstChildOfClass("Humanoid").JumpPower = 50
        end
        plr.Character:FindFirstChildOfClass("Humanoid").JumpPower = Options.jumppower.Value
    end
end)
local antiKick; antiKick = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod();
    
    if (method == "Kick" or method == "kick") and self == plr then
        if Toggles.noac.Value == true then
            print("anti kick disabler best")
            return wait(9e9);
        end
    end
    
    return antiKick(self, unpack(args))
 end)
Library:OnUnload(function()
    Library.Unloaded = true
end)
while task.wait() do
    if Library.Unloaded == true then
        break
    end
    game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
    if Toggles.noac.Value == true then
        if plr.Character and plr.Character:FindFirstChild('ANTIEXPLOIT') then
            local antiexploit = plr.Character:FindFirstChild('ANTIEXPLOIT')

            if antiexploit then
				antiexploit:Destroy()
			end
        end
    end
    if Toggles.infrun.Value == true then
        if plr.Character and plr.Character:FindFirstChild('StaminaValues') and plr.Character.StaminaValues:FindFirstChild('Stamina') then
			plr.Character.StaminaValues.Stamina.Value = 200
		end
    end
    if Toggles.alwayrun.Value == true then
        if plr.Character and plr.Character:FindFirstChild('StaminaValues') and plr.Character:FindFirstChild('CanRun') then
			plr.Character.StaminaValues.CanRun.Value = true
		end
    end
end
