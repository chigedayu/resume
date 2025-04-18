<template>
  <div class="login-container">
    <el-card class="login-card">
      <div class="login-title">登录</div>
      <el-form
          ref="loginForm"
          :model="loginForm"
          :rules="loginRules"
          @keyup.enter.native="handleLogin"
      >
        <el-form-item prop="username">
          <el-input
              v-model="loginForm.username"
              placeholder="用户名"
              prefix-icon="el-icon-user"
          />
        </el-form-item>

        <el-form-item prop="password">
          <el-input
              v-model="loginForm.password"
              type="password"
              placeholder="密码"
              prefix-icon="el-icon-lock"
              show-password
          />
        </el-form-item>

        <el-form-item>
          <el-button
              type="primary"
              :loading="loading"
              @click="handleLogin"
              style="width: 100%"
          >
            登录
          </el-button>
        </el-form-item>
      </el-form>
      <div class="register-link">
        没有账号？<el-link type="primary" @click="goToRegister">立即注册</el-link>
      </div>
    </el-card>
  </div>
</template>

<script>
import { eventBus } from '../event-bus.js';


export default {
  name: 'Login',
  data() {
    return {
      loginForm: {
        username: '',
        password: ''
      },
      loginRules: {
        username: [
          { required: true, message: '请输入用户名', trigger: 'blur' },
          { min: 3, max: 20, message: '长度在 3 到 20 个字符', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 5, max: 20, message: '长度在 5 到 20 个字符', trigger: 'blur' }
        ]
      },
      loading: false
    }
  },
  methods: {
    handleLogin() {
      // 防止重复点击
      if (this.loading) {
        return
      }
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          this.loading = true
          // 发送http-post请求给后端
          this.$http.post('/user/login', this.loginForm)
              .then(data => {
                // 存储用户信息, 这里的data可以看作后端返回的user
                // 把用户名、角色、头像存储在浏览器 => 被页面共享
                localStorage.setItem("username", data.username)
                localStorage.setItem("role", data.role)
                localStorage.setItem("avatar", data.avatar)
                // 把token存储在浏览器, 用于被http请求携带
                localStorage.setItem("token", data.token)
                eventBus.$emit('loginSuccess');
                // 跳转到主页
                this.$router.replace("/")
              })
              .catch((error) => {
              })
              .finally(() => {
                this.loading = false
              })
        } else {
          return false
        }
      })
    },
    goToRegister() {
      this.$router.push('/register')
    }
  }
}
</script>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f5f7fa;
}

.login-card {
  width: 400px;
  padding: 20px;
}

.login-title {
  font-size: 24px;
  text-align: center;
  margin-bottom: 30px;
  color: #409EFF;
}

.register-link {
  text-align: center;
  margin-top: 15px;
  font-size: 14px;
  color: #909399;
}
</style>