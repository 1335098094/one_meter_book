<template>
  <div class="swiper">
    <swiper :indicator-dots="true"
            indicator-color="#EA5149"
            :autoplay="true"
            :interval="6000"
            :duration="1000"
            :circular="true">
      <div v-for="(top, i) in imageUrl" :key="i">
        <swiper-item>
          <img @click="bookdetail(image)" v-for="(image, index) in top" :key="index" :src="image.image" mode="aspectFit" class="slider_image">
        </swiper-item>
      </div>
    </swiper>
  </div>
</template>

<script>
export default {
  props: {
    tops: {
      type: Array,
      default: []
    }
  },
  methods: {
    bookdetail (image) {
      wx.navigateTo({
        url: `/pages/detail/main?id=${image.id}`
      })
    },
    chunk (arr, size) { // 分割数组
      let arrlist = Array.from({ length: Math.ceil(arr.length / size) }, (v, i) =>
        arr.slice(i * size, i * size + size)
      )
      return arrlist
    }
  },
  computed: {
    imageUrl () {
      let res = this.tops
      return this.chunk(res, 3)
    }
  }
}
</script>

<style lang="less">
.swiper{
  margin-top: 5px;
  .slider_image{
    width: 33%;
    height: 250rpx;
  }
}
</style>