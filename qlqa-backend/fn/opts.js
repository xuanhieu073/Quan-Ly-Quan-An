var opts = {
    GENERAL: {
        PRODUCTS_PER_PAGE: 6
    },

    ACCESS_TOKEN: {
        SECRET_KEY: 'secret',
        LIFETIME: 600 // in seconds
    },

    REFRESH_TOKEN: {
        SIZE: 80
    },

    DB: {
        HOST: '127.0.0.1',
        PORT: '3306',
        USER: 'root',
        PWD: '123456',
        DB_NAME: 'qlbh'
    }
}

module.exports = opts;