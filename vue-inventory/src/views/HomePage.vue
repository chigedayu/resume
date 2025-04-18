<template>
  <el-container class="home-container">
    <!-- 左侧菜单 -->
    <el-aside width="200px" class="aside-menu">
      <div class="logo-area">
        <span>智能进销存管理系统</span>
      </div>

      <el-menu
          :default-active="activeMenu"
          class="el-menu-vertical"
          background-color="#304156"
          text-color="#bfcbd9"
          active-text-color="#409EFF"
          :collapse="isCollapse"
          :router="true"
      >
        <!-- 用户管理 -->
        <el-submenu index="1">
          <template slot="title">
            <i class="el-icon-user"></i>
            <span>用户管理</span>
          </template>
          <el-menu-item index="/user/list" :route="{ path: '/user/list' }">
            <i class="el-icon-menu"></i>
            <span>用户列表</span>
          </el-menu-item>
          <el-menu-item index="/user/role" :route="{ path: '/user/role' }">
            <i class="el-icon-setting"></i>
            <span>角色管理</span>
          </el-menu-item>
        </el-submenu>

        <!-- 商品管理 -->
        <el-submenu index="2">
          <template slot="title">
            <i class="el-icon-goods"></i>
            <span>商品管理</span>
          </template>
          <el-menu-item index="/product/list" :route="{ path: '/product/list' }">
            <i class="el-icon-menu"></i>
            <span>商品列表</span>
          </el-menu-item>
          <el-menu-item index="/product/category" :route="{ path: '/product/category' }">
            <i class="el-icon-collection"></i>
            <span>商品分类</span>
          </el-menu-item>
        </el-submenu>

        <!-- 采购管理 -->
        <el-submenu index="3">
          <template slot="title">
            <i class="el-icon-shopping-cart-2"></i>
            <span>采购管理</span>
          </template>
          <el-menu-item index="/purchase/order" :route="{ path: '/purchase/order' }">
            <i class="el-icon-document"></i>
            <span>采购订单</span>
          </el-menu-item>
          <el-menu-item index="/purchase/supplier" :route="{ path: '/purchase/supplier' }">
            <i class="el-icon-office-building"></i>
            <span>供应商管理</span>
          </el-menu-item>
        </el-submenu>

        <!-- 销售管理 -->
        <el-submenu index="4">
          <template slot="title">
            <i class="el-icon-sell"></i>
            <span>销售管理</span>
          </template>
          <el-menu-item index="/sale/order" :route="{ path: '/sale/order' }">
            <i class="el-icon-tickets"></i>
            <span>销售订单</span>
          </el-menu-item>
          <el-menu-item index="/sale/customer" :route="{ path: '/sale/customer' }">
            <i class="el-icon-user-solid"></i>
            <span>客户管理</span>
          </el-menu-item>
          <el-menu-item index="/sale/statistics" :route="{ path: '/sale/statistics' }">
            <i class="el-icon-data-line"></i>
            <span>销售统计</span>
          </el-menu-item>
        </el-submenu>
      </el-menu>
    </el-aside>

    <!-- 右侧内容区 -->
    <el-container>
      <!-- 顶部导航栏 -->
      <el-header class="header">
        <div class="header-left">
          <el-button
              type="text"
              :icon="isCollapse ? 'el-icon-s-unfold' : 'el-icon-s-fold'"
              @click="toggleCollapse"
          ></el-button>
          <el-breadcrumb separator="/" class="breadcrumb">
            <el-breadcrumb-item v-for="item in breadcrumbList" :key="item.path">
              {{ item.meta.title || item.name }}
            </el-breadcrumb-item>
          </el-breadcrumb>
        </div>

        <div class="header-right">
          <el-dropdown @command="handleCommand">
            <div class="user-info">
              <el-avatar :size="30" :src="userAvatar"></el-avatar>
              <span class="user-name">{{ userName }}</span>
              <i class="el-icon-arrow-down el-icon--right"></i>
            </div>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item command="profile">个人中心</el-dropdown-item>
              <el-dropdown-item command="settings">系统设置</el-dropdown-item>
              <el-dropdown-item divided command="logout">退出登录</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </div>
      </el-header>

      <!-- 主内容区 -->
      <el-main class="main-content">
        <router-view></router-view>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
export default {
  name: 'Home',
  data() {
    return {
      isCollapse: false,
      userAvatar: require('@/assets/logo.png'), // 默认头像
      userName: '管理员',
      breadcrumbList: []
    }
  },
  computed: {
    activeMenu() {
      const route = this.$route
      const { meta, path } = route
      if (meta.activeMenu) {
        return meta.activeMenu
      }
      return path
    }
  },
  watch: {
    $route() {
      this.getBreadcrumb()
    }
  },
  created() {
    this.getBreadcrumb()
    // 这里可以添加获取用户信息的逻辑
    // this.getUserInfo()
  },
  methods: {
    toggleCollapse() {
      this.isCollapse = !this.isCollapse
    },
    handleCommand(command) {
      if (command === 'logout') {
        this.logout()
      } else if (command === 'profile') {
        this.$router.push('/profile')
      } else if (command === 'settings') {
        this.$router.push('/settings')
      }
    },
    logout() {
      //弹出是否确认退出登录的确认框
      this.$confirm('确定要退出登录吗?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        // 清除localStorage中的登录状态
        localStorage.removeItem('user')
        // 跳转到登录页
        this.$router.push('/register')
        this.$message.success('退出成功')
      }).catch(() => {})
    },
    getBreadcrumb() {
      let matched = this.$route.matched.filter(item => item.name)
      const first = matched[0]
      if (first && first.name !== 'Home') {
        matched = [{ path: '/home', meta: { title: '首页' }}].concat(matched)
      }
      this.breadcrumbList = matched
    }
  }
}
</script>

<style scoped>
.home-container {
  height: 100vh;
}

.aside-menu {
  background-color: #304156;
  transition: width 0.3s;
}

.el-menu-vertical:not(.el-menu--collapse) {
  width: 200px;
  min-height: 400px;
}

.logo-area {
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #fff;
  font-size: 18px;
  font-weight: bold;
  background-color: #2b2f3a;
}

.header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 20px;
  background-color: #fff;
  box-shadow: 0 1px 4px rgba(0, 21, 41, 0.08);
}

.header-left {
  display: flex;
  align-items: center;
}

.breadcrumb {
  margin-left: 20px;
}

.user-info {
  display: flex;
  align-items: center;
  cursor: pointer;
}

.user-name {
  margin: 0 10px;
}

.main-content {
  background-color: #f0f2f5;
  padding: 20px;
  min-height: calc(100vh - 60px);
}
</style>