import Vue from 'vue'
import App from './App.vue'
import router from './router'
import './css/style.css';
import './css/pink_skin.css';
import './css/blue_skin.css';
import './css/gray_skin.css';
import './css/style2.css';

Vue.config.productionTip = false
// 导入ElementUI组件库
import ElementUI from 'element-ui';
// 导入element-ui的css样式文件
import 'element-ui/lib/theme-chalk/index.css';
// 注册ElementUI组件库
Vue.use(ElementUI);

import instance from "@/util/request";
Vue.prototype.$http = instance

const app = new Vue({
  components:{

  },
  data: {

  },
  methods: {
    changeResume(key, ev) {
      const value = `ev.target.innerText`;

      //key === 'skills[0].name'
      //由于传过来的 skills[0].name 是个字符串,所以要用eval做处理
      eval(`this.resume.${key}=${value}`);
    },
    saveImg(ev){
      //console.log(ev)
      let file = ev.target.files[0];
      console.log(file)
      if (file.size > 5242880) {
        alert('图片大小限制5mb以内');
        return;
      }
      let avFile = new AV.File(file.name, file).save().then(data=>app.resume.imgUrl=data.thumbnailURL(200, 200),error=>{
        console.log(error);
      });
    },
    addItem(key){
      const data = this.resume[key][this.resume[key].length-1];
      this.resume[key].push(JSON.parse(JSON.stringify(data)));
    },
    deleteItem(key,i){
      this.resume[key].splice(i,1);
    },
    clickSaveBtn() {
      if (this.currentUser) {
        this.saveData(this.currentUser).then(()=>swal("成功保存到云端！",'',"success"),()=>{swal("保存失败！", '',"error");});
      } else {
        this.isLogin = true;
      }
    },
  }
});

new Vue({
  router,
  render: function (h) { return h(App) }
}).$mount('#app')
