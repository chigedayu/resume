<template>
  <div class="navbar">
    <router-link to="/" class="logo">在线简历生成器</router-link>
    <div class="nav-links">
      <template v-if="!isLoggedIn()">
        <router-link to="/login" class="nav-button">登录</router-link>
        <router-link to="/register" class="nav-button">注册</router-link>
      </template>
      <template v-else>
        <div class="user-avatar-container">
          <img :src="userAvatar" alt="用户头像" class="user-avatar" @click="toggleDropdown">
          <div v-if="isDropdownVisible" class="dropdown-menu">
            <p class="dropdown-username">{{ username }}</p>
            <router-link to="/user/home" @click="toggleDropdown">用户主页</router-link>
            <router-link to="/user/resumes" @click="toggleDropdown">历史简历</router-link>
            <a href="#" @click.prevent="logout">退出登录</a>
          </div>
        </div>
      </template>
    </div>
  </div>
</template>

<script>
import { eventBus } from '../event-bus.js';

export default {
  data() {
    return {
      userAvatar: require('@/assets/logo.png'),
      isDropdownVisible: false,
      username: localStorage.getItem('username')
    };
  },
  methods: {
    isLoggedIn() {
      const token = localStorage.getItem('token');
      return token !== null && token !== '';
    },
    toggleDropdown() {
      this.isDropdownVisible = !this.isDropdownVisible;
    },
    logout() {
      localStorage.removeItem('token');
      localStorage.removeItem('username');
      this.isDropdownVisible = false;
      this.$router.push('/');
    },
    handleStorageChange() {
      this.username = localStorage.getItem('username');
    }
  },
  created() {
    // 手动检查 token 值
    if (this.isLoggedIn()) {
      this.username = localStorage.getItem('username');
    }
    // 监听用户信息更新事件
    this.$root.$on('userInfoUpdated', (avatar) => {
      this.userAvatar = avatar;
    });
    // 监听用户名更新事件
    this.$root.$on('usernameUpdated', (newUsername) => {
      this.username = newUsername;
    });
    // 监听登录成功事件
    eventBus.$on('loginSuccess', () => {
      this.username = localStorage.getItem('username');
      // 强制更新组件
      this.$forceUpdate();
    });
  },
  mounted() {
    // 监听本地存储的变化
    window.addEventListener('storage', this.handleStorageChange);
  },
  beforeDestroy() {
    // 移除事件监听器
    window.removeEventListener('storage', this.handleStorageChange);
    eventBus.$off('loginSuccess');
  }
};
</script>

<style scoped>
/* 导航栏样式 */
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px 40px;
  background-color: #333;
  color: white;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 100;
}

@media print {
  .navbar {
    display: none !important;
  }
}

.logo {
  font-size: 24px;
  font-weight: bold;
  color: white;
  text-decoration: none;
}

.nav-links {
  display: flex;
  gap: 20px;
}

.nav-button {
  background-color: #ff9900;
  color: white;
  padding: 10px 20px;
  border-radius: 5px;
  text-decoration: none;
  transition: background-color 0.3s ease;
}

.nav-button:hover {
  background-color: #e68a00;
}

.user-avatar-container {
  position: relative;
}

.user-avatar {
  width: 30px;
  height: 30px;
  border-radius: 50%;
  cursor: pointer;
}

.dropdown-menu {
  position: absolute;
  top: 100%;
  right: 0;
  background-color: #fff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  border-radius: 4px;
  padding: 10px 0;
  min-width: 120px;
  z-index: 10;
}

.dropdown-username {
  padding: 8px 20px;
  color: #333;
  font-weight: bold;
  border-bottom: 1px solid #eee;
  margin-bottom: 5px;
}

.dropdown-menu a,
.dropdown-menu router-link {
  display: block;
  padding: 8px 20px;
  color: #333;
  text-decoration: none;
  transition: background-color 0.3s ease;
}

.dropdown-menu a:hover,
.dropdown-menu router-link:hover {
  background-color: #f4f4f9;
}
</style>