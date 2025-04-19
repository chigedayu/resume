<template>
  <div id="app" :class="selectedTemplate">
    <div class="nav-bar-container">
      <NavBar />
    </div>
    <!-- 确保传递 resume 属性，并监听自定义事件 -->
    <router-view :resume="resume" :mode="mode"
                 @changeResume="changeResume"
                 @addItem="addItem"
                 @deleteItem="deleteItem"
                 @saveImg="saveImg"/>
  </div>
</template>

<script>
import NavBar from './components/NavBar.vue';
import defaultResume from '@/js/defaultResume.js'; // 导入默认简历数据
import { eventBus } from '@/event-bus.js'; // 引入事件总线

export default {
  name: 'App',
  components: {
    NavBar
  },
  data() {
    return {
      resume: defaultResume, // 初始化 resume 数据
      mode: 'edit', // 假设 mode 为 edit
      selectedTemplate: 'default' // 默认模板为 default
    };
  },
  created() {
    // 获取路由中的模板名称
    const template = this.$route.query.template;
    if (template) {
      this.selectedTemplate = template;
    }

    // 监听模板选择事件
    eventBus.$on('templateSelected', (templateName) => {
      this.selectedTemplate = templateName;
    });
  },
  watch: {
    // 监听路由变化，更新所选模板
    '$route.query.template': {
      immediate: true,
      handler(newTemplate) {
        if (newTemplate) {
          this.selectedTemplate = newTemplate;
        }
      }
    }
  },
  methods: {
    changeResume(key, ev) {
      const value = ev.target.innerText;
      // 由于传过来的 skills[0].name 是个字符串,所以要用 eval 做处理
      eval(`this.resume.${key}=value`);
    },
    addItem(key) {
      const data = this.resume[key][this.resume[key].length - 1];
      this.resume[key].push(JSON.parse(JSON.stringify(data)));
    },
    deleteItem(key, i) {
      this.resume[key].splice(i, 1);
    },
    saveImg(ev) {
      let file = ev.target.files[0];
      console.log(file);
      if (file.size > 5242880) {
        alert('图片大小限制 5mb 以内');
        return;
      }
      // 这里需要实现保存图片的逻辑
    }
  }
};
</script>
