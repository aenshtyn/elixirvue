import axios from "axios";
export default axios.create({
  baseURL: "http://localhost:4000/api/v1/",

  // baseURL: "https://api2.binance.com/api/v3/ticker/24hr",

  // baseURL: "https://get.geojs.io/v1/ip/country.json",

  headers: {
    "Content-type": "application/json"
  }
});