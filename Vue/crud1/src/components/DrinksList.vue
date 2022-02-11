<template>
  <div class="list row">
    <div class="col-md-6">
      <h4>Drinks List</h4>
      <ul class="list-group">
        <li class="list-group-item"
          :class="{ active: index == currentIndex }"
          v-for="(drink, index) in drinks"
          :key="index"
          @click="setActiveDrink(drink, index)"
        >
          {{ drink.brand }}
        </li>
      </ul>
    </div>
    <div class="col-md-6">
      <div v-if="currentDrink">
        <h4>Drink</h4>
        <div>
          <label><strong>Brand:</strong></label> {{ currentDrink.brand }}
        </div>
        <div>
          <label><strong>Name:</strong></label> {{ currentDrink.name }}
        </div>
          <div>
          <label><strong>Quantity:</strong></label> {{ currentDrink.quantity }}
        </div>
          <div>
          <label><strong>Volume:</strong></label> {{ currentDrink.volume }}
        </div>

        <router-link :to="'/drinks/' + currentDrink.id" class="badge badge-warning">Edit</router-link>
      </div>

    </div>
  </div>
</template>


<script>
import DrinkDataService from "../services/DrinkDataService";
export default {
  name: "drinks-list",
  data() {
    return {
      drinks: [],
      currentDrink: null,
      currentIndex: -1,
      brand: ""
    };
  },
  methods: {
    retrieveDrinks() {
      DrinkDataService.getAll()
        .then(response => {
          this.response = response.data;
          console.log(this.response.data);
        })
        .catch(e => {
          console.log(e);
        });
    },
    refreshList() {
      this.retrieveDrinks();
      this.currentDrink = null;
      this.currentIndex = -1;
    },
    setActiveDrink(drink, index) {
      this.currentDrink = drink;
      this.currentIndex = drink ? index : -1;
    },
    
    searchBrand() {
      DrinkDataService.findByBrand(this.brand)
        .then(response => {
          this.drinks = response.data;
          this.setActiveDrink(null);
          console.log(response.data);
        })
        .catch(e => {
          console.log(e);
        });
    }
  },
  mounted() {
    this.retrieveDrinks();
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