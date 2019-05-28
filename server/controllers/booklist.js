const { mysql } = require('../qcloud')

module.exports = async ctx => {
    let { page,openid } = ctx.request.query
    const size = 10
    const book = mysql('books')
        .select('books.*', 'csessioninfo.user_info')
        .join('cSessionInfo', 'csessioninfo.open_id', 'books.openid')
        .orderBy('books.id', 'desc')
    let booklist
    if (openid){
        booklist = await book.where("openid", openid)
    }else{
        booklist = await book.limit(size)
                             .offset(Number(page) * size)
    }
    ctx.state = {
        code: 0,
        data: {
            booklist: booklist.map(item => {
                let info = JSON.parse(item.user_info)
                return Object.assign({}, item, {
                    user_info: {
                        nickName: info.nickName
                    }
                })
            })
        }
    }
}
