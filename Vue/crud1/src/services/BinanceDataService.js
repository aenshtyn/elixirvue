import http from "../http-common";

class BinanceDataService {
  getAll() {
    return http.get("/");
  }
  // findByBrand(brand) {
  //   return http.get('/drinks?brand=${brand}');
  // }
}
export default new BinanceDataService();