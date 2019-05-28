const { mysql } = require('../qcloud')

module.exports = async ctx => {
    const {id} = ctx.request.query // 获取post发送过来的信息
    if (id) {
        try {
            const bookDetail = await mysql('books') // 找出对应书
                            .select('books.*', 'csessioninfo.user_info')
                            .join('cSessionInfo', 'csessioninfo.open_id', 'books.openid')
                            .where('id', id)
                            .first()
            let userinfo = JSON.parse(bookDetail.user_info)
            ctx.state = {
                code: 0,
                data: {
                    book: Object.assign({}, bookDetail, {
                        tags: bookDetail.tags.split(','),
                        summary: bookDetail.summary.split('\n'),
                        user_info: {
                            name: userinfo.nickName,
                            avatarUrl: userinfo.avatarUrl
                        }
                    })
                }
            }
            await mysql('books')   // 浏览数加一
                        .where('id', '=', id)
                        .increment('count', 1)
            // ctx.state = {
            //     code: 0,
            //     data: {
            //         addcount
            //     }
            // }
        } catch (e) {
            console.log(e)
            ctx.state = {
                code: -1,
                data: {
                    msg: `查询失败${e}`
                }
            }
        }
    }
}
