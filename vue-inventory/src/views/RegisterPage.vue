<template>
  <div class="register-container">
    <el-card class="register-card">
      <div class="register-title">注册</div>
      <el-form
          ref="registerForm"
          :model="registerForm"
          :rules="registerRules"
          @keyup.enter.native="handleRegister"
      >
        <el-form-item prop="username">
          <el-input
              v-model="registerForm.username"
              placeholder="请输入账户名"
              prefix-icon="el-icon-user"
              clearable
          />
        </el-form-item>

        <el-form-item prop="password">
          <el-input
              v-model="registerForm.password"
              type="password"
              placeholder="请输入密码"
              prefix-icon="el-icon-lock"
              show-password
              clearable
          />
        </el-form-item>

        <el-form-item prop="confirmPassword">
          <el-input
              v-model="registerForm.confirmPassword"
              type="password"
              placeholder="请确认密码"
              prefix-icon="el-icon-lock"
              show-password
              clearable
          />
        </el-form-item>

        <el-form-item>
          <el-button
              type="primary"
              :loading="loading"
              @click="handleRegister"
              style="width: 100%"
          >
            注册
          </el-button>
        </el-form-item>

        <div class="login-link">
          已有账号？<el-link type="primary" @click="goToLogin">立即登录</el-link>
        </div>
      </el-form>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'Register',
  data() {
    const validatePassword = (rule, value, callback) => {
      if (value !== this.registerForm.password) {
        callback(new Error('两次输入的密码不一致'))
      } else {
        callback()
      }
    }

    return {
      registerForm: {
        username: '',
        password: '',
        confirmPassword: ''
      },
      registerRules: {
        username: [
          { required: true, message: '请输入账户名', trigger: 'blur' },
          { min: 4, max: 20, message: '长度在 4 到 20 个字符', trigger: 'blur' },
          { pattern: /^[a-zA-Z0-9_]+$/, message: '只能包含字母、数字和下划线', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 6, max: 20, message: '长度在 6 到 20 个字符', trigger: 'blur' },
          { pattern: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^]{6,20}$/,
            message: '必须包含大小写字母和数字',
            trigger: 'blur'
          }
        ],
        confirmPassword: [
          { required: true, message: '请确认密码', trigger: 'blur' },
          { validator: validatePassword, trigger: 'blur' }
        ]
      },
      loading: false
    }
  },
  methods: {
    handleRegister() {
      // 防重复提交
      if (this.loading) {
        this.$message.warning('请求正在处理, 请稍等')
        return
      }
      this.$refs.registerForm.validate(valid => {
        if (valid) {
          this.loading = true
          // 发送注册请求
          this.$http.post('/user/register', this.registerForm)
              .then(result => {
                this.$message.success('注册成功')
                // 注册成功后自动登录或跳转到登录页
                this.goToLogin()
              })
              .finally(() => {
                this.loading = false
              })
        }
      })
    },
    goToLogin() {
      this.$router.push('/login')
    }
  }
}
</script>

<style scoped>
.register-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f5f7fa;
}

.register-card {
  width: 400px;
  padding: 20px;
}

.register-title {
  font-size: 24px;
  text-align: center;
  margin-bottom: 30px;
  color: #409EFF;
}

.login-link {
  text-align: center;
  margin-top: 15px;
  font-size: 14px;
  color: #909399;
}
</style>