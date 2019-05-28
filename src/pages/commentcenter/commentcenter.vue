<template>
    <div class="comment-container">
      <comments :comments="comments" type="list"></comments>
    </div>
</template>

<script>
import { get, formatTime } from '@/utils'
import comments from '@/components/comments'
export default {
  name: 'commentcenter',
  data () {
    return {
      userinfo: '',
      comments: []
    }
  },
  components: {
    comments
  },
  onShow () {
    console.log(111111)
    if (!this.userinfo) {
      let userinfo = wx.getStorageSync('userInfo')
      if (userinfo) {
        this.userinfo = userinfo
        this.init()
      }
    }
  },
  methods: {
    init () {
      wx.showNavigationBarLoading()
      this.commentList()
      wx.hideNavigationBarLoading()
    },
    async commentList () {
      console.log(this.userinfo)
      const List = await get(`/weapp/commentlist?openid=${this.userinfo.openId}`)
      List.commentlist.map(item => {
        item.createtime = formatTime(new Date(item.createtime))
      })
      this.comments = List.commentlist
    }
  }
}
</script>

<style>

</style>

