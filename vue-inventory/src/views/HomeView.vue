<template>
  <div class="home-container">
    <!-- 主页内容 -->
    <div class="hero-section">
      <h1 class="hero-title">轻松创建专业简历</h1>
      <p class="hero-description">使用我们的在线简历生成器，快速打造令人印象深刻的简历。</p>
      <router-link to="/template/select" class="hero-button">立即开始</router-link>
    </div>

    <!-- 功能介绍 -->
    <div class="features-section">
      <div class="feature">
        <i class="fas fa-file-alt"></i>
        <h3>多种模板选择</h3>
        <p>提供丰富的简历模板，满足不同行业和风格需求。</p>
      </div>
      <div class="feature">
        <i class="fas fa-pencil-alt"></i>
        <h3>便捷编辑</h3>
        <p>简单易用的编辑界面，让你轻松填写和修改简历内容。</p>
      </div>
      <div class="feature">
        <i class="fas fa-download"></i>
        <h3>快速导出</h3>
        <p>支持将简历保存为 PDF 或 Word 格式，方便分享和打印。</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  methods: {
    isLoggedIn() {
      return localStorage.getItem('token'); // 假设使用 token 验证登录状态
    },
    goToUserHome() {
      this.$router.push('/user/home');
    }
  }
};
</script>

<style scoped>
/* 英雄区域样式 */
.hero-section {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 400px;
  background-color: #f4f4f9;
  text-align: center;
}

.hero-title {
  font-size: 48px;
  margin-bottom: 20px;
  color: #333;
}

.hero-description {
  font-size: 18px;
  margin-bottom: 30px;
  color: #666;
}

.hero-button {
  background-color: #ff9900;
  color: white;
  padding: 15px 30px;
  border-radius: 5px;
  text-decoration: none;
  font-size: 18px;
  transition: background-color 0.3s ease;
}

.hero-button:hover {
  background-color: #e68a00;
}

/* 功能介绍区域样式 */
.features-section {
  display: flex;
  justify-content: center;
  gap: 40px;
  padding: 40px;
}

.feature {
  text-align: center;
  max-width: 300px;
}

.feature i {
  font-size: 48px;
  color: #ff9900;
  margin-bottom: 20px;
}

.feature h3 {
  font-size: 24px;
  margin-bottom: 10px;
  color: #333;
}

.feature p {
  color: #666;
}
</style>