<template>
  <div v-if="currentDrink" class="edit-form">
    <h4>Drink</h4>
    <form>
      <div class="form-group">
        <label for="brand">Brand</label>
        <input type="text" class="form-control" id="brand"
          v-model="currentDrink.brand"
        />
      </div>
      <div class="form-group">
        <label for="name">Name</label>
        <input type="text" class="form-control" id="name"
          v-model="currentDrink.name"
        />
      </div>

           <div class="form-group">
        <label for="name">Quantity</label>
        <input type="text" class="form-control" id="name"
          v-model="currentDrink.quantity"
        />
           </div>

             <div class="form-group">
        <label for="name">Volume</label>
        <input type="text" class="form-control" id="name"
          v-model="currentDrink.volume"
        />
             </div>
      <!-- <div class="form-group">
        <label><strong>Status:</strong></label>
        {{ currentDrink.published ? "Published" : "Pending" }}
      </div> -->
    </form>
    <!-- <button class="badge badge-primary mr-2"
      v-if="currentDrink.published"
      @click="updatePublished(false)"
    >
      UnPublish
    </button>
    <button v-else class="badge badge-primary mr-2"
      @click="updatePublished(true)"
    >
      Publish
    </button>
    <button class="badge badge-danger mr-2"
      @click="deleteDrink"
    >
      Delete
    </button>
    <button type="submit" class="badge badge-success"
      @click="updateDrink"
    >
      Update
    </button>
    <p>{{ message }}</p> -->
  </div>
  <div v-else>
    <br />
    <p>Please click on a Drink...</p>
  </div>
</template>
<script>
import DrinkDataService from "../services/DrinkDataService";
export default {
  name: "drink",
  data() {
    return {
      currentDrink: null,
      message: ''
    };
  },
  methods: {
    getDrink(id) {
      DrinkDataService.get(id)
        .then(response => {
          this.currentDrink = response.data;
          console.log(response.data);
        })
        .catch(e => {
          console.log(e);
        });
    },
    updatePublished(status) {
      var data = {
        id: this.currentDrink.id,
        brand: this.currentDrink.brand,
        name: this.currentDrink.name,
        published: status
      };
      DrinkDataService.update(this.currentDrink.id, data)
        .then(response => {
          console.log(response.data);
          this.currentDrink.published = status;
          this.message = 'The status was updated successfully!';
        })
        .catch(e => {
          console.log(e);
        });
    },
    updateDrink() {
      DrinkDataService.update(this.currentDrink.id, this.currentDrink)
        .then(response => {
          console.log(response.data);
          this.message = 'The Drink was updated successfully!';
        })
        .catch(e => {
          console.log(e);
        });
    },
    deleteDrink() {
      DrinkDataService.delete(this.currentDrink.id)
        .then(response => {
          console.log(response.data);
          this.$router.push({ name: "drinks" });
        })
        .catch(e => {
          console.log(e);
        });
    }
  },
  mounted() {
    this.message = '';
    this.getDrink(this.$route.params.id);
  }
};
</script>
<style>
.edit-form {
  max-width: 300px;
  margin: auto;
}
</style>