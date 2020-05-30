# Creating module

Working through the module allows you to use a unique environment and avoid file system conflicts of different add-ons.

To create module you need:

1. Create folder "paws\_modules" inside lua folder of your addon.
2. Create unique lua file. E.x. "my\_module.lua"
3. Put module information inside your lua file.

```lua
local MODULE = PAW_MODULE('my_module') -- Module create
    :SetTitle('My Custom MODULE') -- Title of your module
    :SetAuthor('Your Name or Nick') -- Author of module
    :SetVersion('0.0.1') -- Version of your module
    :SetRoot('my_module_folder') -- Main folder of your module (where is your code)
    :SetConfig('config.lua') -- Config file of your module, loads after this file
    :SetFilesystem({ -- File system of your module, folders where your code
        'folder1',
        'folder2'
    })
    :SetNets({ -- Nets for module
        'NetName1',
        'NetName2'
    })
    
return MODULE -- return this module to loader
```

Information about structure of files you can find here:

{% page-ref page="../file-system.md" %}



