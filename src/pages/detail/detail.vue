<template>
  <div>
    <bookinfo :info="info"></bookinfo>
    <div class="comment">
         <h4>评论中心</h4>
         <div v-if="canComment">
            <textarea placeholder="请输入评语" v-model="text" maxlength="100"/>
            <p>手机型号：<switch @change="getPhone" :check="phoneType" color="#EA5A49"/>{{phoneType}}</p>
            <P>地理位置：<switch @change="getGeo" color="#EA5A49" :check="address"/>{{address}}</P>
            <button @click="send">提交</button>
         </div>
         <div class="hint" v-else>
            {{hintText}}
         </div>
    </div>
    <div></div>
    <comments :comments="comments"></comments>
  </div>
</template>
<script>
import { get, post, formatTime } from '@/utils'
import bookinfo from '@/components/bookinfo'
import comments from '@/components/comments'
import QQMapWX from '../../../static/js/qqmap-wx-jssdk.min.js'
export default {
  name: 'detail',
  data () {
    return {
      bookid: '',
      info: [],
      phoneType: '',
      address: '',
      text: '',
      openid: '',
      comments: [],
      hintText: ''
    }
  },
  components: {
    bookinfo,
    comments
  },
  mounted () {
    this.getDetail()
    this.getData()
    this.commentList()
  },
  computed: {
    canComment () {
      const that = this
      if (this.openid === '' || this.openid === null) {
        this.hintText = '小主，您还未登录哦！'
        return false
      }
      if (this.comments.filter(item => item.openid === that.openid).length) {
        this.hintText = '小主，您已经评论过咯！'
        return false
      }
      return true
    }
  },
  methods: {
    async getDetail () {
      const bookdetail = await get(`/weapp/bookdetail?id=${this.$root.$mp.query.id}`)
      this.info = bookdetail.book
      wx.setNavigationBarTitle({
        title: bookdetail.book.title
      })
    },
    async commentList () {
      const List = await get(`/weapp/commentlist?bookid=${this.$root.$mp.query.id}`)
      List.commentlist.map(item => {
        item.createtime = formatTime(new Date(item.createtime))
      })
      this.comments = List.commentlist
    },
    getData () {
      const that = this
      this.bookid = this.$root.$mp.query.id
      wx.getStorage({
        key: 'userInfo',
        success (res) {
          that.openid = res.data.openId
        }
      })
    },
    getPhone (e) {
      if (e.target.value) {
        try {
          const res = wx.getSystemInfoSync()
          console.log(res.model)
          this.phoneType = res.model
        } catch (e) {
        // Do something when catch error
        }
      } else {
        this.phoneType = ''
      }
    },
    getGeo (e) { // 获取城市
      const that = this
      let qqmapsdk = new QQMapWX({
        key: 'UXUBZ-TMYCX-WQU4F-ZGAB4-H77BV-PTFJS'
      })
      if (e.target.value) {
        wx.getLocation({
          type: 'wgs84',
          success (res) {
            const latitude = res.latitude
            const longitude = res.longitude
            qqmapsdk.reverseGeocoder({
              location: {
                latitude: latitude,
                longitude: longitude
              },
              success (res1) {
                that.address = res1.result.address_component.city
              }
            })
          }
        })
      } else {

      }
    },
    async send () { // 提交评论
      if (this.text === '') {
        wx.showToast({
          title: '评论内容不能为空',
          icon: 'none',
          duration: 2000
        })
        return false
      }
      let data = {
        bookid: this.bookid,
        phoneType: this.phoneType,
        address: this.address,
        text: this.text,
        openid: this.openid
      }
      try {
        await post(`/weapp/addcomment`, data)
        this.text = ''
        wx.showToast({
          title: '提交成功',
          icon: 'success',
          duration: 2000
        })
        this.commentList()
      } catch (e) {
        wx.showToast({
          title: '提交失败',
          icon: 'none',
          duration: 2000
        })
      }
    }
  }
}
</script>
<style lang="less">
  .comment{
    width: 90%;
    margin: auto;
    color:#EA5A49;
    h4{
      margin: 26px 0px 20px 0px;
      font-weight: bold;
      color:#EA5A49
    }
    .hint{
      color:#EA5A49;
      height: 60px;
      border:1px solid #EA5A49;
      line-height: 60px;
      text-align: center;
      font-size: 14px;
    }
    textarea{
      height:100px;
      width: 100%;
      margin: auto;
      border:1px solid #EA5A49;
      padding: 14px;
      box-sizing: border-box;
      font-size: 16px;
      color:#000;
    }
    p{
      margin: 10px 0px;
      color:#EA5A49;
      font-size: 16px;
    }
    button{
      background: #EA5A49;
      color:#fff;
      margin: 10px 0px;
      width: 100%
    }
  }
</style>


