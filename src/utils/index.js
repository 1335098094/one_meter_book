import config from '../config'
function formatNumber (n) {
  const str = n.toString()
  return str[1] ? str : `0${str}`
}

export function formatTime (date) {
  const year = date.getFullYear()
  const month = date.getMonth() + 1
  const day = date.getDate()

  const hour = date.getHours()
  const minute = date.getMinutes()
  const second = date.getSeconds()

  const t1 = [year, month, day].map(formatNumber).join('/')
  const t2 = [hour, minute, second].map(formatNumber).join(':')

  return `${t1} ${t2}`
}

// 请求工具类
export function get (url, data) {
  return request(url, 'GET', data)
}
export function post (url, data) {
  return request(url, 'POST', data)
}
export function request (url, method, data) {
  return new Promise((resolve, reject) => {
    wx.request({
      url: `${config.host}${url}`, // 仅为示例，并非真实的接口地址
      data,
      method,
      header: {
        'content-type': 'application/json' // 默认值
      },
      success: function (res) {
        if (res.data.code === 0) {
          resolve(res.data.data)
        } else {
          reject(res.data)
        }
      }
    })
  })
}
// 提示工具类
export function showSuccess (text) {
  wx.showToast({
    title: text,
    icon: 'success',
    duration: 2000
  })
}
// 提示model
export function showModels (title, content) {
  wx.showModal({
    title: title,
    content: content,
    showCancel: false
  })
}
export default {
  formatNumber,
  formatTime,
  get,
  post,
  showSuccess,
  showModels
}
