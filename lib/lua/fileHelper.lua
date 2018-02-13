require("patterns")
tableHelper = require("tableHelper")

local fileHelper = {}

-- Avoid using the following filenames because of their reserved status on operating systems
fileHelper.invalidFilenames = { "CON", "PRN", "AUX", "NUL", "COM1", "COM2", "COM3", "COM4", "COM5",
    "COM6", "COM7", "COM8", "COM9", "LPT1", "LPT2", "LPT3", "LPT4", "LPT5", "LPT6", "LPT7",
    "LPT8", "LPT9" }

-- Swap keys with their values in a table, allowing for the easy creation of tables similar to enums
function fileHelper.fixFilename(filename)
    
    -- Replace characters not allowed in filenames
    filename = string.gsub(filename, ":", ";")
    filename = string.gsub(filename, patterns.invalidFileCharacters, "_")

    -- If the filename itself is invalid, add an underline at the start
    if tableHelper.containsValue(fileHelper.invalidFilenames, filename) then
        filename = "_" .. filename
    end

    return filename
end

return fileHelper