const { mysql } = require('../qcloud')

module.exports = async ctx => {
  const { bookid } = ctx.request.query // 获取post发送过来的信息
  console.log(bookid)
  if (bookid) {
    try {
      const delbook = await mysql('books') // 找出对应书
                        .where('id', bookid)
                        .del()
      const delcomment = await mysql('comments') // 找出对应书
                        .where('bookid', bookid)
                        .del()
      ctx.state = {
        code: 0,
        data: {
          data:"success"
        }
      }
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