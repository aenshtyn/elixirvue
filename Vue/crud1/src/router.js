import { createWebHistory, createRouter } from "vue-router";
const routes = [
    {
        path: "/",
        alias: "/drinks",
        name: "drinks",
        component: () => import("./components/DrinksList")
    },

    {
        path: "/drinks/:id",
        name: "drink_details",
        component: () => import("./components/Drink")
    }
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;
