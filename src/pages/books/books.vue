<template>
    <div>
        <top-swiper :tops="tops" v-if="tops.length>0"></top-swiper>
        <card v-for="item in book" :key="item.id" :book='item'></card>
        <p class="text-footer" v-if="!more">—— 没有更多数据 ——</p>
    </div>
</template>

<script>
import { get } from '@/utils'
import Card from '@/components/card'
import TopSwiper from '@/components/TopSwiper'
export default {
  name: 'books',
  components: {
    Card,
    TopSwiper
  },
  data () {
    return {
      book: [],
      page: 0,
      more: true,
      timer: null,
      tops: []
    }
  },
  mounted () {
    this.getList()
    this.getTop()
  },
  methods: {
    async getList () { // 获取列表 init用于作为初始化标记
      wx.showNavigationBarLoading()
      const booklist = await get(`/weapp/booklist?page=${this.page}`)
      if (this.page === 0) {
        this.book = booklist.booklist
        wx.hideNavigationBarLoading()
      } else if (this.more) { // 如果有更多
        this.book = this.book.concat(booklist.booklist)
        wx.hideNavigationBarLoading()
      }
      if (booklist.booklist.length < 10) { // 每页10条数据，当小于10条时候
        this.more = false
      }
    },
    async getTop () {
      const top = await get(`/weapp/booktop`)
      this.tops = top.booktop
    }
  },
  chunk (arr, size) { // 分割数组
    Array.from({ length: Math.ceil(arr.length / size) }, (v, i) =>
      arr.slice(i * size, i * size + size)
    )
    return arr
    // 使用方法
    // chunk([1, 2, 3, 4, 5], 2) // [[1,2],[3,4],[5]]
  },
  onReachBottom () {
    if (this.more) { // 当有更多的时候采取加载，timer主要是为了防止抖动
      if (this.timer) {
        clearTimeout(this.timer)
      }
      this.timer = setTimeout(() => {
        this.page = this.page + 1
        this.getList()
      }, 16)
    }
  }
}
</script>

<style scoped>
.text-footer{
    text-align:center;
    font-size: 16px;
    margin: 14px 0px
}
</style>

