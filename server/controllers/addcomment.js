const { mysql } = require('../qcloud')
module.exports = async ctx => {
    const {bookid, phoneType, address, text, openid} = ctx.request.body // 获取post发送过来的信息
    try {
        await mysql('comments').insert({ // 塞入数据
            bookid, openid, phone: phoneType, location: address, comment: text
        })
        ctx.state = {
            code: 0,
            data: {
                msg: 'success'
            }
        }
    } catch (e) {
        ctx.state = {
            code: -1,
            data: {
                msg: `新增失败${e.sqlMessage}`
            }
        }
    }
}
