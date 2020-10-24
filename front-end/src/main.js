import Vue from 'vue'
import './plugins/bootstrap-vue'
import App from './App.vue'
import router from './router'
import store from './store'
import VueSweetalert2 from 'vue-sweetalert2';


Vue.config.productionTip = false

Vue.use(VueSweetalert2);

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

Vue.filter('capitalize', function (value) {
  if (typeof value !== "number") {
      return value;
  }
  var formatter = new Intl.NumberFormat('vi-VN', {
      style: 'currency',
      currency: 'VND',
      minimumFractionDigits: 0
  });
  return formatter.format(value);
})

Vue.filter('date', function (value) {
  const d = new Date(value);
  return d.getDate() + '-'+ d.getMonth()+1 + '-'+ d.getFullYear()
})