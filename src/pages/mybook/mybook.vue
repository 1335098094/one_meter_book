<template>
<div>
  <card v-for="item in book" :key="item.id" :book='item' type="my" @deletef="deletef()"></card>
</div>
</template>

<script>
import { get } from '@/utils'
import Card from '@/components/card'
export default {
  name: 'mybook',
  data () {
    return {
      book: []
    }
  },
  components: {
    Card
  },
  mounted () {
    this.getMybook()
  },
  methods: {
    async getMybook () {
      const booklist = await get(`/weapp/booklist?openid=${this.$root.$mp.query.openid}`)
      this.book = booklist.booklist
    },
    deletef () {
      this.getMybook()
    }
  }
}
</script>
<style lang="less">

</style>


