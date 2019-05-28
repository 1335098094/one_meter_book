<template>
  <a :href="detailUrl">
    <div class="book-card">
      <div class="thumb" @click.stop="preview">
        <img :src="book.image" 
              class="img"
              mode="aspectFit"
              />
      </div>
      <div class="detail">
        <div class="row text-primary">
          <div class="right rate">
            {{book.rate}} <rate :rate='book.rate'></rate>
          </div>
          <div class="left title">
            {{book.title}}
          </div>
        </div>
        <div class="row">
          <div class="right text-primary">
            浏览量: {{book.count}}
          </div>
          <div class="left">
            {{book.author}}
          </div>
        </div>
        <div class="row">
          <div class="right">
            <span v-if="type!=='my'">{{book.user_info.nickName}}</span>
            <button class="delete" v-if="type==='my'" @click.stop="deletes()">删除</button>
          </div>
          <div class="left">
          {{book.publisher}}
          </div>
        </div>
      </div>
    </div>
  </a>
</template>

<script>
import Rate from './rate'
import { post } from '@/utils'
export default {
  components: {
    Rate
  },
  methods: {
    preview () {
      wx.previewImage({
        current: this.book.image, // 当前显示图片的http链接
        urls: [this.book.image] // 需要预览的图片http链接列表
      })
    },
    async deletes () {
      const data = await post(`/weapp/deletebook?bookid=${this.book.id}`)
      if (data.data === 'success') {
        wx.showToast({
          title: '删除成功',
          icon: 'success',
          duration: 2000
        })
      }
      this.$emit('deletef')
    }
  },
  computed: {
    detailUrl () {
      return `/pages/detail/main?id=${this.book.id}`
    }
  },
  props: ['book', 'type']
}
</script>

<style lang='less'>
.book-card{
  padding:5px;
  overflow: hidden;
  margin-top:5px;
  margin-bottom:5px;
  font-size:14px;
  .thumb{
    width:90px;
    height:90px;
    float: left;
    margin:0 auto;
    overflow:hidden;
    .img{
      max-width: 100%;
      max-height: 100%;
    }
  }
  .detail{
    margin-left: 100px;
    .row{
      line-height:20px;
      margin-bottom:3px;
    }
    .right{
      float: right; 
      .delete{
        font-size:11px;
        background: #EA5149;
        color: #fff;
        padding:0px 16px;
      }
    }
    .left{
      margin-right:80px;
    }
    .title, .rate{
      color:#EA5149
    }
  }
}
</style>
