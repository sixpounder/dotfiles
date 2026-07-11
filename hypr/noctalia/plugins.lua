local function has_plugin(name)
    local cmd = "noctalia msg plugins list"
    -- execute it and capture the whole output
    local handle = io.popen(cmd)          -- open a pipe
    if handle ~= nil then
        local output = handle:read("*a")      -- read all data
        handle:close()                        -- close the pipe
        return output:find(name, 1, true)
    else
        return false
    end

    
end

return {
    has_plugin = has_plugin
}