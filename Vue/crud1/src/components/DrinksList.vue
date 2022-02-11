<template>
  <table class="table table-stripped table-bordered">
    <tr>
      <th><strong>Brand</strong></th>
      <th><strong>Name</strong></th>
      <th><strong> Quantity</strong></th>
      <th><strong> Volume</strong></th>
    </tr>

    <tr v-for="(drink, brand) in drinks" v-bind:key="brand">
      <td>{{ drink.brand }}</td>
      <td>{{ currentDrink.name }}</td>
      <td>{{ currentDrink.quantity }}</td>
      <td>{{ currentDrink.volume }}</td>
    </tr>

  </table>
</template>

<script>
import DrinkDataService from "../services/DrinkDataService";
export default {
  name: "drinks-list",
  data() {
    return {
      drinks: [],
      // currentDrink: null,
      // currentIndex: -1,
      // brand: "",
    };
  },
  methods: {
    retrieveDrinks() {
      DrinkDataService.getAll()
        .then((response) => {
          this.response = response.data;
          console.log(this.response.data);
        })
        .catch((e) => {
          console.log(e);
        });
    },
  },
  mounted() {
    this.retrieveDrinks();
  },
};
</script>
<style>

</style>
