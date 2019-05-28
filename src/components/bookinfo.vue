<template>
  <div class="book-info">
    <div class="thumb">
      <img class="back" :src="info.image" mode="aspectFill">
      <img :src="info.image" mode="aspectFit" >
      <div class="info">
        <div class="title">
          {{info.title}}
        </div>
        <div class="author">
          {{info.author}}
        </div>
      </div>
    </div>
    <div class="detail">
      <img :src="userinfo.avatarUrl" mode="aspectFit" class="avatarUrl">
      {{userinfo.name}}
      <div class="right rate">
        <rate :rate="info.rate"></rate>{{info.rate}}分
      </div>
    </div>
    <div class="detail">
      {{info.publisher}}
      <div class="right">
        {{info.price}}
      </div>
    </div>
    <div class="tags">
      <div class="badge" v-for="(tag, index) in info.tags" :key="index">{{tag}}</div>
    </div>
    <div class="summary">
      <p v-for="(sum, i) in info.summary" :key="i">{{sum}}</p>
    </div>
  </div>
</template>

<script>
import Rate from './rate'
export default {
  props: {
    info: {
      type: JSON,
      default: {}
    }
  },
  components: {
    Rate
  },
  computed: {
    userinfo: {
      get () {
        return this.info.user_info || {}
      }
    }
  }
}
</script>

<style lang="less">
.book-info{
  .thumb{
    width: 750rpx;
    height: 500rpx;
    overflow: hidden;
    position: relative;
    .back{
      filter: blur(15px);
      width: 100%;
    }
    img:last-of-type{
      position: absolute;
      width: 100%;
      height: 300rpx;
      top: 30rpx;
      left: 0;
    }
    .info{
      color: #fff;
      position: absolute;
      top: 330rpx;
      left: 0;
      width: 100%;
      text-align: center;
      .title{
        font-size: 20px;
      }
      .author{
        font-size: 14px;
      }
    }
  }
  .detail{
    padding: 5px 10px;
    .right{
      float: right;
    }
    .rate{
      color:#EA5A49
    }
    .avatarUrl{
      width: 20px;
      height: 20px;
      border-radius: 50%;
      vertical-align: middle;
    }
  }
  .tags{
    .badge{
      display: inline-block;
      margin: 5px;
      padding: 0 6px;
      border-radius: 10px;
      border: 1px solid #EA5A49;
      color: #EA5A49;
      font-size:28rpx
    }
  }
  .summary{
    margin-top: 10px;
    padding: 0 15px;
    p{
      text-indent: 2em;
      font-size:34rpx;
      line-height: 60rpx;
    }
  }
}
</style>