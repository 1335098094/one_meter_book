<template>
    <div class="rate">
      <span>☆☆☆☆☆</span>
      <div class="hollow" :style="style">
        ★★★★★
      </div>
    </div>
</template>
<script>
export default {
  nama: 'rate',
  props: {
    rate: {
      type: [String, Number],
      dafault: '0'
    }
  },
  computed: {
    style () {
      return `width:${this.rate / 2 * 0.83}em`
    }
  }
}
</script>
<style lang="less">
  .rate{
    position: relative;
    display: inline-block;
    .hollow{
      position: absolute;
      overflow: hidden;
      left: 0px;
      top:0px;
      width: 0px;
    }
  }
</style>



