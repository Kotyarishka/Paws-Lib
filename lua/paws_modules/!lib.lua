local MODULE = PAW_MODULE('lib')
    :SetTitle('Lib')
    :SetAuthor('Kot')
    :SetVersion('Dev Branch')
    :SetRoot('paws_lib')
    :SetConfig('config.lua')
    :SetFileSystem({
        'chat',
        'commands',
        'download'
    })
    :SetNets({
        'Paws.Lib.Msg'
    })

return MODULE 