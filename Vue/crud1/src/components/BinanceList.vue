<template>
  <div class="list row">
    <div class="col-md-8">
    </div>
    <div class="col-md-6">
      <h4>Coin List</h4>
      <ul class="list-group">
        <li class="list-group-item"
          :class="{ active: index == currentIndex }"
          v-for="(coin, index) in coins"
          :key="index"
          @click="setActiveCoin(coin, index)"
        >
          {{ coin.symbol }}
        </li>
      </ul>
    </div>
    <div class="col-md-6">
      <div v-if="currentCoin">
        <h4>Coin</h4>
        <div>
          <label><strong>Symbol:</strong></label> {{ currentCoin.symbol }}
        </div>
        <div>
          <label><strong>Price Change:</strong></label> {{ currentCoin.priceChange }}
        </div>
          <!-- <div>
          <label><strong>Quantity:</strong></label> {{ currentCoin.quantity }}
        </div>
          <div>
          <label><strong>Volume:</strong></label> {{ currentCoin.volume }}
        </div> -->

        <router-link :to="'/coins/' + currentCoin.id" class="badge badge-warning">Edit</router-link>
      </div>

    </div>
  </div>
</template>


<script>
import BinanceDataService from "../services/BinanceDataService";
export default {
  name: "coins-list",
  data() {
    return {
      coins: [],
      currentCoin: null,
      currentIndex: -1,
      brand: ""
    };
  },
  methods: {
    retrieveCoins() {
      BinanceDataService.getAll()
        .then(response => {
          this.Coins = response.data;
          console.log(response.data);
        })
        .catch(e => {
          console.log(e);
        });
    },

    setActiveCoin(coin, index) {
      this.currentCoin = coin;
      this.currentIndex = coin ? index : -1;
    },
    
  },
  mounted() {
    this.retrieveCoins();
  }
};
</script>
<style>
.list {
  text-align: left;
  max-width: 750px;
  margin: auto;
}
</style>