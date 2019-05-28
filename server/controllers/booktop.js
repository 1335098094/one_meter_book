const { mysql } = require('../qcloud')
module.exports = async ctx => {
    try {
        const booktop = await mysql('books')
                            .select('*')
                            .limit(9)
                            .orderBy('count', 'desc')
        ctx.state = {
            code: 0,
            data: {
                booktop
            }
        }
    } catch (e) {
        ctx.state = {
            code: -1,
            data: {
                e
            }
        }
        console.log(e)
    }
}
