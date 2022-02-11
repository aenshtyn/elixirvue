import http from "../http-common";

class DrinkDataService {
  getAll() {
    return http.get("/drinks");
  }
  get(id) {
    return http.get(`/drinks/${id}`);
  }
  create(data) {
    return http.post("/drinks", data);
  }
  update(id, data) {
    return http.put(`/drinks/${id}`, data);
  }
  delete(id) {
    return http.delete(`/drinks/${id}`);
  }
  // findByBrand(brand) {
  //   return http.get('/drinks?brand=${brand}');
  // }
}
export default new DrinkDataService();