local MODULE = PAW_MODULE('lib')

MODULE.Config = {
    Colors = {
        Text = Color(255, 255, 255),
        Base = Color(40, 40, 40),
        BaseDarker = Color(61, 61, 61),
        Button = Color(51, 51, 51),
        ButtonHover = Color(255, 185, 56), 
        CloseHover = Color(255, 89, 89),

        Green = Color(90, 200, 90),
        Red = Color(255, 69, 69) 
    },
    Chat = {
        NONE_COLOR = Color(255, 255, 255),

        PREFIX = '[Paws]',
        PREFIX_COLOR = Color(255, 195, 56),

        SUCCESS_MSG = 'Успешно!',
        SUCCESS_COLOR = Color(83, 199, 0),

        WARNING_MSG = 'Внимание!',
        WARNING_COLOR = Color(255, 129, 56),

        ERROR_MSG = 'Ошибка!',
        ERROR_COLOR = Color(255, 69, 56),

        MESSAGES_TYPE = {
            NONE = 0,
            SUCCESS = 1,
            WARNING = 2, 
            ERROR = 3,
            RP = 4
        }
    },
    Fonts = {
        MainFont = 'Open Sans'
    },
    Commands = {
        Prefixes = {
            '!',
            '/'
        }
    },
    CustomProperties = true
}