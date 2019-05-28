<template>
    <div class="comments" v-if="comments.length>0">
      <h4 v-if="!type">评论列表</h4>
      <div class="list" v-for="item in comments" :key="item.id" :class=" type==='list' ? 'box' : '' "  @click="toBook( item.bookid )">
          <div class="top">
            <div class="avatar">
              <image :src="item.user_info.avatar" mode="widthFix" />
              {{item.user_info.nickName}}
            </div>
            <div class="time">
              {{item.createtime}}
            </div>
          </div>
          <div class="center">{{item.comment}}</div>
          <div class="footer">
              <span>{{item.phone}}</span>
              <span>{{item.location}}</span>
          </div>
      </div>
    </div>
</template>
<script>
export default {
  name: 'comments',
  data () {
    return {
      types: ''
    }
  },
  props: {
    comments: {
      type: Array,
      default: []
    },
    type: {
      type: String
    }
  },
  methods: {
    toBook (bookid) { // 跳转
      if (this.type === 'list') {
        wx.navigateTo({
          url: `/pages/detail/main?id=${bookid}`
        })
      }
    }
  }
}
</script>
<style lang="less">
.comments {
  width: 100%;
  margin: 10px auto 0px auto;
  h4{
      margin: 26px 0px 20px 20px;
      font-weight: bold;
      color:#EA5A49
    }
  .box{
      box-shadow: 0px 4px 10px rgba(234,90,73,0.3)
  }
  .list{
    display:100%;
    flex-direction:column;
    margin:auto;
    margin-bottom:14px;
    padding:7px 20px;
    box-sizing:border-box;
    .top{
      display: flex;
      justify-content:space-between;
      font-size: 14px;
      flex-direction: row;
      .avatar{
        flex: 0 0 50%;
        image{
          width: 20px;
          border-radius: 100%;
          vertical-align: middle
        }
      }
      .time{
        color: rgb(145, 144, 144);
        font-size: 13px
      }
    }
    .center{
      font-size: 16px;
      margin: 10px 0px 10px 20px;
    }
    .footer{
      display: flex;
      justify-content:space-between;
      font-size: 14px;
      flex-direction: row;
      color: rgb(145, 144, 144);
      margin-left: 20px
    }
  }
}
</style>


