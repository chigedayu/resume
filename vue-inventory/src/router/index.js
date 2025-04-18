import Vue from 'vue';
import VueRouter from 'vue-router';
import LoginPage from "@/views/LoginPage.vue";
import RegisterPage from "@/views/RegisterPage.vue";
import HomePage from "@/views/HomePage.vue";
import HomeView from "@/views/HomeView.vue";
import ChangeSkin from "@/views/TemplateSelectView.vue";
import TemplateSelectView from "@/views/TemplateSelectView.vue";
import Resume from "@/views/Resume.vue";
import HistoryResumes from "@/views/HistoryResumes.vue";

Vue.use(VueRouter);

const routes = [
  // 登录和注册页面不需要加校验标识
  { path: '/login', component: LoginPage },
  { path: '/register', component: RegisterPage },
  // 主页路由，没有设置 requiresAuth 标识
  { path: '/', component: HomeView },
  { path: '/template/select', component: TemplateSelectView },
  { path: '/resume', component: Resume }, // 添加简历编辑页路由
  { path: '/user/resumes', component: HistoryResumes } // 添加历史简历页路由
];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
});

router.beforeEach((to, from, next) => {
  // 检查要去的路由是否需要做登录认证
  if (to.matched.some(record => record.meta.requiresAuth)) {
    const isAuthenticated = checkAuth(); // 这里替换为你的认证检查逻辑
    if (!isAuthenticated) {
      // 未登录则重定向到登录页面
      next({
        path: '/login',
        query: { redirect: to.fullPath } // 登录后可以重定向回原页面
      });
    } else {
      // 已登录则放行
      next();
    }
  } else {
    // 不需要认证的路由直接放行
    next();
  }
});

// 校验当前用户是否已登录
function checkAuth() {
  return localStorage.getItem("token") !== null;
}

// 解决重复导航的问题
const originalPush = VueRouter.prototype.push;
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => {
    if (err.name !== 'NavigationDuplicated') throw err;
  });
};

export default router;