<template>
    <div> 
      <div class="container">
        <div class="userinfo" @click="doLogin">
            <img :src="userinfo.avatarUrl" alt="">
            <p>{{userinfo.nickName}}</p>
        </div>
        <year-progress></year-progress>
        <div class="btns-group">
          <div class="btns" @click="scanBook" v-if="userinfo.openId">添加图书</div>
          <div class="btns" @click="myBook" v-if="userinfo.openId">我的图书</div>
        </div>
      </div>
    </div>
</template>

<script>
import qcloud from 'wafer2-client-sdk'
import config from '@/config'
import { showSuccess, post, showModels } from '@/utils'
import YearProgress from '@/components/YearProgress'
export default {
  name: 'me',
  components: {
    YearProgress
  },
  data () {
    return {
      userinfo: {
        avatarUrl: '../../static/img/unlogin.png',
        nickName: '点击登录'
      }
    }
  },
  onShow () {
    if (wx.getStorageSync('userInfo')) {
      this.userinfo = wx.getStorageSync('userInfo')
    }
  },
  methods: {
    myBook () {
      wx.navigateTo({
        url: `/pages/mybook/main?openid=${this.userinfo.openId}`
      })
    },
    scanBook () { // 扫码
      wx.scanCode({
        success: res => {
          if (res.result) {
            this.addBook(res.result)
          }
        }
      })
    },
    async addBook (isbn) {
      const res = await post('/weapp/addbook', {
        isbn,
        openid: this.userinfo.openId
      })
      if (res.title) {
        showModels('提示', `“${res.title}”添加成功`)
      } else if (res.msg === '图书已存在') {
        showModels('提示', `图书已存在`)
      }
    },
    doLogin () {
      qcloud.setLoginUrl(config.loginUrl)
      const session = qcloud.Session.get()
      if (session) {
        // 第二次登录
        // 或者本地已经有登录态
        // 可使用本函数更新登录态
        qcloud.loginWithCode({
          success: res => {
            console.log(res)
            this.userinfo = res
            try {
              wx.setStorageSync('userInfo', res)
            } catch (e) {
            }
            showSuccess('登录成功')
            // this.setData({ userInfo: res, logged: true })
          },
          fail: err => {
            console.error(err)
          }
        })
      } else {
        // 首次登录
        qcloud.login({
          success: res => {
            this.userinfo = res
            try {
              wx.setStorageSync('userInfo', res)
            } catch (e) {
            }
            console.log(res)
            // this.setData({ userInfo: res, logged: true })
          },
          fail: err => {
            console.error(err)
          }
        })
      }
    }
  }
}
</script>

<style lang="less">
.container{
  padding: 0 30rpx;
  .userinfo{
    margin-top: 100rpx;
    text-align: center;
    img{
      margin: 20rpx;
      width: 150rpx;
      height: 150rpx;
      border-radius: 50%;
    }
  }
  .btns-group{
    margin-top: 60px;
    width: 100%
  }
  .btns{
    margin-top:60rpx;
    text-align: center;
    color: #fff;
    background: #EA5149;
    width: 100%;
    padding: 16rpx;
    font-size: 28rpx;
    box-sizing:border-box;
  }
  .btns:active{
    background: #fA5149;
  }
}



</style>
