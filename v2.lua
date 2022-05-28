local plr = game.Players.LocalPlayer
if plr.Name ~= "DanaSims61" then
	plr:Kick("We highly suggest you to use v1 since this is buggy.")
end
if not plr.Character then
    plr.CharacterAdded:Wait()
end
local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()

local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'yuuix [BETA]',
    Center = true, 
    AutoShow = true,
})
local Main = Window:AddTab('Main')
TabBox = Main:AddLeftGroupbox('OP')

TabBox:AddToggle('infcash', {
    Text = 'inf points',
    Default = false, -- Default value (true / false)
    Tooltip = 'Self-Explaintory but it will not be visible to anyone but you!', -- Information shown when you hover over the toggle
})
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
TabBox:AddToggle('fakesurvive', {
    Text = 'Fake-Survive',
    Default = false,
    Tooltip = "This will make the server thinks your still alive, and you will still get items and point from hour even if you died.",
})
TabBox:AddToggle('loopkill', {
    Text = 'Loop kill rake',
    Default = false,
    Tooltip = "This will make rake ded forever and dont grant points so kid will be mad",
})
TabBox:AddButton('kill rake', function()
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
end)
TabBox2 = Main:AddRightGroupbox('Player')
TabBox2:AddInput('walkspeed', {
    Default = '0',
    Numeric = true, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter

    Text = 'Walkspeed',
    Tooltip = 'you go zoom', -- Information shown when you hover over the textbox

    Placeholder = 'Type a number here!', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})
Options.walkspeed:OnChanged(function()
    if plr.Character then
        if Options.walkspeed.Value == 0 then
            local walkspeed : NumberValue = plr.Character.StaminaValues.WalkSpeed
            local runspeed : NumberValue = plr.Character.StaminaValues.RunSpeed
            walkspeed.Value = 10
            runspeed.Value = 35
        else
            local walkspeed : NumberValue = plr.Character.StaminaValues.WalkSpeed
            local runspeed : NumberValue = plr.Character.StaminaValues.RunSpeed
            walkspeed.Value = Options.walkspeed.Value
            runspeed.Value = Options.walkspeed.Value
        end
    end
end)
TabBox2:AddInput('jumppower', {
    Default = '0',
    Numeric = true, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter

    Text = 'Jumppower',
    Tooltip = 'you go weee', -- Information shown when you hover over the textbox

    Placeholder = 'Type a number here!', -- placeholder text when the box is empty
    -- Max
    --Length is also an option which is the max length of the text
})
Options.jumppower:OnChanged(function()
    if plr.Character:FindFirstChildOfClass("Humanoid") then
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
            return wait(9e9);
        end
    end
    
    return antiKick(self, unpack(args))
 end)
while task.wait() do
    if Library.Unloaded == true then
        break
    end
    game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
    if Toggles.infcash.Value == true then
        plr.leaderstats.Points.Value =  9e10
    end
    if Toggles.noac.Value == true then
        pcall(function()
            local fixstuff : LocalScript = plr.Character.FixStuff
            local mainloader : LocalScript = plr.Character.MainLoader
            local antiexploit : Script = plr.Character.ANTIEXPLOIT

            fixstuff:Destroy()
            mainloader:Destroy()
            antiexploit:Destroy()
        end)
    end
    if Toggles.infrun.Value == true then
        pcall(function()
            plr.Character.StaminaValues.Stamina.Value = 200
        end)
    end
    if Toggles.alwayrun.Value == true then
        plr.Character.StaminaValues.CanRun.Value = true
    end
    if Toggles.fakesurvive.Value == true then
        plr.Character.SurvivedClient.Disabled = true
    end
    if Toggles.loopkill.Value == true then
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
end