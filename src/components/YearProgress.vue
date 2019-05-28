<template>
  <div class="YearProgress">
      <progress :percent="percent" active  activeColor="#EA5149" backgroundColor="#eee"/>
      <p class="text">{{year}}已经过去<span>{{days}}</span>天了，<span>{{percent}}</span>%</p>
  </div>
</template>
<script>
export default {
  name: 'YearProgress',
  computed: {
    year () {
      return new Date().getFullYear()
    },
    days () { // 已过去天数
      let start = new Date()
      start.setMonth(0) // 这一年的第一个月
      start.setDate(1) // 这一年的第一天
      // start就是这一年的第一天
      let offset = new Date().getTime() - start.getTime() // 计算时间差
      return parseInt(offset / 1000 / 60 / 60 / 24) + 1 // 给天数加一
    },
    percent () { // 进度
      return (this.days * 100 / this.isLeapYear()).toFixed(1)
    }
  },
  methods: {
    isLeapYear () { // 判断是否是闰年
      const year = new Date().getFullYear()
      if (year % 400 === 0) {
        return 366
      } else if (year % 4 === 0 && year % 100 !== 0) {
        return 366
      } else {
        return 365
      }
    }
  }
}
</script>
<style lang="less">
.YearProgress{
  width: 100%;
  height: 20rpx;
  margin-top: 40rpx;
  .text{
    span{
       color: #EA5149;
    }
    margin-top: 20rpx;
    text-align: center;
    font-size: 28rpx;
  }
}
</style>


