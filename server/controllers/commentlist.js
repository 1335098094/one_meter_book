const { mysql } = require('../qcloud')
module.exports = async ctx => {
    const {bookid, openid} = ctx.request.query // 获取post发送过来的信息
    let commentlist = ''
    if (bookid) {
        commentlist = await mysql('comments')
                            .select('comments.*', 'csessioninfo.user_info')
                            .join('cSessionInfo', 'csessioninfo.open_id', 'comments.openid')
                            .where('bookid', bookid)
    }
    if (openid) {
        commentlist = await mysql('comments')
                            .select('comments.*', 'csessioninfo.user_info')
                            .join('cSessionInfo', 'csessioninfo.open_id', 'comments.openid')
                            .where('openid', openid)
    }
    ctx.state = {
        code: 0,
        data: {
            commentlist: commentlist.map(item => {
                let info = JSON.parse(item.user_info)
                return Object.assign({}, item, {
                    user_info: {
                        nickName: info.nickName,
                        avatar: info.avatarUrl
                    }
                })
            })
        }
    }
}
