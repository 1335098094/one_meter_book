const https = require('https')
const { mysql } = require('../qcloud')

// 新增图书
module.exports = async ctx => {
    const {isbn, openid} = ctx.request.body // 获取post发送过来的信息
    if (isbn && openid) {
        // 首先查询是否已存在此书
        const findRes = await mysql('books').select().where('isbn', isbn)
        if (findRes.length >= 1) {
            ctx.state = {
                code: 0,
                data: {
                    msg: '图书已存在'
                }
            }
            return
        }
        // 在没有图书的情况添加
        let url = `https://api.douban.com/v2/book/isbn/${isbn}` // 到豆瓣的api获取相应的信息
        const bookinfo = await getJSON(url)
        const rate = bookinfo.rating.average
        const { title, image, alt, publisher, summary, price } = bookinfo
        const tags = bookinfo.tags.map((item, index) => {
            return `${item.title}${item.count}`
        }).join(',')
        const author = bookinfo.author.join(',')
        try {
            await mysql('books').insert({
                isbn, openid, rate, title, image, alt, publisher, summary, price, tags, author
            })
            ctx.state = {
                code: 0,
                data: {
                    title,
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
}
function getJSON (url) { // 封装https请求
    return new Promise((resolve, reject) => {
        let urlData = ''
        https.get(url, res => {
            res.on('data', data => {
                urlData += data
            })
            res.on('end', data => {
                const bookinfo = JSON.parse(urlData)
                if (bookinfo.title) {
                    resolve(bookinfo)
                }
                reject(bookinfo)
            })
            res.on('error', err => {
                reject(err)
            })
        })
    })
}
