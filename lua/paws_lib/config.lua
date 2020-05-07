local MODULE = PAW_MODULE('lib')

MODULE.Config = {
    Colors = {
        Base = Color(40, 40, 40),
        Button = Color(51, 51, 51),
        ButtonHover = Color(59, 137, 255),
    },
    Chat = {
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
    Commands = {
        Prefixes = {
            '!',
            '/'
        }
    }
}